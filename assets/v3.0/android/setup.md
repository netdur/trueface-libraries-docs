# Android Setup

This page covers versioning, installation, and packaging for the Trueface SDK on Android.

## Versioning

The Android SDK wraps the underlying C++ SDK. The version scheme is `major.minor.patch+build`, where `major.minor` mirrors the underlying C++ SDK release line and `+build` is the Android wrapper revision.

The current release is **5.3.0+5**, built on top of the C++ SDK 3.1.x line.

To retrieve the runtime versions from your app:

```java
SDK sdk = new SDK(getApplicationContext(), new ConfigurationOptions());
String androidWrapperVersion = sdk.getAndroidSDKVersion(); // e.g. "5.3.0+5"
String coreCppVersion = sdk.getVersion();                  // C++ SDK version
```

## Requirements

| Requirement | Value |
|---|---|
| Min Android version | 7.0 (API 24) |
| Compile SDK | 36 |
| Target SDK | 36 |
| Java / Kotlin target | 17 |
| NDK | 29.0.14033849 |
| Supported ABIs | `armeabi-v7a`, `arm64-v8a`, `x86_64` |

## 16 KB page size compatibility

Android 15 (API 35) introduced support for devices with 16 KB memory page sizes, and Google Play requires new apps and updates targeting Android 15+ to support them. The Trueface AAR is built with NDK 29, which produces 16 KB-aligned shared libraries, so the SDK runs on 16 KB-page devices out of the box.

To verify your final app is aligned (not just the SDK), use the NDK helper:

```bash
$ANDROID_HOME/ndk/29.0.14033849/build/checkpoint-elf-alignment.sh \
    app/build/outputs/apk/release/app-release.apk
```

## Install

1. Download the latest AAR: [trueface-sdk-5.3.0+5.aar](https://github.com/netdur/trueface-libraries-docs/releases/tag/v5.3.0%2B5).

2. Drop the file into your app's `libs/` directory:

```
your-app/
  app/
    libs/
      trueface-sdk-5.3.0+5.aar
```

3. Reference it from `app/build.gradle`:

```groovy
dependencies {
    implementation files('libs/trueface-sdk-5.3.0+5.aar')
}
```

If you use Kotlin DSL (`build.gradle.kts`):

```kotlin
dependencies {
    implementation(files("libs/trueface-sdk-5.3.0+5.aar"))
}
```

## OpenCV: breaking change in 5.3.0+5

Starting with **5.3.0+5**, the AAR no longer bundles the `org.opencv.*` Java classes. The SDK still ships and uses its own native `libopencv_java4.so` internally for `armeabi-v7a`, `arm64-v8a`, and `x86_64` — only the Java/Kotlin API surface was removed.

**If your app uses `org.opencv.*` directly**, add OpenCV as a dependency yourself:

```groovy
dependencies {
    implementation 'org.opencv:opencv:<version>'
}
```

**If your app already bundles its own OpenCV native runtime**, you may see a `libopencv_java4.so` duplicate at packaging time. Resolve it in `app/build.gradle`:

```groovy
android {
    packagingOptions {
        jniLibs {
            pickFirsts += [
                'lib/armeabi-v7a/libopencv_java4.so',
                'lib/arm64-v8a/libopencv_java4.so',
                'lib/x86_64/libopencv_java4.so',
            ]
        }
    }
}
```

Apps that don't touch OpenCV directly need no changes.

## Distribution: ABI splits

The AAR ships native binaries for `armeabi-v7a`, `arm64-v8a`, and `x86_64`. When you publish through Google Play, Play delivers the correct ABI to each device automatically.

If you ship outside the Play Store (sideload, MDM, alternate stores) and want to shrink your APK, restrict to a single ABI:

```groovy
android {
    defaultConfig {
        ndk {
            abiFilters 'arm64-v8a'
        }
    }
}
```

## Bundled native libraries

The AAR includes the following `.so` files for every supported ABI:

| Library | Purpose |
|---|---|
| `libtrueface_sdk.so` | Core SDK |
| `libonnxruntime.so` | Inference runtime |
| `libopencv_java4.so` | OpenCV (native, used internally) |
| `libssl.so`, `libcrypto.so` | OpenSSL |
| `libarchive.so` | Archive utilities |
