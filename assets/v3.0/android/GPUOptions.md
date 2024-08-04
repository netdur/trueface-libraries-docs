# GPUOptions

## `public class GPUOptions`

GPU options for the SDK. Note, GPU support requires a different version of the SDK. By default, the SDK uses CPU for inference.

### Fields

#### `public boolean enableGPU = false`

Enable GPU inference for all supported modules.

#### `public int deviceIndex = 0`

GPU device index.

#### `public GPUModuleOptions faceDetectorGPUOptions`

Options for face detector GPU inference.

#### `public GPUModuleOptions faceLandmarkDetectorGPUOptions`

Options for 106 face landmark detector GPU inference.

#### `public GPUModuleOptions faceRecognizerGPUOptions`

Options for face recognizer GPU inference.

#### `public GPUModuleOptions maskDetectorGPUOptions`

Options for mask detector GPU inference.

#### `public GPUModuleOptions objectDetectorGPUOptions`

Options for object detector GPU inference.

#### `public GPUModuleOptions faceOrientationDetectorGPUOptions`

Options for face orientation detector GPU inference.

#### `public GPUModuleOptions faceBlurDetectorGPUOptions`

Options for face blur detector GPU inference.

#### `public GPUModuleOptions spoofDetectorGPUOptions`

Options for spoof detector GPU inference.

#### `public GPUModuleOptions blinkDetectorGPUOptions`

Options for blink detector GPU inference.

#### `public GPUModuleOptions faceTemplateQualityEstimatorGPUOptions`

Options for face template quality GPU inference.

### Constructors

#### `public GPUOptions()`

Default constructor.

#### `public GPUOptions(boolean enableGPU, int deviceIndex, GPUModuleOptions faceDetectorGPUOptions, GPUModuleOptions faceLandmarkDetectorGPUOptions, GPUModuleOptions faceRecognizerGPUOptions, GPUModuleOptions maskDetectorGPUOptions, GPUModuleOptions objectDetectorGPUOptions, GPUModuleOptions faceOrientationDetectorGPUOptions, GPUModuleOptions faceBlurDetectorGPUOptions, GPUModuleOptions spoofDetectorGPUOptions, GPUModuleOptions blinkDetectorGPUOptions, GPUModuleOptions faceTemplateQualityEstimatorGPUOptions)`

Constructor to initialize the `GPUOptions` with specific values.

- **Parameters:**
  - `enableGPU` - Enable GPU inference for all supported modules.
  - `deviceIndex` - GPU device index.
  - `faceDetectorGPUOptions` - Options for face detector GPU inference.
  - `faceLandmarkDetectorGPUOptions` - Options for 106 face landmark detector GPU inference.
  - `faceRecognizerGPUOptions` - Options for face recognizer GPU inference.
  - `maskDetectorGPUOptions` - Options for mask detector GPU inference.
  - `objectDetectorGPUOptions` - Options for object detector GPU inference.
  - `faceOrientationDetectorGPUOptions` - Options for face orientation detector GPU inference.
  - `faceBlurDetectorGPUOptions` - Options for face blur detector GPU inference.
  - `spoofDetectorGPUOptions` - Options for spoof detector GPU inference.
  - `blinkDetectorGPUOptions` - Options for blink detector GPU inference.
  - `faceTemplateQualityEstimatorGPUOptions` - Options for face template quality GPU inference.