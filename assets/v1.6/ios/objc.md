# Trueface SDK Objective-C Header

This document describes the usage of the TF-SDK for iOS/Objective-C, which is a powerful and versatile computer vision library that supports various tasks such as face detection, face recognition, object detection, and many more.

## Overview

The SDK provides multiple features, including:

* Face detection
* Face recognition
* Object detection
* Body pose estimation
* Liveness detection
* Active and passive spoof detection
* Landmark detection
* Mask and glasses detection
* Face image quality assessment

## Prerequisites

To use this SDK, you need to have:

1. A valid license token for the SDK
2. The SDK library files
3. The required model files

## Usage

```objective-c
#import "tf_sdk.h"
```

Initialize the SDK with configuration options:

```objective-c
TFConfigurationOptions *options = [[TFConfigurationOptions alloc] init];
options.modelsPath = @"path/to/models";
// Set other configuration options as needed

TFSDK *sdk = [[TFSDK alloc] initWithConfigurationOptions:options];
```

Set the license token:
```objective-c
BOOL success = [sdk setLicense:@"your_license_token"];
```

Use the SDK's methods for various tasks:

* Face detection:
```objective-c
TFImage *inputImage = [sdk preprocessImage:image];
NSArray *faces = [sdk detectFaces:inputImage];
```

* Face recognition:
```objective-c
TFFaceBoxAndLandmarks *largestFace = [sdk detectLargestFace:inputImage];
TFFaceprint *faceprint = [sdk getFaceFeatureVector:inputImage :largestFace];
```

* Object detection:
```objective-c
NSArray *objects = [sdk detectObjects:inputImage];
```

And many more...

## Enums

- `TFErrorCode`: Error codes for different SDK operation failures.
- `TFColorCode`: Color codes for image formats.
- `TFObjectLabel`: Object labels for object detection.
- `TFFaceDetectionFilter`: Filter options for face detection.
- `TFDatabaseManagementSystem`: Database management system options.
- `TFFacialRecognitionModel`: Facial recognition model options.
- `TFObjectDetectionModel`: Object detection model options.

## Classes

1. `TFGPUModuleOptions`: GPU module options.
2. `TFGPUOptions`: GPU options for face detection and recognition.
3. `TFEncryptDatabase`: Options for database encryption.
4. `TFInitializeModule`: Options for initializing different modules.
5. `TFUninitializeModule`: Options for uninitializing different modules.
6. `TFConfigurationOptions`: Configuration options for the SDK.
7. `TFPoint`: Represents a 2D point with x and y coordinates.
8. `TFModelOptions`: Model options for face recognition.
9. `TFFaceprint`: Represents a faceprint including the feature vector, SDK version, model name, and model options.
10. `TFBoundingBox`: Represents a bounding box including the label, probability, top-left corner, width, and height.
11. `TFLandmark`: Represents a facial landmark with a point, score, and label.
12. `TFFaceBoxAndLandmarks`: Represents a face bounding box with the top-left and bottom-right corners, landmarks, and a score.
13. `TFCandidate`: Represents a candidate with a similarity measure, match probability, identity, and UUID.
14. `TFSpoofLabel`: Represents the label for spoof detection results.
15. `TFSpoofPrediction`: Represents a spoof prediction including the error code, score, and label.
16. `TFActiveSpoofStage`: Represents the stage for active spoof detection.
17. `TFMaskLabel`: Represents the label for mask detection.
18. `TFGlassesLabel`: Represents the label for glasses detection.
19. `TFCollectionMetadata`: Represents metadata for a collection.
20. `TFBlinkState`: Represents the blink state for a pair of eyes.
21. `TFSimilarity`: Represents the similarity measure and match probability between two faceprints.
22. `TFCollectionIdentities`: Represents the identity and UUID of a collection.
23. `TFRotateFlags`: Represents rotation options for images.
24. `TFFaceImageQuality`: Represents the quality of a face image.
25. `TFHeadOrientation`: Represents the head orientation with yaw, pitch, and roll values.
26. `TFFacechip`: Represents an aligned face image with additional methods for managing the image.
27. `TFImage`: Represents an image with additional methods for managing and processing the image.
28. `TFSDK`: Main SDK class with methods for SDK initialization, license management, image processing, face detection, recognition, spoof detection, and more.
