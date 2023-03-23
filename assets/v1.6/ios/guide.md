## Install

To install the Trueface SDK, please follow these steps:

1. Download and extract [Trueface SDK 1.5+7](https://github.com/netdur/trueface-libraries-docs/releases/tag/v1.5%2B7).
2. Drag the folder `trueface.xcframework` into Xcode.

   ![Drag Framework](assets/assets/v1.6/ios/images/drag_framework.png)

3. Make sure to check `Copy items if needed` and your targets.

   ![Adding Options](assets/assets/v1.6/ios/images/adding_options.png)

### Objective-C and Swift

Full binding for Objective-C and Swift are available by importing the `trueface/tf_sdk_binding.h` header. To use the Trueface SDK with Swift, create a bridge header:

1. Create a new Objective C file in your project (File > New > File [Objective C for iOS]).
2. Accept the prompt (agree) to create a bridging header file between Objective C and Swift.
3. Delete your newly created Objective C file but retain the bridging header file `${YOURPROJ}-Bridging-Header.h`.

In the Bridging header file, import the Trueface framework using the standard Objective C import syntax:

```objective-c
#import <trueface/tf_sdk_binding.h>
```

Add the required frameworks and libraries:

Go to General > Frameworks, Libraries, and …
Add AVFoundation.framework
Add CoreMedia.framework
Add libc++.1.tdb, libc++.tdb, and libc++abi.tdb
Here's an example of Swift code:

```Swift
import SwiftUI

var options = TFConfigurationOptions()
var sdk = TFSDK(configurationOptions: options)
var ver = sdk?.getVersion()

struct ContentView: View {
    var body: some View {
        Text(ver!)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

### Cocoapods

Install the Trueface SDK using CocoaPods:

```cpp
pod 'trueface', '1.5+7'
```

Add the required frameworks and libraries:

1. Go to General > Frameworks, Libraries, and …
2. Add AVFoundation.framework
3. Add CoreMedia.framework
4. Add libc++.1.tdb, libc++.tdb, and libc++abi.tdb

## Usage

The Trueface SDK for iOS has a C++ API, which can easily be used in your project by adding an m to your Objective-C file. For example, rename ViewController.m to ViewController.mm and import headers:

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

The TFV5 model can be tested with a virtual device, but you may run into memory limitations on real iPhones. If such limitations are not an issue in your case, you can add the TFV5 model as follows:

1. Drag and drop `face_recognition_cpu_v5.trueface.enc` to your project.

   ![TFV5 Model](assets/assets/v1.1/ios/images/tfv5_model.png)

2. Configure SDK to use TFV5 model and models path:

   ```cpp
   Trueface::ConfigurationOptions options;
   options.frModel = Trueface::FacialRecognitionModel::TFV5;

   NSString *assets = [[NSBundle mainBundle] resourcePath];
   options.modelsPath = std::string([assets UTF8String]);

   Trueface::SDK *sdk = new Trueface::SDK(options);
   ```

Due to TFV5 requirements, using the model requires 2.6 GB of RAM for CPU or 3.35 GB RAM for GPU. However, the model can be used with less memory at the cost of performance. iPhones allow 2 GB max per app, while iPad M1 (iOS 15) allows 5 GB or more per app.

In this example, we bind the mobileAvailableMemory option to os_proc_available_memory to automatically set the best options for running the TFV5 model:


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

If you are running on an iPad with SoC M1, GPU computing will be available:

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

* Create a group folder to hold assets like models, and instruct the SDK to find them as shown below:

```cpp
Trueface::ConfigurationOptions options;
NSString *assets = [[NSBundle mainBundle] resourcePath];
options.modelsPath = std::string([assets UTF8String]);
```

* To save the database in a writable path, use the following code example:

```cpp
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
NSString *libraryDirectory = [paths objectAtIndex:0];
std::string db = std::string([libraryDirectory UTF8String]) + std::string("/test.db");
```

* Enable GPU computing for Face Detection and Face Recognition:

```cpp
Trueface::ConfigurationOptions options;
options.enableGPU.faceRecognizer = true;
options.enableGPU.faceDetector = true;
```

* When capturing live frames from the iPhone camera, try to increase the smallestFaceHeight value for better face detection performance:

```cpp
options.smallestFaceHeight = 240;
```

* The default value of `mobileThreads` aims to balance performance and energy saving. Increase to 8 for best performance:

```cpp
options.mobileThreads = 8;
```

* In cases where ARC does not call dealloc fast enough, use destroy to free up memory.
