# GPUOptions

GPU options for the SDK. GPU support requires a different version of the SDK; by default the SDK uses CPU for inference. Annotated `@UnsupportedOnMobile`.

## Fields

- `boolean enableGPU` - Enable GPU inference for all supported modules.
- `int deviceIndex` - GPU device index.
- `GPUModuleOptions faceDetectorGPUOptions` - GPU options for the face detector. See [GPUModuleOptions](/v3.0/android/GPUModuleOptions).
- `GPUModuleOptions faceLandmarkDetectorGPUOptions` - GPU options for the 106-point face landmark detector.
- `GPUModuleOptions faceRecognizerGPUOptions` - GPU options for the face recognizer.
- `GPUModuleOptions maskDetectorGPUOptions` - GPU options for the mask detector.
- `GPUModuleOptions objectDetectorGPUOptions` - GPU options for the object detector.
- `GPUModuleOptions faceOrientationDetectorGPUOptions` - GPU options for the face orientation detector.
- `GPUModuleOptions faceBlurDetectorGPUOptions` - GPU options for the face blur detector.
- `GPUModuleOptions spoofDetectorGPUOptions` - GPU options for the spoof detector.
- `GPUModuleOptions blinkDetectorGPUOptions` - GPU options for the blink detector.
- `GPUModuleOptions faceTemplateQualityEstimatorGPUOptions` - GPU options for the face template quality estimator.
