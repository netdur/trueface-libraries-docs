# Android Guide

This guide covers the full Trueface SDK Android workflow: configuration, licensing, image preparation, detection, recognition, and identification.

## Input image

For reliable detection, use an image of at least **480 × 360** pixels. Each face should be at least **100 × 100** pixels for detection, and **200 × 200** pixels for landmark or feature extraction.

For real-time pipelines, lower resolutions reduce latency — keep enough pixels on the target face. Out-of-focus images hurt accuracy; ask the user to retry if quality is low.

Make sure the image is in upright orientation before passing it to the SDK. The SDK does not auto-rotate from EXIF — you rotate explicitly via [`Image.rotate(RotateFlags)`](/v3.0/android/RotateFlags).

## License

You need a license token from Trueface. Apply it to a constructed `SDK` instance:

```java
ConfigurationOptions options = new ConfigurationOptions();
SDK sdk = new SDK(getApplicationContext(), options);

boolean ok = sdk.setLicense(token);
if (!ok) {
    // license invalid or expired
}

if (sdk.isLicensed()) {
    int daysRemaining = sdk.getExpireTime();
}
```

## Configuration

`ConfigurationOptions` controls everything from model selection to module pre-initialization. Set it once at construction.

```java
ConfigurationOptions options = new ConfigurationOptions();
options.smallestFaceHeight = 120;
options.frModel = FacialRecognitionModel.TFV7;
options.fdModel = FaceDetectionModel.FAST;
options.useNNAPI = true;
options.modelsPath = "/data/data/your.app/models";

SDK sdk = new SDK(getApplicationContext(), options);
```

Common settings:

| Setting | Default | Notes |
|---|---|---|
| `smallestFaceHeight` | 20 | Min face height (px). `-1` adapts dynamically to image height. |
| `frModel` | `LITE_V2` | Recognition model. `TFV7` is most accurate; `LITE_V3` is best small model. |
| `fdModel` | `FAST` | Face detector. `ACCURATE` if you need higher recall on hard cases. |
| `useNNAPI` | `false` | Enable Android NNAPI acceleration where available. |
| `modelsPath` | (empty) | Where the SDK loads `.enc` model files from. |
| `initializeModule` | (all lazy) | Pre-initialize specific modules to avoid first-call latency. |

For unit tests, you can obtain a `Context` via `InstrumentationRegistry`:

```java
Context context = InstrumentationRegistry.getInstrumentation().getTargetContext();
```

## Preprocess the input

Wrap any source — YUV camera frame, `Bitmap`, byte array, or file path — into an [`Image`](/v3.0/android/Image) before running detection:

```java
// From a Bitmap
Bitmap bitmap = ...;
Image image = sdk.preprocessImage(bitmap);

// From a Bitmap with explicit colour space
Image image = sdk.preprocessImage(bitmap, ColorCode.rgba);

// From raw bytes (e.g. camera callback)
int width = ...;
int height = ...;
byte[] data = ...;
Image image = sdk.preprocessImage(width, height, data, ColorCode.yuv_i420);

// From a file
Image image = sdk.preprocessImage("/sdcard/photo.jpg");
```

Rotate to upright if the source orientation isn't already correct:

```java
int userRotation = frame.getRotationToUser();
Image image = sdk.preprocessImage(width, height, data, ColorCode.yuv_i420);
if (userRotation == 90)  image.rotate(RotateFlags.ROTATE_90_CLOCKWISE);
if (userRotation == 180) image.rotate(RotateFlags.ROTATE_180);
if (userRotation == 270) image.rotate(RotateFlags.ROTATE_90_COUNTERCLOCKWISE);
```

> **Important:** `Image` holds native memory. Call `image.destroy()` (or use try-with-resources — `Image` implements `AutoCloseable`) when done.

```java
try (Image image = sdk.preprocessImage(bitmap)) {
    // use image
}
```

## Detect faces

```java
FaceBoxAndLandmarks[] faces = sdk.detectFaces(image);
for (FaceBoxAndLandmarks face : faces) {
    Log.d(TAG, "top-left:  " + face.topLeft.x + ", " + face.topLeft.y);
    Log.d(TAG, "bot-right: " + face.bottomRight.x + ", " + face.bottomRight.y);
    Log.d(TAG, "score:     " + face.score);

    // 5-point landmarks: left eye, right eye, nose, left mouth corner, right mouth corner
    for (Point p : face.landmarks) {
        Log.d(TAG, p.x + ", " + p.y);
    }
}
```

