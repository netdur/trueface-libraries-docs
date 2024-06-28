#### C binding

This tutorial will guide you on how to use the TrueFace C SDK. The header file contains function declarations for image processing, face detection, face recognition, and other related tasks.

First, include the header file in your source code:
```clike
#include "trueface_sdk.h"
```

To create a Trueface SDK instance, you can call the following function:
```clike
struct Trueface__SDK *tfsdk = TFSDK__create();
```

Set the license for the SDK:
```clike
bool success = TFSDK__setLicense(tfsdk, "your_license_key");
```

Preprocess an image by loading it from a file:
```clike
struct TF__Image *tfImage;
enum TF__ErrorCode err = TFSDK__preprocessImageFromFile(tfsdk, &tfImage, "path/to/your/image.jpg");
```

Detect faces in the image:
```clike
int numFaces;
struct TF__FaceBoxAndLandmarks *faces = TFSDK__detectFaces(tfsdk, tfImage, &numFaces);
```

Extract faceprints (feature vectors) for detected faces:
```clike
struct TF__Faceprint faceprint;
for (int i = 0; i < numFaces; i++) {
err = TFSDK__getFaceFeatureVector(tfsdk, tfImage, faces[i], &faceprint);
}
```

Compare faceprints for similarity:
```clike
float matchProbability, similarityMeasure;
err = TFSDK__getSimilarity(tfsdk, &faceprint1, &faceprint2, &matchProbability, &similarityMeasure);
```

Don't forget to free the resources when you are done:
```clike
TFImage__destory(&tfImage);
TFSDK__destory(&tfsdk);
```

These are just a few examples of the functions available in the TrueFace C SDK. For more advanced use cases, refer to the function declarations in the header file and the API documentation.
