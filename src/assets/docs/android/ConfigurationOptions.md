# ConfigurationOptions

## `public class ConfigurationOptions`

SDK configuration options

## `public FacialRecognitionModel frModel = FacialRecognitionModel.LITE`

The model to be used for facial recognition (default is LITE model)

## `public ObjectDetectionModel objModel = ObjectDetectionModel.ACCURATE`

The model to be used for object detection (default is ACCURATE model)

## `public int smallestFaceWidth = 40`

The smallest face height that the face detector can detect. (default is 20 pixels, min value is 16 pixels). The face detector has a detection scale range of about 5 octaves. Ex. 40 pixels yields the detection scale range of ~40 pixels to 1280 (=40x2^5) pixels. If set to -1, will dynamically adjusts the face detection scale range from image-height/32 to image-height to ensure that large faces are detected in high resolution images.

## `public FaceDetectionMode fdMode = FaceDetectionMode.VERSATILE`

The face detection mode (default is VERSATILE)

## `public FaceDetectionFilter fdFilter = FaceDetectionFilter.BALANCED`

The face detection precision-recall mode (default is BALANCED)

## `public DatabaseManagementSystem dbms = DatabaseManagementSystem.SQLITE`

Database management system for storing templates (default is SQLITE)

## `public String modelsPath = "./"`

The directory path containing the model files

## `public boolean frVectorCompression = false`

Improves the computation speed for 1 to 1 comparisons and 1 to N searches by compressing the feature vector and enabling additional optimizations.

## `public boolean enableGPU = false`

Enable GPU support (default is false).

## `public int deviceIndex = 0`

GPU device index