For single-face flows (authentication, kiosk), use `detectLargestFace`:

```java
FaceBoxAndLandmarks face = sdk.detectLargestFace(image);
if (face != null) {
    // found
}
```

## 1:1 face comparison

`getSimilarity` returns both a raw similarity measure and a calibrated match probability:

```java
Image img1 = sdk.preprocessImage(bitmap1);
Faceprint fp1 = sdk.getLargestFaceFeatureVector(img1);

Image img2 = sdk.preprocessImage(bitmap2);
Faceprint fp2 = sdk.getLargestFaceFeatureVector(img2);

SimilarityResult result = sdk.getSimilarity(fp1, fp2);
boolean isSamePerson = result.similarityMeasure > 0.6f;
```

## 1:N identification

Identification searches a faceprint against an on-device collection. On Android, the backing database can be SQLite (default) or PostgreSQL.

### Create a collection

```java
ErrorCode err = sdk.createDatabaseConnection("fr.db");
if (err != ErrorCode.NO_ERROR) { /* handle */ }

err = sdk.createLoadCollection("staff");
if (err != ErrorCode.NO_ERROR) { /* handle */ }
```

### Enroll faceprints

```java
List<Pair<String, String>> entries = new ArrayList<>();
entries.add(new Pair<>("armstrong_1.jpg", "armstrong"));
entries.add(new Pair<>("armstrong_2.jpg", "armstrong"));
entries.add(new Pair<>("bean.jpg", "bean"));

for (Pair<String, String> entry : entries) {
    Bitmap bitmap = getBitmapFromAsset(context, entry.first);
    try (Image image = sdk.preprocessImage(bitmap)) {
        Faceprint fp = sdk.getLargestFaceFeatureVector(image);
        if (fp != null) {
            EnrollmentResult result = sdk.enrollFaceprint(fp, entry.second, "staff");
            if (result.errorCode != ErrorCode.NO_ERROR) {
                // handle error
            }
            // result.UUID is the unique id of this enrollment
        }
    }
}
```

### Identify

```java
float threshold = 0.5f;

Candidate top = sdk.identifyTopCandidate(probeFaceprint, threshold, "staff");
if (top != null) {
    Log.d(TAG, "matched: " + top.identity);
}

List<Candidate> candidates = sdk.identifyTopCandidates(probeFaceprint, 10, threshold, "staff");
for (Candidate c : candidates) {
    Log.d(TAG, c.identity + " @ " + c.similarityMeasure);
}
```

## Object detection

`detectObjects` returns COCO-class bounding boxes. The `label` field is an [`ObjectLabel`](/v3.0/android/ObjectLabel) enum — use its `name()` for the string form.

```java
BoundingBox[] boxes = sdk.detectObjects(image);
for (BoundingBox box : boxes) {
    Log.d(TAG, box.label.name() + " @ " + box.probability);
}
```

## Attribute and quality APIs

Once you have a `FaceBoxAndLandmarks` or a `Facechip`, you can run any of the attribute APIs:

```java
MaskDetectionResult mask     = sdk.detectMask(image, face);
GlassesDetectionResult glass = sdk.detectGlasses(image, face);
BlinkState blink             = sdk.detectBlink(image, face);
EstimateHeadOrientation pose = sdk.estimateHeadOrientation(image, face);
Spoof spoof                  = sdk.detectSpoof(image, face);
```

For quality gating before recognition, extract the aligned face chip and run quality / blur:

```java
Facechip chip = sdk.extractAlignedFace(image, face);
FaceImageQualityResult quality = sdk.estimateFaceImageQuality(chip);
FaceImageBlurDetectionResult blur = sdk.detectFaceImageBlur(chip);
```

## Cleanup

`SDK` and `Image` both hold native memory. Both implement `AutoCloseable`:

```java
try (SDK sdk = new SDK(context, options)) {
    sdk.setLicense(token);
    // work
}
```

Or call `sdk.destroy()` explicitly when you're done with it.
