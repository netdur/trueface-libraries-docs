# SDK

The `SDK` class is the main entry point. It owns native resources, so always close it (`AutoCloseable`) or call `destroy()` when you're done.

```java
try (SDK sdk = new SDK(context, options)) {
    sdk.setLicense(token);
    // work
}
```

---

## Lifecycle

### `public SDK(Context context)`
Construct with default configuration.

### `public SDK(Context context, ConfigurationOptions options)`
Construct with custom configuration. Models in app assets are copied into private storage and the path is set on `options.modelsPath` automatically.

### `public SDK(Context context, long pointer)`
Construct from an already-initialized native pointer.

### `public void setAutoDestroyOnGC(boolean autoDestroyOnGC)`
Toggle whether the SDK is destroyed on GC. Default is true.

### `public long getPointer()`
Get the native pointer.

### `public native void destroy()`
Release native resources.

### `public void close()`
Same as `destroy()`. Implements `AutoCloseable`.

---

## License and version

### `public boolean setLicense(String token)`
Apply a license token. Must be called before any inference. Returns whether the token is valid.

### `public boolean isLicensed()`
Whether the current token is valid.

### `public int getExpireTime()`
Remaining days the current token is valid for.

### `public String getVersion()`
Returns the underlying C++ SDK version.

### `public String getAndroidSDKVersion()`
Returns the Android wrapper version, e.g. `"5.3.0+5"`.

---

## Image preprocessing

All `preprocessImage` overloads return an [`Image`](/v3.0/android/Image). Always close or destroy the `Image` when finished.

### `public Image preprocessImage(String path)`
Load from a JPEG, JPG, PNG, BMP, or TIFF file. The path must not contain `~`.

### `public Image preprocessImage(android.media.Image image)`
Wrap a camera frame. Internally converts YUV_420_888 to NV12.

### `public Image preprocessImage(Bitmap bitmap)`
Wrap a Bitmap assuming RGBA color order.

### `public Image preprocessImage(Bitmap bitmap, ColorCode color)`
Wrap a Bitmap with an explicit color space. YUV codes are not supported for Bitmap input.

### `public Image preprocessImage(int width, int height, byte[] data, ColorCode colorCode)`
Wrap raw bytes in any supported [`ColorCode`](/v3.0/android/ColorCode).

### `public Image preprocessImage(int width, int height, byte[] data)`
Wrap raw bytes assuming `yuv_i420`.

### `public static byte[] convertToI420(android.media.Image image)`
Helper: convert a `YUV_420_888` camera frame to I420 bytes.

### `public static byte[] convertToNV12(android.media.Image image)`
Helper: convert a `YUV_420_888` camera frame to NV12 bytes.

---

## Face detection and landmarks

### `public FaceBoxAndLandmarks detectLargestFace(Image image)`
Detect the single largest face. Returns null if none found.

### `public FaceBoxAndLandmarks[] detectFaces(Image image)`
Detect every face. Filter results with `score < 0.90` to reduce false positives toward zero.

### `public Point[] getFaceLandmarks(Image image, FaceBoxAndLandmarks face)`
Get the 106-point landmark set for a detected face.

### `public Facechip extractAlignedFace(Image image, FaceBoxAndLandmarks face)`
Align and crop the face to a [`Facechip`](/v3.0/android/Facechip), the input format for feature extraction and quality APIs.

### `public RotateFlags getFaceImageRotation(Image image)`
Detect the rotation needed to bring the largest face to upright. Useful for offline pipelines; skip in live video.

---

## Feature extraction and matching

### `public Faceprint getLargestFaceFeatureVector(Image image)`
Detect the largest face and return its feature vector in one call.

### `public Faceprint getFaceFeatureVector(Image image, FaceBoxAndLandmarks face)`
Extract a feature vector for an already-detected face.

### `public SimilarityResult getSimilarity(Faceprint fp1, Faceprint fp2)`
Compare two faceprints. Returns a similarity measure and a calibrated match probability.

### `public native String faceprintToJson(Faceprint faceprint)`
Serialize a faceprint to JSON.

### `public native Faceprint jsonToFaceprint(String jsonStr)`
Deserialize a faceprint from JSON.

---

## Quality

### `public FaceImageQualityResult estimateFaceImageQuality(Facechip chip)`
Visual quality of the aligned face. Threshold ~0.999 is suggested for enrollment.

### `public FaceTemplateQualityResult estimateFaceTemplateQuality(Facechip chip)`
Biometric utility of the face for recognition — independent of visual quality.

