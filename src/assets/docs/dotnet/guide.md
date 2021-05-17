# Guide

## Table of Contents

- [Input image](/doc/android/guide#input-image)
- [License](../doc/android/guide#license)
- [Configuration](/doc/android/guide#configuration)
- [Prepare the input image](/doc/android/guide#prepare-the-input-image)
- [Face Matching](../doc/android/guide#face-matching)
- [Face Recognition](../doc/android/guide#face-recognition)

## Input image

For face recognition, you should use an image with dimensions of at least 480x360 pixels. For Trueface SDK to accurately detect faces, input images must contain faces that are represented by sufficient pixel data. In general, each face you want to detect in an image should be at least 100x100 pixels. If you want to detect the contours of faces, Trueface SDK requires higher resolution input: each face should be at least 200x200 pixels.

If you detect faces in a real-time application, you might also want to consider the overall dimensions of the input images. Smaller images can be processed faster, so to reduce latency, capture images at lower resolutions, but keep in mind the above accuracy requirements and ensure that the subject's face occupies as much of the image as possible. Also see tips to improve real-time performance.

Poor image focus can also impact accuracy. If you don't get acceptable results, ask the user to recapture the image.

The orientation of a face relative to the camera can also affect what facial features Trueface SDK detects.

## License

To obtain a License key, please contact our [sales team](https://trueface.ai/demo) and provide your `applicationId`, Then use `setToken` to license your SDK, for example:

```java
using Trueface;

SDK sdk = new();
bool isLicensed = sdk.SetLicense(token);
```

You can check validity of license by using `isLicensed` and `getExpireTime` to get the number of remaining days that the token is valid for.

## Configuration

Before you apply any analysis to an image, if you want to change any of the Trueface SDk's default settings, specify those settings with a json text. for add support for configurations, open `Trueface.cs` and add follow overload method to `SDK` class:

```java
[DllImport("trueface_sdk_dll")]
public static extern IntPtr TFSDK__json_createWithConfigurationOptions(string options);
public SDK(string options)
{
  pointer = TFSDK__json_createWithConfigurationOptions();
}
```

Then you can change settings:

```java
string options = $@"
{{
   ""smallestFaceHeight"": 80
}}";

SDK sdk = new(options);
```

Possible options and default values:

```java
ConfigurationOptions options;
options.frModel = LITE;
options.objModel = ACCURATE;
options.smallestFaceHeight = 20;
options.fdMode = VERSATILE;
options.fdFilter = BALANCED;
options.dbms = SQLITE;
options.modelsPath = "./";
options.frVectorCompression = false;
options.enableGPU.faceDetector = false;
options.enableGPU.faceRecognizer = false;
options.deviceIndex = 0;
```

## Prepare the input image

To detect faces in an image, set image from a file.

```java
String imagePath = ...;
sdk.SetImageFromFile(imagePath);
```

## Get information about detected faces

There is list of native methods you can utilize to get infomation about faces in given photo. which can be use as in `TFSDK__json_createWithConfigurationOptions` in above example, those method accepts JSON as both input and output to simplify binding, you can also use primitive types for better performance:

```C
const char *TFSDK__json_detectLargestFace(struct Trueface__SDK *tfsdk);
struct TF__FaceBoxAndLandmarks TFSDK__detectLargestFace(struct Trueface__SDK *tfsdk, bool *found);

const char *TFSDK__json_detectFaces(struct Trueface__SDK *tfsdk);
struct TF__FaceBoxAndLandmarks *TFSDK__detectFaces(struct Trueface__SDK *tfsdk, int *size);
```

The `TF__FaceBoxAndLandmarks` is structured like this:

```C
struct TF__FaceBoxAndLandmarks
{
    struct TF__Point topLeft;
    struct TF__Point bottomRight;
    struct TF__Point *landmarks;
    float score;
};
```

Or as JSON:

```Json
{
    "topLeft": "",
    "bottomRight": "",
    "landmarks": [],
    "score": ""
};
```

## Face Recognition

The 1 to N functions allow you to enroll face recognition templates (Faceprints) into a database of face templates called a collection, then allow you to efficiently search through these collections for an identity.

_Note: on Windows Postgress is not available as backend._

First you need to create a database file, for example, the following database file `fr.db` will be created inside folder named  `collections` within your application private folder, then loads collection name `staff`:

```Java
sdk.CreateDatabaseConnection("fr.db");
sdk.CreateLoadCollection("staff");
```

Then you need to enroll labeled `Faceprints`, for example:

```Java
SDK.SetImageFromFile("path_to_image.jpg");
string facePrint = SDK.GetLargestFaceFeatureVector();
SDK.EnrollTemplate(facePrint, "candidate name");
```

After you can query the database using `Faceprints`, for example:

```Java
SDK.SetImageFromFile("path_to_image.jpg");
string facePrint = SDK.GetLargestFaceFeatureVector();

string topCandidate = SDK.IdentifyTopCandidate(facePrint, 0.3f);

// converts JSON to object and check for error

dynamic topCandidate_obj = JsonConvert.DeserializeObject(topCandidate);
errorCode = (Trueface.ErrorCode)topCandidate_obj.error;
if (errorCode != Trueface.ErrorCode.NO_ERROR)
{
  MessageBox.Show("Error: " + errorCode);
  return;
}

// print information about candidate
string outputs = "";
if (topCandidate_obj.found == true)
{
  outputs = string.Format("{0} [{1}]", topCandidate_obj.identity, topCandidate_obj.matchProbability);
}
else
{
  outputs = "Unknown";
}
```
