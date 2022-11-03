## Minimum Requirement

* Android 7.0 (API level 24)
    * Android SDK size 70 MB
    * Play Store will optimize download binary to target client architicture, typical download size is 18 MB

* iOS 11.12, iPhone 6s
    * iOS SDK size is 139 MB
    * SDK is bitcode binary, App Store will optimize download binary to target client architicture.
    * GPU is not currently supported for iOS 16

* 1 GB RAM
* 2 GB if using FULL or TFV5 face recognition models
    * Note: FULL or TFV5 is slower on hardware with less memory than 2 GB
* 3 GB if using FULL or TFV5 face recognition models with GPU

* CPU 2.0 GHz

* Models disk and memory usage table:
```

    | Model     | Disk usage | Memory usage |
    |-----------|------------|--------------|
    | Lite      | 0 MB       | 240 MB¹      |
    | Lite v2   | 15 MB      | 316 MB¹      |
    | TFV5 CPU² | 248 MB     | 0.8 GB¹      |
    | TFV5 CPU  | 248 MB     | 2.8 GB¹      |
    | TFV5 GPU  | 248 MB     | 3.4 GB¹      |

```

1 - Combains SDK, face detector, image and model memory usage
2 - With mobileMemorySave Enabled
