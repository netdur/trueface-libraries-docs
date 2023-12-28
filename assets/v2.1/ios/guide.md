## Install

To install the Trueface SDK, please follow these steps:

1. Download and extract [Trueface SDK 2.1+1](https://github.com/netdur/trueface-libraries-docs/releases/tag/v2.1%2B1).
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
pod 'trueface', '2.1+1'
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
    
    Trueface::SDK *sdk = new Trueface::SDK(options);
    printf("hello trueface %s\n", sdk->getVersion().c_str());
    
}

@end
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

* Enable CoreML computing

```cpp
Trueface::ConfigurationOptions options;
options.useCoreML = true;
```

* In cases where ARC does not call dealloc fast enough, use destroy to free up memory.
