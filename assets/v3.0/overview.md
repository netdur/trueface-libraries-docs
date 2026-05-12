# Trueface SDK for Mobile

The Trueface SDK delivers face detection, face recognition, liveness detection, and object detection on Android and iOS. It runs fully on-device — no network calls — and works with CPU inference out of the box, with optional GPU acceleration on supported hardware.

## What's included

- **Face detection** — fast and accurate models, with single-largest-face and multi-face variants
- **Face recognition** — 1:1 similarity and 1:N identification against on-device collections (SQLite-backed)
- **Liveness detection** — passive spoof detection and an active spoof flow using near/far prompts
- **Face attributes** — mask detection, glasses detection, blink detection, head orientation, image quality, blur, and exposure
- **Object detection** — 80-class COCO model with fast and accurate variants
- **Encrypted on-device database** for face template collections

## Supported platforms

- **Android** — minimum API 24 (Android 7.0). 16 KB page size compatible. ABIs: `armeabi-v7a`, `arm64-v8a`, `x86_64`. See [Android Setup](/v3.0/android/setup).
- **iOS** — minimum iOS 12. Distributed as an XCFramework supporting device and simulator on Apple Silicon and Intel. See [iOS Guide](/v3.0/ios/guide).

## Architecture

The mobile SDKs are thin native bindings around a single C++ core, so feature parity between Android and iOS is high. The same models power both platforms.

Initialization is lazy by default — modules load on first use. You can pre-initialize specific modules at construction time via [`ConfigurationOptions`](/v3.0/android/ConfigurationOptions) to avoid first-call latency in latency-sensitive paths.
