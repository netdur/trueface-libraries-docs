# ConfigurationOptions

SDK configuration options.

## Fields

- `boolean useCoreML` - Provider option for CoreML on Apple devices. Default `false`.
- `boolean useNNAPI` - Provider option for NNAPI on Android. Default `false`.
- `FacialRecognitionModel frModel` - Model used for facial recognition. Default `TFV5_2`. See [FacialRecognitionModel](/v3.0/android/FacialRecognitionModel).
- `FaceDetectionModel fdModel` - Model used for face detection. Default `FAST`. See [FaceDetectionModel](/v3.0/android/FaceDetectionModel).
- `ObjectDetectionModel objModel` - Model used for object detection. Default `ACCURATE`. See [ObjectDetectionModel](/v3.0/android/ObjectDetectionModel).
- `int smallestFaceHeight` - Filter detected faces by minimum height in pixels. Default `40`.
- `FaceDetectionFilter fdFilter` - The face detection filter. Default `BALANCED`. See [FaceDetectionFilter](/v3.0/android/FaceDetectionFilter).
- `DatabaseManagementSystem dbms` - Database management system for storing Faceprints. Default `SQLITE`. See [DatabaseManagementSystem](/v3.0/android/DatabaseManagementSystem).
- `String modelsPath` - Directory containing the model files. Default `"./"`.
- `boolean frVectorCompression` - Compress the feature vector to improve comparison speed and reduce memory usage. Default `false`.
- `GPUOptions gpuOptions` - Options for enabling and configuring GPU inference. See [GPUOptions](/v3.0/android/GPUOptions).
- `InitializeModule initializeModule` - Modules to initialize eagerly in the SDK constructor. See [InitializeModule](/v3.0/android/InitializeModule).
- `EncryptDatabase encryptDatabase` - AES encryption settings for the database. See [EncryptDatabase](/v3.0/android/EncryptDatabase).
- `boolean useGlobalInferenceThreadpool` - Use a global inference threadpool. Default `true`. Recommended on machines with fewer than 32 threads or when running a sequential inference pipeline.
