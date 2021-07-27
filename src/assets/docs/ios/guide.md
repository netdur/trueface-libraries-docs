# Guide

## Table of Contents

- [Versioning](/doc/ios/guide#versioning)
- [Install](/doc/ios/guide#install)
- [Usage](../doc/ios/guide#usage)
- [Tips](/doc/ios/guide#tips)

## Versioning

We have reverted iOS versioning schema to match with C++ versioning.

## Install

To install Trueface SDK please download and extract [Trueface SDK 0.28](https://github.com/netdur/trueface-libraries-docs/releases/tag/v0.28.2), then drag the folder trueface.framework into Xcode

![alt text](assets/images/ios/drag_framework.png)

Also make sure to check `Copy items if needed` and your targets

![alt text](assets/images/ios/adding_options.png)

To use Trueface SDK with Swift, please read [Importing Objective-C into Swift
](https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/importing_objective-c_into_swift)

## Usage

The Trueface SDK for iOS has [C++ API](https://reference.trueface.ai/cpp/master/latest/index.html), which can easily be used in your project by adding an `m` to your Objective-C file, for example, rename `ViewController.m` to `ViewController.mm` the import headers:

```CPP
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

## Tips

* You can create a `group` folder to hold assets like models then instruct SDK to find them:

```cpp
Trueface::ConfigurationOptions options;
NSString *assets = [[NSBundle mainBundle] resourcePath];
options.modelsPath = std::string([assets UTF8String]);
```

* To save database in a writable path, please do as follow:

```cpp
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
NSString *libraryDirectory = [paths objectAtIndex:0];
std::string db = std::string([libraryDirectory UTF8String]) + std::string("/test.db");
```

* TFV5 model can be tested with virtual device only due to memory restiction on iPhones.
