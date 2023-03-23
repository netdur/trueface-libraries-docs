## Hardware Requirements

To ensure optimal performance, please consider the following minimum hardware requirements for using the Trueface SDK:

### Android

* Minimum Android version: 7.0 (API level 24)
* Android SDK size: 70 MB
    * The Play Store will optimize the download binary to target the client's architecture. The typical download size is 18 MB.

### iOS

* Minimum iOS version: 11.12, iPhone 6s
* iOS SDK size: 139 MB
    * The SDK is a bitcode binary, and the App Store will optimize the download binary to target the client's architecture.
    * Note: GPU support is not currently available for iOS 16.

### Memory

* Minimum RAM: 1 GB
* 2 GB is recommended when using FULL or TFV5 face recognition models
    * Note: FULL or TFV5 models may perform slower on hardware with less than 2 GB of memory.
* 3 GB is recommended when using FULL or TFV5 face recognition models with GPU

### Processor

* Minimum CPU speed: 2.0 GHz

### Models Disk and Memory Usage

The following table shows the disk and memory usage for various models:

| Model         | Disk usage | Memory usage¹          |
|---------------|------------|------------------------|
| Lite          | 0 MB       | 240 MB                 |
| Lite v2       | 15 MB      | 316 MB                 |
| TFV5 CPU²     | 248 MB     | 0.8 GB                 |
| TFV5 CPU      | 248 MB     | 2.8 GB                 |
| TFV5 GPU      | 248 MB     | 3.4 GB                 |

¹ Memory usage combines the SDK, face detector, image, and model memory usage.

² With mobileMemorySave enabled.
