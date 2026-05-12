# Samples

## Android

### Live face detection (in-repo)

The Android SDK repository includes a working sample app under [`camera/`](https://github.com/netdur/trueface-sdk-android) that demonstrates:

- SDK initialization with `ConfigurationOptions`
- License setup at app start
- Live camera frames captured via AndroidX CameraX
- Real-time face detection with bounding box overlay
- NV12 frame preprocessing for low-latency inference

It's the recommended starting point — clone, drop in a license, run.

### Standalone samples

- [Live Face Processing](https://github.com/netdur/samples/tree/main/LIveFaceProcessing) — minimal real-time face detection.
- [Face Recognition](https://github.com/netdur/samples/tree/main/FaceRecognition) — full enrollment + 1:N identification flow.

## iOS

### 3D spoof detection (in-repo)

The iOS bindings repository includes a sample app under `3d_spoof/` that demonstrates depth-based liveness using `AVDepthData`, the video capture pipeline, and real-time face validation.
