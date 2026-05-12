# Hardware Requirements

## Android

| | |
|---|---|
| Minimum Android version | 7.0 (API 24) |
| Compile / target SDK | 36 |
| NDK | 29.0.14033849 |
| Supported ABIs | `armeabi-v7a`, `arm64-v8a`, `x86_64` |
| 16 KB page size | Supported (NDK 29 aligns natives by default) |

The AAR ships universal native libraries. Google Play strips them per-ABI at install time, so end-user downloads are smaller than the AAR itself.

## iOS

| | |
|---|---|
| Minimum iOS version | 12.0 |
| Minimum device | iPhone 6s |
| Distribution | XCFramework (device + simulator, arm64 + x86_64) |
| CoreML | Optional, off by default |

## Memory and CPU

- **Minimum RAM:** 1 GB
- **Recommended CPU:** 2.0 GHz or faster

Heavy recognition models (TFV5_2, TFV6, TFV7) benefit substantially from newer SoCs. Lightweight models (LITE_V2, LITE_V3) run acceptably on entry-level hardware.

## Model disk and memory usage

The numbers below are per-model. Combined memory usage includes the SDK runtime, face detector, image buffers, and the recognition model itself.

| Model | Disk | Memory |
|---|---|---|
| LITE_V2 | ~15 MB | ~316 MB |
| LITE_V3 | ~15 MB | ~316 MB |
| TFV5_2 / TFV6 / TFV7 | ~248 MB each | ~1.0 GB |

Models are loaded lazily — disk impact only matters for the models you ship, and memory impact only applies to modules you initialize. Use [`InitializeModule`](/v3.0/android/InitializeModule) to control which modules pre-load.
