## Versioning

Android SDK precede C++ SDK by 3 major releases, Android SDK 3.n series was based on C++ SDK 0.n releases, Android SDK 4.n is based on C++ SDK 1.n

Versioning schema would be major+3.minor+build The method `getSDKVersion` returns version of C++ SDK used.

## Setup

Download [Trueface SDK 4.4+1](https://github.com/netdur/trueface-libraries-docs/releases/tag/v4.4%2B1) and include AAR file using Gradle, first use Android Studio menu:

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
