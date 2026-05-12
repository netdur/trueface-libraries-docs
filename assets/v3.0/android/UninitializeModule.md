# UninitializeModule

Selects which modules to unload eagerly in the SDK destructor. By default the SDK uses lazy uninitialization: a module's model stays in memory as long as it might be reused. Setting a flag here forces that module's model file to be released when the SDK is destroyed, useful when you know you're done with a feature.

Pair with [InitializeModule](/v3.0/android/InitializeModule) when you want fine-grained control over the model memory lifecycle.

## Fields

- `boolean faceDetector` - Pre-uninitialize the face detector.
- `boolean faceRecognizer` - Pre-uninitialize the face recognizer.
- `boolean objectDetector` - Pre-uninitialize the object detector.
- `boolean blinkDetector` - Pre-uninitialize the blink detector.
- `boolean activeSpoof` - Pre-uninitialize active spoof detection.
- `boolean passiveSpoof` - Pre-uninitialize passive spoof detection.
- `boolean landmarkDetector` - Pre-uninitialize the 106-point landmark detector.
- `boolean maskDetector` - Pre-uninitialize the mask detector.
- `boolean faceOrientationDetector` - Pre-uninitialize the face orientation detector.
- `boolean faceBlurDetector` - Pre-uninitialize the face blur detector.
- `boolean eyeglassDetector` - Pre-uninitialize the eyeglass detector.
- `boolean faceTemplateQualityEstimator` - Pre-uninitialize the face template quality estimator.
