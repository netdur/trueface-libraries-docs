# Trueface SDK Android Guide: Input Image, License, Configuration, and Processing
This guide will help you understand how to work with input images, license keys, configuration options, and various processing techniques in the Trueface SDK for Android.

## Input image

For face recognition, it is recommended to use an image with dimensions of at least 480x360 pixels. To accurately detect faces, input images must contain faces with sufficient pixel data. Generally, each face should be at least 100x100 pixels for detection, and at least 200x200 pixels for detecting facial contours.

In real-time applications, consider using smaller images to reduce latency. However, maintain the required accuracy by ensuring that the subject's face occupies as much of the image as possible. Unfocused images can impact accuracy, so you may need to ask the user to recapture the image if the results are unsatisfactory.

The orientation of a face relative to the camera can also affect the detection of facial features by the Trueface SDK.

## License

To obtain a license key, contact the Trueface sales team and provide your applicationId. Then, use the setToken method to license your SDK:

```java
ConfigurationOptions configurationOptions = new ConfigurationOptions();

SDK sdk = new SDK(getApplicationContext(), configurationOptions);
bool isLicensed = sdk.setLicense(token);
```

Use isLicensed to check the validity of the license and getExpireTime to obtain the remaining number of days for which the token is valid.

## Configuration

If you want to change any default settings of the Trueface SDK, specify those settings with a ConfigurationOptions object before applying any analysis to an image. You can change the following settings:

1. `smallestFaceWidth`
The smallest face height that the face detector can detect (default is 20 pixels, minimum value is 16 pixels). The face detector has a detection scale range of about 5 octaves. For example, 40 pixels yields the detection scale range of ~40 pixels to 1280 (=40x2^5) pixels. If set to -1, the face detection scale range will dynamically adjust from image-height/32 to image-height to ensure that large faces are detected in high-resolution images.

2. `enableGPU`
Enable GPU support (default is false). GPU support is only available for face detection and the lite frModel `frModel`.

3. `frModel` Facial recognition models.
To compare model performances, refer to our [ROC curves]("http://performance.trueface.ai/").
You can also find more information on our [FAQ page]("https://reference.trueface.ai/cpp/dev/latest/py/faq.html#what-are-the-differences-between-the-face-recognition-models").
The current most accurate model is TFV5.


For example:

```java
ConfigurationOptions configurationOptions = new ConfigurationOptions();
configurationOptions.smallestFaceWidth = 120;

SDK sdk = new SDK(getApplicationContext(), configurationOptions);
```

For unit tests, you can obtain Context using `InstrumentationRegistry`

```java
Context context = InstrumentationRegistry.getInstrumentation().getTargetContext();
```

## Prepare the input image

To detect faces in an image, set the image from either a YuvImage, Image, Bitmap, byte array, or a file on the device. You should use an image with dimensions of at least 480x360 pixels. If you are detecting faces in real-time, capturing frames at this minimum resolution can help reduce latency.

```java
YuvImage image = ...;
Image image = sdk.proprocessImage(image);
```

```java
Bitmap image = ...;
Image image = sdk.proprocessImage(image);
// or set color space
Image image = sdk.proprocessImage(image, ColorCode.rgba);
```

```java
int width = ...;
int height = ...;
byte[] data = ...;
ColorCode colorCode = ...;
        Image image = sdk.proprocessImage(width, height, data, colorCode);
```
And finally
```java
String imagePath = ...;
Image image = sdk.proprocessImage(imagePath);
```

Make sure to rotate the photo correctly before calling proprocessImage. If you don't use a camera library that gives you the image's rotation degree, you can calculate it from the device's rotation degree and the orientation of the camera sensor in the device:

```java
int userRotation = frame.getRotationToUser();
Image image = sdk.preprocessImage(size.getWidth(), size.getHeight(), data, ColorCode.yuv_i420);
if (userRotation == 270) {
        image.rotate(RotateFlags.ROTATE_90_COUNTERCLOCKWISE);
}
if (userRotation == 180) {
        image.rotate(RotateFlags.ROTATE_180);
}
if (userRotation == 90) {
        image.rotate(RotateFlags.ROTATE_90_CLOCKWISE);
}
```

# IMPORTANT
Please destroy Image object after usage
```java
image.destroy();
```


## Process the image

