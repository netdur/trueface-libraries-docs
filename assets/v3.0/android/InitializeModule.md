# InitializeModule

## `public class InitializeModule`

Initialize module in SDK constructor. By default, the SDK uses lazy initialization, meaning modules are only initialized when they are first used (on first inference). This is done so that modules which are not used do not load their models into memory, and hence do not utilize memory. The downside to this is that the first inference will be much slower as the model file is being decrypted and loaded into memory. Therefore, if you know you will use a module, choose to pre-initialize the module, which reads the model file into memory in the SDK constructor.

### Fields

#### `public boolean faceDetector = false`

Face detector.

#### `public boolean faceRecognizer = false`

Face recognizer.

#### `public boolean objectDetector = false`

Object detector.

#### `public boolean blinkDetector = false`

Blink detector.

#### `public boolean activeSpoof = false`

Active spoof.

#### `public boolean passiveSpoof = false`

Passive spoof.

#### `public boolean landmarkDetector = false`

106 face point landmark detector.

#### `public boolean maskDetector = false`

Mask detector.

#### `public boolean faceOrientationDetector = false`

Face orientation detector.

#### `public boolean faceBlurDetector = false`

Face blur detector.

#### `public boolean eyeglassDetector = false`

Eyeglass detector.

#### `public boolean faceTemplateQualityEstimator = false`

Face template quality estimator.

### Constructors

#### `public InitializeModule()`

Default constructor.

#### `public InitializeModule(boolean faceDetector, boolean faceRecognizer, boolean objectDetector, boolean blinkDetector, boolean activeSpoof, boolean passiveSpoof, boolean landmarkDetector, boolean maskDetector, boolean faceOrientationDetector, boolean faceBlurDetector, boolean eyeglassDetector, boolean faceTemplateQualityEstimator)`

Constructor to initialize the `InitializeModule` with specific values.

- **Parameters:**
  - `faceDetector` - Face detector.
  - `faceRecognizer` - Face recognizer.
  - `objectDetector` - Object detector.
  - `blinkDetector` - Blink detector.
  - `activeSpoof` - Active spoof.
  - `passiveSpoof` - Passive spoof.
  - `landmarkDetector` - 106 face point landmark detector.
  - `maskDetector` - Mask detector.
  - `faceOrientationDetector` - Face orientation detector.
  - `faceBlurDetector` - Face blur detector.
  - `eyeglassDetector` - Eyeglass detector.
  - `faceTemplateQualityEstimator` - Face template quality estimator.