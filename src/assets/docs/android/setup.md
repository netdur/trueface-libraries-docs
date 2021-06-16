## Setup

Download [Trueface SDK 3.2.1](https://github.com/netdur/trueface-libraries-docs/releases/tag/v3.2.1) and include AAR file using Gradle, first use Android Studio menu:

```
File -> New -> New Module -> Import .jar/.aar and import your .aar.
```

Then in your project’s build.gradle (the one under ‘app’) add the following:

```kotlin
dependencies {
  ...
  implementation project(path: ':trueface-sdk-$VERSION')
}
```

## Distribution

The SDK supports 32-bit (armeabi-v7a - x86) and 64-bit (arm64-v8a - x86_64), If you are using Google Play Store to distribute mobile app, the customers will only download one of four architects.

Otherwise you can exclude one or several architects using Gradle (keep arm64-v8a only in this example):

```kotlin
android {
  ...
  ndk {
    abiFilters 'arm64-v8a'
  }
}
```

You can also exclude Spoof model (deprecated) and / or facial recognition full model:

```kotlin
android {
  ...
  buildTypes {
    release {
      aaptOptions {
        ignoreAssetsPattern '!spoof_v5.trueface.enc:!face_recognition_cpu_v5.trueface.enc:'
      }
    }
  }
}
```

If your application depends on OpenCV library, you can instruct Gralde to bundle only single version:

```kotlin
android {
  ...
  packagingOptions {
    pickFirst 'lib/x86/libopencv_java4.so'
    pickFirst 'lib/x86_64/libopencv_java4.so'
    pickFirst 'lib/armeabi-v7a/libopencv_java4.so'
    pickFirst 'lib/arm64-v8a/libopencv_java4.so'
  }
}
```
