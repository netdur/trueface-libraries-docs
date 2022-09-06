## Versioning

Android SDK precede C++ SDK by 3 major releases, Android SDK 3.n series was based on C++ SDK 0.n releases, Android SDK 4.n is based on C++ SDK 1.n

Versioning schema would be major+3.minor+build The method `getSDKVersion` returns version of C++ SDK used.

## Setup

Download [Trueface SDK 4.2+3](https://github.com/netdur/trueface-libraries-docs/releases/tag/v4.2%2B3) and include AAR file using Gradle, first use Android Studio menu:

```
File -> New -> New Module -> Import .jar/.aar and import your .aar.
```

Then in your project’s build.gradle (the one under ‘app’) add the following:

```kotlin
dependencies {
  implementation project(path: ':trueface-sdk-$VERSION')
}
```

For Android Studio 4.2.1 and above, create folder `libs` in root directory Then in your project’s build.gradle (the one under ‘app’) add the following:

```kotlin
dependencies {
  implementation files('../libs/trueface-sdk-$VERSION.aar')
}
```

## Distribution

The SDK supports 32-bit (armeabi-v7a) and 64-bit (arm64-v8a - x86_64), If you are using Google Play Store to distribute mobile app, the customers will only download one of four architects.

Otherwise you can exclude one or several architects using Gradle (keep arm64-v8a only in this example):

```kotlin
android {
  ndk {
    abiFilters 'arm64-v8a'
  }
}
```

If your application depends on OpenCV library, you can instruct Gradle to bundle only single version:

```kotlin
android {
  packagingOptions {
    pickFirst 'lib/x86_64/libopencv_java4.so'
    pickFirst 'lib/armeabi-v7a/libopencv_java4.so'
    pickFirst 'lib/arm64-v8a/libopencv_java4.so'
  }
}
```

## Models

In order to use models of interest, please download and put inside assets folder:

* [body pose estimator v1](https://storage.googleapis.com/sdk-models/enc/body_pose_estimator/v1/body_pose_estimator_v1.trueface.enc)

* [face recognition v4](https://storage.googleapis.com/sdk-models/enc/face_recognition/cpu/face_recognition_cpu_v4.trueface.enc)

* [face recognition v5](https://storage.googleapis.com/sdk-models/enc/face_recognition/cpu/face_recognition_cpu_v5.trueface.enc)

* [face recognition lite v2](https://storage.googleapis.com/sdk-models/enc/face_recognition/cpu/face_recognition_cpu_lite_v2.trueface.enc)

* [face landmark detector v2](https://storage.googleapis.com/sdk-models/enc/landmark_detection/face_landmark_detector_v2.trueface.enc)

* [blink detector v1](https://storage.googleapis.com/sdk-models/enc/blink/blink_detector_v1.trueface.enc)

* [object detector v1](https://storage.googleapis.com/sdk-models/enc/object_detection/object_detector_v1.trueface.enc)

* [spoof v2](https://storage.googleapis.com/sdk-models/enc/spoof/v2/spoof_v2.trueface.enc)

* [mask detector v3](https://storage.googleapis.com/sdk-models/enc/mask/mask_detector_cpu_v3.trueface.enc)