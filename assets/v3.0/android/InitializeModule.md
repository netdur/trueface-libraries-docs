# InitializeModule

Selects which modules to initialize eagerly in the SDK constructor. By default the SDK uses lazy initialization: modules load their models only on first inference. Setting a flag here makes that module load at SDK construction time, trading startup cost for faster first inference.

## Fields

- `boolean faceDetector` - Pre-initialize the face detector.
- `boolean faceRecognizer` - Pre-initialize the face recognizer.
- `boolean objectDetector` - Pre-initialize the object detector.
- `boolean blinkDetector` - Pre-initialize the blink detector.
- `boolean activeSpoof` - Pre-initialize active spoof detection.
- `boolean passiveSpoof` - Pre-initialize passive spoof detection.
- `boolean landmarkDetector` - Pre-initialize the 106-point landmark detector.
- `boolean maskDetector` - Pre-initialize the mask detector.
- `boolean faceOrientationDetector` - Pre-initialize the face orientation detector.
- `boolean faceBlurDetector` - Pre-initialize the face blur detector.
- `boolean eyeglassDetector` - Pre-initialize the eyeglass detector.
- `boolean faceTemplateQualityEstimator` - Pre-initialize the face template quality estimator.
