# Trueface SDK Guide: Versioning, Setup, and Distribution

This guide will walk you through versioning, setting up, and distributing your application with the Trueface SDK for Android and C++.

## Versioning
The Android SDK generally precedes the C++ SDK by three major releases. For example, the Android SDK 3.n series was based on C++ SDK 0.n releases, and the Android SDK 4.n series is based on C++ SDK 1.n releases.

The versioning schema follows the pattern: major + 3.minor + build. To retrieve the version of the C++ SDK used in your project, you can call the getSDKVersion method.

## Setup
To set up the Trueface SDK in your Android project, follow these steps:

1. Download the [Trueface SDK 4.5+1](https://github.com/netdur/trueface-libraries-docs/releases/tag/v4.5%2B1) AAR file.

2. Import the AAR file using Android Studio:

```clike
File -> New -> New Module -> Import .jar/.aar and import your .aar.
```

3. Add the following lines to your project's build.gradle file (located under the 'app' directory):

```clike
dependencies {
  implementation project(path: ':trueface-sdk-$VERSION')
}
```
Replace $VERSION with the appropriate version number.

For Android Studio 4.2.1 and later:

Create a libs folder in the root directory of your project.

1. Add the following lines to your project's build.gradle file (located under the 'app' directory):

```clike
dependencies {
  implementation files('../libs/trueface-sdk-$VERSION.aar')
}
```
Replace $VERSION with the appropriate version number.

## Distribution
The Trueface SDK supports both 32-bit (armeabi-v7a) and 64-bit (arm64-v8a, x86_64) architectures. If you distribute your mobile app through the Google Play Store, your users will only download the appropriate architecture for their device.

You can also choose to exclude one or more architectures using Gradle. The following example retains only the arm64-v8a architecture:

```clike
android {
  ndk {
    abiFilters 'arm64-v8a'
  }
}
```
If your application depends on the OpenCV library, you can instruct Gradle to bundle only a single version of the library for each architecture:

```clike
android {
  packagingOptions {
    pickFirst 'lib/x86_64/libopencv_java4.so'
    pickFirst 'lib/armeabi-v7a/libopencv_java4.so'
    pickFirst 'lib/arm64-v8a/libopencv_java4.so'
  }
}
```
By following this guide, you should now have a better understanding of how to version, set up, and distribute your application with the Trueface SDK for Android and C++.
