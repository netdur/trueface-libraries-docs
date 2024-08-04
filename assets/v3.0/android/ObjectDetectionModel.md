# ObjectDetectionModel

## `public enum ObjectDetectionModel`

Object detection models.

### Enum Constants

#### `ACCURATE`

Resizes the input image to 1280x1280 (uses letterbox padding to maintain aspect ratio). Should be used for images where one or both dimensions are greater than 1280, and images with small objects.

#### `FAST`

Resizes the input image to 640x640 (uses letterbox padding to maintain aspect ratio). Should be used for smaller images, or images with large objects.