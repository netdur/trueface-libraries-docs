# ConfigurationOptions

## `public class ConfigurationOptions`

SDK configuration options for setting up various aspects of the Trueface SDK.

### Fields

#### `public boolean useCoreML = false`

Provider option CoreML / Apple devices.

#### `public boolean useNNAPI = false`

Provider option NNAPI / Android.

#### `public FacialRecognitionModel frModel = FacialRecognitionModel.TFV5_2`

The model to be used for facial recognition (default is TFV5_2).

#### `public FaceDetectionModel fdModel = FaceDetectionModel.FAST`

The model to be used for face detection (default is FAST).

#### `public ObjectDetectionModel objModel = ObjectDetectionModel.ACCURATE`

The model to be used for object detection (default is ACCURATE).

#### `public int smallestFaceHeight = 40`

Filter the detected faces based on face height. (default is 40 pixels).

#### `public FaceDetectionFilter fdFilter = FaceDetectionFilter.BALANCED`

The face detection filter (default is BALANCED).

#### `public DatabaseManagementSystem dbms = DatabaseManagementSystem.SQLITE`

Database management system for storing Faceprints (default is SQLITE).

#### `public String modelsPath = "./"`

Path specifying the directory which contains the model files.

#### `public boolean frVectorCompression = false`

Improves 1 to 1 Faceprint comparison times and 1 to N search speeds by compressing the feature vector and enabling additional optimizations. Also reduces the memory required to store each Faceprint. (default is false).

#### `public GPUOptions gpuOptions = new GPUOptions()`

Options for enabling and configuring GPU inference. Default uses CPU inference. Note, GPU support requires a different version of the SDK.

#### `public InitializeModule initializeModule = new InitializeModule()`

Initialize specified modules in the SDK constructor (default uses lazy initialization).

#### `public EncryptDatabase encryptDatabase = new EncryptDatabase()`

Encrypt the biometric templates and identity strings when storing in the database using AES encryption (default is disabled).

#### `public boolean useGlobalInferenceThreadpool = true`

Enable the use of a global inference threadpool. Should be enabled on machines with less than 32 threads or when running a sequential inference pipeline.

### Constructors

#### `public ConfigurationOptions()`

Default constructor.

#### `public ConfigurationOptions(boolean useCoreML, boolean useNNAPI, FacialRecognitionModel frModel, FaceDetectionModel fdModel, ObjectDetectionModel objModel, int smallestFaceHeight, FaceDetectionFilter fdFilter, DatabaseManagementSystem dbms, String modelsPath, boolean frVectorCompression, GPUOptions gpuOptions, InitializeModule initializeModule, EncryptDatabase encryptDatabase, boolean useGlobalInferenceThreadpool)`

Constructor to initialize the `ConfigurationOptions` with specific values.

- **Parameters:**
  - `useCoreML` - Provider option CoreML / Apple devices.
  - `useNNAPI` - Provider option NNAPI / Android.
  - `frModel` - The model to be used for facial recognition.
  - `fdModel` - The model to be used for face detection.
  - `objModel` - The model to be used for object detection.
  - `smallestFaceHeight` - The smallest face height to detect.
  - `fdFilter` - The face detection filter.
  - `dbms` - Database management system for storing Faceprints.
  - `modelsPath` - Path specifying the directory which contains the model files.
  - `frVectorCompression` - Enables feature vector compression.
  - `gpuOptions` - Options for enabling and configuring GPU inference.
  - `initializeModule` - Initialize specified modules in the SDK constructor.
  - `encryptDatabase` - Enables AES encryption for database storage.
  - `useGlobalInferenceThreadpool` - Enables the use of a global inference threadpool.