# Guide

## Table of Contents

- [Input image](/doc/android/guide)
- [License](../doc/android/guide#license)
- [Configuration](/doc/android/guide)
- [Prepare the input image](/doc/android/guide)
- [Process the image](/doc/android/guide)
- [Get information about detected faces](/doc/android/guide)
- [Object Detection](../doc/android/guide#object-detection)
- [Face Matching](../doc/android/guide#face-matching)
- [Face Recognition](../doc/android/guide#face-recognition)

some sentence

## Input image

For face recognition, you should use an image with dimensions of at least 480x360 pixels. For Trueface SDK to accurately detect faces, input images must contain faces that are represented by sufficient pixel data. In general, each face you want to detect in an image should be at least 100x100 pixels. If you want to detect the contours of faces, Trueface SDK requires higher resolution input: each face should be at least 200x200 pixels.

If you detect faces in a real-time application, you might also want to consider the overall dimensions of the input images. Smaller images can be processed faster, so to reduce latency, capture images at lower resolutions, but keep in mind the above accuracy requirements and ensure that the subject's face occupies as much of the image as possible. Also see tips to improve real-time performance.

Poor image focus can also impact accuracy. If you don't get acceptable results, ask the user to recapture the image.

The orientation of a face relative to the camera can also affect what facial features Trueface SDK detects.

## License

To obtain a License key, please contact our [sales team](https://trueface.ai/demo) and provide your `applicationId`, Then use `setToken` to license your SDK, for example:

```java
ConfigurationOptions configurationOptions = new ConfigurationOptions();

SDK sdk = new SDK(getApplicationContext(), configurationOptions);
bool isLicensed = sdk.setLicense(token);
```

You can check validity of license by using `isLicensed` and `getExpireTime` to get the number of remaining days that the token is valid for.

## Configuration

Before you apply any analysis to an image, if you want to change any of the Trueface SDk's default settings, specify those settings with a [ConfigurationOptions](../doc/android/ConfigurationOptions) object. You can change the following settings:

1. `smallestFaceWidth`
The smallest face height that the face detector can detect. (default is 20 pixels, min value is 16 pixels).The face detector has a detection scale range of about 5 octaves.
Ex. 40 pixels yields the detection scale range of ~40 pixels to 1280 (=40x2^5) pixels.
If set to -1, will dynamically adjusts the face detection scale range from image-height/32 to image-height to ensure that large faces are detected in high resolution images.

2. `enableGPU`
Enable GPU support (default is false).

For example:

```java
ConfigurationOptions configurationOptions = new ConfigurationOptions();
configurationOptions.smallestFaceWidth = 120;

SDK sdk = new SDK(getApplicationContext(), configurationOptions);
```

_Note:_ for unit tests, you can obtain Context using `InstrumentationRegistry`

```Java
Context context = InstrumentationRegistry.getInstrumentation().getTargetContext();
```

## Prepare the input image

To detect faces in an image, set image from either a YuvImage, Image, Bitmap, byte array, or a file on the device. you should use an image with dimensions of at least 480x360 pixels. If you are detecting faces in real time, capturing frames at this minimum resolution can help reduce latency.

```Java
YuvImage image = ...;
sdk.setImage(image);
```

```Java
Image image = ...;
sdk.setImage(image);
```

```Java
Bitmap image = ...;
sdk.setImage(image);
// or set color space
sdk.setImage(image, ColorCode.rgba);
```

```Java
int width = ...;
int height = ...;
byte[] data = ...;
ColorCode colorCode = ...;
setImage(width, height, data, colorCode);
```
And finally
```Java
String imagePath = ...;
setImage(imagePath);
```

Please make sure to rotate photo correcrly before calling `setImage`, if you don't use a camera library that gives you the image's rotation degree, you can calculate it from the device's rotation degree and the orientation of camera sensor in the device:

```Java
private static final SparseIntArray ORIENTATIONS = new SparseIntArray();
static {
    ORIENTATIONS.append(Surface.ROTATION_0, 0);
    ORIENTATIONS.append(Surface.ROTATION_90, 90);
    ORIENTATIONS.append(Surface.ROTATION_180, 180);
    ORIENTATIONS.append(Surface.ROTATION_270, 270);
}

/**
 * Get the angle by which an image must be rotated given the device's current
 * orientation.
 */
@RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
private int getRotationCompensation(String cameraId, Activity activity, boolean isFrontFacing)
        throws CameraAccessException {
    // Get the device's current rotation relative to its "native" orientation.
    // Then, from the ORIENTATIONS table, look up the angle the image must be
    // rotated to compensate for the device's rotation.
    int deviceRotation = activity.getWindowManager().getDefaultDisplay().getRotation();
    int rotationCompensation = ORIENTATIONS.get(deviceRotation);

    // Get the device's sensor orientation.
    CameraManager cameraManager = (CameraManager) activity.getSystemService(CAMERA_SERVICE);
    int sensorOrientation = cameraManager
            .getCameraCharacteristics(cameraId)
            .get(CameraCharacteristics.SENSOR_ORIENTATION);

    if (isFrontFacing) {
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
    } else { // back-facing
        rotationCompensation = (sensorOrientation - rotationCompensation + 360) % 360;
    }
    return rotationCompensation;
}
```

## Process the image

Once you have constructed Trueface SDK, provided license and set image, you can now process image with one of several SDK calls:
1. Detect faces
1. Face Recognition
1. Detect Glasses
1. Detect Mask
1. Object Detection

## Get information about detected faces

If the face detection operation succeeds, a list of `FaceBoxAndLandmarks` objects are passed to the success operation. Each `FaceBoxAndLandmarks` object represents a face that was detected in the image. For each face, you can get its bounding coordinates in the input image. For example:

```Java
FaceBoxAndLandmarks[] faceBoxAndLandmarksArray = sdk.detectFaces();
for (FaceBoxAndLandmarks faceBoxAndLandmarks : faceBoxAndLandmarksArray) {
  // top left point
  Log.d(TAG, String.valueOf(faceBoxAndLandmarks.topLeft.y));
  Log.d(TAG, String.valueOf(faceBoxAndLandmarks.topLeft.x));

  // bottom right point
  Log.d(TAG, String.valueOf(faceBoxAndLandmarks.bottomRight.y));
  Log.d(TAG, String.valueOf(faceBoxAndLandmarks.bottomRight.x));

  // face landmarks, left eye, right eye, nose, left mouth corner, right mouth corner
  for (Point point: faceBoxAndLandmarks.landmarks) {
    Log.d(TAG, String.valueOf(point.y));
    Log.d(TAG, String.valueOf(point.x));
  }

  // face score
  Log.d(TAG, String.valueOf(faceBoxAndLandmarks.score));
}
```

If you are only interested in largest face in input image, you can use `detectLargestFace`. For example:

```Java
FaceBoxAndLandmarks faceBoxAndLandmarks = sdk.detectLargestFace();
if (faceBoxAndLandmarks) {
  // face found
}
```

## Object Detection

If the object detection operation succeeds, a list of `BoundingBox` objects are passed to the success operation. Each `BoundingBox` object represents a object that was detected in the image. For each object, you can get its bounding coordinates in the input image. For example:

```Java
BoundingBox[] boundingBoxs = sdk.detectObjects();
for (BoundingBox boundingBox: boundingBoxs) {
  sdk.getObjectLabelString(boundingBox.label);
  Log.d(TAG, String.valueOf(boundingBox.label)); 
}
```

_Note:_ [`BoundingBox`](../doc/android/BoundingBox)

## Face Matching
Face Matching, also known as a face similarity, helps to check the likelihood that two faces belong to the same person. The `getSimilarity` will return a similarity measure and match probability scores about how likely it is that the two faces belong to one person

```Java
ErrorCode errorCode = sdk.setImage(bitmap1);
assertEquals("make sure the test image exists and is loaded", errorCode, ErrorCode.NO_ERROR);
Faceprint faceprint1 = sdk.getLargestFaceFeatureVector();

errorCode = sdk.setImage(bitmap2);
assertEquals("make sure the test image exists and is loaded", errorCode, ErrorCode.NO_ERROR);
Faceprint faceprint2 = sdk.getLargestFaceFeatureVector();

Similarity similarity = sdk.getSimilarity(faceprint1, faceprint2);
assertTrue("similarity score", similarity.similarityMeasure > 0.6);
```

_Note:_  [`Similarity`](../doc/android/Similarity)

## Face Recognition

The 1 to N functions allow you to enroll face recognition templates (Faceprints) into a database of face templates called a collection, then allow you to efficiently search through these collections for an identity.

_Note: on Android Postgress is not available as backend._

First you need to create a database file, for example, the following database file `fr.db` will be created inside folder named  `collections` within your application private folder, then loads collection name `staff`:

```Java
ErrorCode errorCode = sdk.createDatabaseConnection("fr.db");
assertEquals("create database connection", errorCode, ErrorCode.NO_ERROR);

errorCode = sdk.createLoadCollection("staff");
assertEquals("create or load load collection", errorCode, ErrorCode.NO_ERROR);
```

Then you need to enroll labeled `Faceprints`, for example:

```Java
List<Pair<String, String>> list = new ArrayList<>();
list.add(new Pair<>("armstrong_2.jpg", "armstrong"));
list.add(new Pair<>("armstrong_3.jpg", "armstrong"));
list.add(new Pair<>("mr_bean.jpg", "bean"));
list.add(new Pair<>("mr_bean_2.jpg", "bean"));
list.add(new Pair<>("obama.jpg", "obama"));

for (Pair<String, String> pair: list) {
  Bitmap bitmap = getBitmapFromAsset(appContext, pair.first);
  sdk.setImage(bitmap);
  Faceprint faceprint = sdk.getLargestFaceFeatureVector();
  if (faceprint != null) {
    sdk.enrollFaceprint(faceprint, pair.second);
  }
}
```

After you can query the database using `Faceprints`, for example:

```Java
Candidate candidate = sdk.identifyTopCandidate(probeFaceprint);
assertEquals("identify top candidate", "armstrong", candidate.identity);

Candidate[] candidates = sdk.identifyTopCandidates(probeFaceprint, 10);
assertEquals("identify top candidates", "armstrong", candidates[0].identity);
```
