## Install

To install Trueface SDK please download and extract [Trueface SDK 1.3](https://github.com/netdur/trueface-libraries-docs/releases/tag/v1.3), then drag the folder trueface.framework into Xcode

![alt text](assets/assets/v1.1/ios/images/drag_framework.png)

Also make sure to check `Copy items if needed` and your targets

![alt text](assets/assets/v1.1/ios/images/images/ios/adding_options.png)

### Objective-C and Swift

Full binding for Objective-C and Swift are available by importing `trueface/tf_sdk_binding.h` header, to use Trueface SDK with Swift create bridge header:

* Create a new Objective C file in your project (File > New > File [Objective C for iOS]).
* Accept the prompt (agree) to create a bridging header file between Objective C and Swift.
* Delete your newly created Objective C file but retain the bridging header file ${YOURPROJ}-Bridging-Header.h.

In the Bridging header file, import Trueface framework using the standard Objective C import syntax.

`#import <trueface/tf_sdk_binding.h>`

Go to General > Frameworks, Libraries, and …
- add AVFoundation.framework
- add CoreMedia.framework
- add `libc++.1.tdb`, `libc++.tdb` and `libc++abi.tdb`

Example of Swift code:

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

You can install Trueface SDK using Cocoapods

```cpp
pod 'trueface', '1.3'
```

Go to General > Frameworks, Libraries, and …
- add AVFoundation.framework
- add CoreMedia.framework
- add `libc++.1.tdb`, `libc++.tdb` and `libc++abi.tdb`

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

![alt text](assets/assets/v1.1/ios/images/tfv5_model.png)

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
