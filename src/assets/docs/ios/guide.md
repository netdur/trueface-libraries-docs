# Guide

## Table of Contents

- [Versioning](/doc/ios/guide#versioning)
- [Install](/doc/ios/guide#install)
- [Usage](../doc/ios/guide#usage)
- [TFV5](/doc/ios/guide#tfv5)
- [Tips](/doc/ios/guide#tips)

## Versioning

We have reverted iOS versioning schema to match with C++ versioning.

## Install

To install Trueface SDK please download and extract [Trueface SDK 0.29](https://github.com/netdur/trueface-libraries-docs/releases/tag/v0.29), then drag the folder trueface.framework into Xcode

![alt text](assets/images/ios/drag_framework.png)

Also make sure to check `Copy items if needed` and your targets

![alt text](assets/images/ios/adding_options.png)

To use Trueface SDK with Swift, please read [Importing Objective-C into Swift
](https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/importing_objective-c_into_swift)

### Cocoapods

You can install Trueface SDK using Cocoapods

```cpp
pod 'trueface', '0.29.0'
```

Go to General > Frameworks, Libraries, and …
- add AVFoundation.framework
- add CoreMedia.framework

## Usage

The Trueface SDK for iOS has [C++ API](https://reference.trueface.ai/cpp/master/latest/index.html), which can easily be used in your project by adding an `m` to your Objective-C file, for example, rename `ViewController.m` to `ViewController.mm` then import headers:

```cpp
#import "ViewController.h"

#include <trueface/tf_data_types.h>
#include <trueface/tf_sdk.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Trueface::ConfigurationOptions options;
    options.smallestFaceHeight = 120;
    
    Trueface::SDK *sdk = new Trueface::SDK(options);
    printf("hello trueface %s\n", sdk->getVersion().c_str());
    
}

@end
```

## TFV5

The TFV5 model can be tested with a virtual device, you may run into memory limitations on real iPhones, if such limitation are not an issue in your case, you can add TFV5 model as follows:

1. Drag and drop `face_recognition_cpu_v5.trueface.enc` to your project

![alt text](assets/images/ios/tfv5_model.png)

2. Configure SDK to use TFV5 model and models path:

```cpp
Trueface::ConfigurationOptions options;
options.frModel = Trueface::FacialRecognitionModel::TFV5;

NSString *assets = [[NSBundle mainBundle] resourcePath];
options.modelsPath = std::string([assets UTF8String]);

Trueface::SDK *sdk = new Trueface::SDK(options);
```

Due to TFV5 requirements, using the model requires 2.6 GB of RAM for CPU or 3.35 GB RAM for GPU, however the model can be used with less memory at cost of performance, iPhone allows 2 GB max per app, iPad M1 (iOS 15) allows 5 GB or more per app.

In this example, we bind `mobileAvailableMemory` option to `os_proc_available_memory`, to automatically set best options to run TFV5 model:

```cpp
#include <os/proc.h>

...

Trueface::ConfigurationOptions options;
options.frModel = Trueface::FacialRecognitionModel::TFV5;
options.enableGPU.faceRecognizer = false;
options.mobileThreads = 8;
options.mobileAvailableMemory = os_proc_available_memory();

NSString *assets = [[NSBundle mainBundle] resourcePath];
options.modelsPath = std::string([assets UTF8String]);

Trueface::SDK *sdk = new Trueface::SDK(options);
```

If you are running on iPad with SoC M1, GPU computing will be available:

```cpp
#include <os/proc.h>

...

Trueface::ConfigurationOptions options;
options.frModel = Trueface::FacialRecognitionModel::TFV5;
options.enableGPU.faceRecognizer = true;
options.mobileThreads = 1;
options.mobileAvailableMemory = os_proc_available_memory();

NSString *assets = [[NSBundle mainBundle] resourcePath];
options.modelsPath = std::string([assets UTF8String]);

Trueface::SDK *sdk = new Trueface::SDK(options);
```

## Tips

* You can create a group folder to hold assets like models then instruct the SDK to find them as shown below:

```cpp
Trueface::ConfigurationOptions options;
NSString *assets = [[NSBundle mainBundle] resourcePath];
options.modelsPath = std::string([assets UTF8String]);
```

* To save the database in a writable path, you can use the following code example:

```cpp
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
NSString *libraryDirectory = [paths objectAtIndex:0];
std::string db = std::string([libraryDirectory UTF8String]) + std::string("/test.db");
```

* You can enable GPU computing for Face Detection, Face Recognition.

```cpp
Trueface::ConfigurationOptions options;
options.enableGPU.faceRecognizer = true;
options.enableGPU.faceDetector = true;
```

* If you are captuing live frames from iPhone camera, try to raise `smallestFaceHeight` value to for better face detection  performance

```cpp
options.smallestFaceHeight = 240;
```

* The default value of `mobileThreads` aim to balance performance and energy saving, raise to 8 for best performance.

```cpp
options.mobileThreads = 8;
```