Once you have constructed the Trueface SDK, provided a license, and set the image, you can now process the image with one of the several SDK calls:

1. Detect faces
1. Face Recognition
1. Detect Glasses
1. Detect Mask
1. Object Detection

## Get information about detected faces

If the face detection operation succeeds, a list of FaceBoxAndLandmarks objects are passed to the success operation. Each FaceBoxAndLandmarks object represents a face detected in the image. For each face, you can get its bounding coordinates in the input image. For example:


```Java
FaceBoxAndLandmarks[] faceBoxAndLandmarksArray = sdk.detectFaces(image);
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

If you are only interested in the largest face in the input image, you can use detectLargestFace. For example:

```Java
FaceBoxAndLandmarks faceBoxAndLandmarks = sdk.detectLargestFace(image);
if (faceBoxAndLandmarks) {
  // face found
}
```

## Object Detection

If the object detection operation succeeds, a list of BoundingBox objects are passed to the success operation. Each BoundingBox object represents an object detected in the image. For each object, you can get its bounding coordinates in the input image. For example:

```Java
BoundingBox[] boundingBoxs = sdk.detectObjects(image);
for (BoundingBox boundingBox: boundingBoxs) {
  String label = sdk.getObjectLabelString(boundingBox.label);
  Log.d(TAG, String.valueOf(boundingBox.label)); 
}
```

## Face Matching
Face Matching, also known as face similarity, helps to check the likelihood that two faces belong to the same person. The getSimilarity method returns a similarity measure and match probability scores about how likely it is that the two faces belong to one person.

```Java
Image image = sdk.preprocessImage(bitmap1);
assertEquals("make sure the test image exists and is loaded", image.errorCode, ErrorCode.NO_ERROR);
Faceprint faceprint1 = sdk.getLargestFaceFeatureVector(image);

image = sdk.preprocessImage(bitmap2);
assertEquals("make sure the test image exists and is loaded", image.errorCode, ErrorCode.NO_ERROR);
Faceprint faceprint2 = sdk.getLargestFaceFeatureVector(image);

Similarity similarity = sdk.getSimilarity(faceprint1, faceprint2);
assertTrue("similarity score", similarity.similarityMeasure > 0.6);
```

## Face Recognition

The 1 to N functions allow you to enroll face recognition templates (Faceprints) into a database of face templates called a collection, then allow you to efficiently search through these collections for an identity.

Note: on Android, Postgres is not available as a backend.

First, you need to create a database file, for example, the following database file fr.db will be created inside a folder named collections within your application's private folder, then load the collection named staff:

```Java
ErrorCode errorCode = sdk.createDatabaseConnection("fr.db");
assertEquals("create database connection", errorCode, ErrorCode.NO_ERROR);

errorCode = sdk.createLoadCollection("staff");
assertEquals("create or load load collection", errorCode, ErrorCode.NO_ERROR);
```

Then you need to enroll labeled Faceprints, for example:


```Java
List<Pair<String, String>> list = new ArrayList<>();
list.add(new Pair<>("armstrong_2.jpg", "armstrong"));
list.add(new Pair<>("armstrong_3.jpg", "armstrong"));
list.add(new Pair<>("mr_bean.jpg", "bean"));
list.add(new Pair<>("mr_bean_2.jpg", "bean"));
list.add(new Pair<>("obama.jpg", "obama"));

for (Pair<String, String> pair: list) {
  Bitmap bitmap = getBitmapFromAsset(appContext, pair.first);
  Image image = sdk.preprocessImage(bitmap1);
  Faceprint faceprint = sdk.getLargestFaceFeatureVector(image);
  if (faceprint != null) {
    String uuid = sdk.enrollFaceprint(faceprint, pair.second);
    if (uuid == null) {
      // handle error
    }
  }
}
```

Afterward, you can query the database using Faceprints, for example:

```Java
Candidate candidate = sdk.identifyTopCandidate(probeFaceprint);
assertEquals("identify top candidate", "armstrong", candidate.identity);

Candidate[] candidates = sdk.identifyTopCandidates(probeFaceprint, 10);
assertEquals("identify top candidates", "armstrong", candidates[0].identity);
```

By following the steps and examples provided in this guide, you can successfully implement face detection, recognition, and object detection in your Android application using the Trueface SDK.