### `public FaceImageBlurDetectionResult detectFaceImageBlur(Facechip chip)`
Blur classification with a score.

### `public FaceImageExposureResult checkFaceImageExposure(Image image, FaceBoxAndLandmarks face)`
Over/under-exposure check with percentage breakdown.

---

## Attributes

### `public EstimateHeadOrientation estimateHeadOrientation(Image image, FaceBoxAndLandmarks face)`
Yaw / pitch / roll, plus rotation and translation vectors.

### `public BlinkState detectBlink(Image image, FaceBoxAndLandmarks face)`
Per-eye blink state, score, and eye aspect ratio.

### `public MaskDetectionResult detectMask(Image image, FaceBoxAndLandmarks face)`
Mask classification.

### `public GlassesDetectionResult detectGlasses(Image image, FaceBoxAndLandmarks face)`
Eyeglass classification.

---

## Spoof detection

### `public ErrorCode checkSpoofImageFaceSize(Image image, FaceBoxAndLandmarks face, ActiveSpoofStage stage)`
Validate face size before running active spoof. In the far stage, the face should be ~18 inches from the camera; in the near stage, 7–8 inches. Returns `NO_ERROR` if eligible, `FACE_TOO_CLOSE` / `FACE_TOO_FAR` otherwise.

### `public Spoof detectActiveSpoof(Point[] nearLandmarks, Point[] farLandmarks)`
Active spoof using paired near/far landmark sets. Default spoof score threshold is 1.05.

### `public Spoof detectSpoof(Image image, FaceBoxAndLandmarks face)`
Passive spoof detection with the default threshold (0.75).

### `public Spoof detectSpoof(Image image, FaceBoxAndLandmarks face, float threshold)`
Passive spoof with a custom threshold.

---

## Object detection

### `public BoundingBox[] detectObjects(Image image)`
Run the 80-class object detector. Each result has `label` (an [`ObjectLabel`](/v3.0/android/ObjectLabel) enum), `probability`, `topLeft`, `width`, and `height`.

---

## Collections

A collection is a named set of faceprints with associated identities. The backing database is configured via [`ConfigurationOptions.dbms`](/v3.0/android/ConfigurationOptions) ([`DatabaseManagementSystem`](/v3.0/android/DatabaseManagementSystem) — `SQLITE`, `POSTGRESQL`, or `NONE` for in-memory).

### `public ErrorCode createDatabaseConnection(String connectionString)`
Open or create the backing database. For SQLite, this is a relative filename — the SDK places it inside `<app-files>/collections/`.

### `public ErrorCode createCollection(String name)`
Create a new collection. Must `loadCollection()` before enrolling.

### `public ErrorCode createLoadCollection(String name)`
Create-or-load: opens an existing collection or creates a new empty one.

### `public ErrorCode loadCollection(String name)`
Load an existing collection into memory.

### `public ErrorCode loadCollectionPersist(String name)`
Load persistently — keeps it resident across `loadCollection` calls on other collections.

### `public ErrorCode loadCollections(List<String> names)`
Load multiple collections at once.

### `public ErrorCode deleteCollection(String name)`
Drop a collection from the database.

### `public CollectionNamesResult getCollectionNames()`
All collections in the connected database.

### `public CollectionNamesResult getLoadedCollectionNames()`
Collections currently in memory.

### `public CollectionMetadataResult getCollectionMetadata(String name)`
Identity count, faceprint count, model used, encryption flag.

### `public CollectionIdentitiesResult getCollectionIdentities(String name)`
Map of identity strings to their enrolled UUIDs.

---

## Enrollment and identification

### `public EnrollmentResult enrollFaceprint(Faceprint fp, String identity, String collectionName)`
Add a faceprint under an identity. `collectionName` can be empty if only one collection is loaded. Returns the assigned UUID and an error code.

### `public ErrorCode removeByUUID(String UUID, String collectionName)`
Remove a single enrollment by its UUID.

### `public RemoveIdentityResult removeByIdentity(String identity, String collectionName)`
Remove every faceprint enrolled under an identity. Returns the count removed.

### `public Candidate identifyTopCandidate(Faceprint fp, float threshold, String collectionName)`
Best match above the threshold, or null.

### `public List<Candidate> identifyTopCandidates(Faceprint fp, int numCandidates, float threshold, String collectionName)`
Top-N matches above the threshold, ordered by descending similarity.
