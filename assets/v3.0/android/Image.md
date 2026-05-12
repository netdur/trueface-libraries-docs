# Image

Manages a decoded image in the format expected by inference functions. Populate using the preprocessImage methods on the SDK. May reside in CPU or GPU memory. Implements `AutoCloseable`.

## Fields

- `long pointer` - Pointer to the native image object.
- `ErrorCode errorCode` - Error code indicating the result of operations on this object. See [ErrorCode](/v3.0/android/ErrorCode).

## Methods

### `void rotate(RotateFlags rotateFlags)`

Rotate the image in place. See [RotateFlags](/v3.0/android/RotateFlags).

### `void saveImage(String filepath)`

Save the image to disk. The path must include an image extension.

### `int getHeight()`

Return the image height in pixels.

### `int getWidth()`

Return the image width in pixels.

### `void destroy()`

Release the native image resources.

### `void close()`

Closes the Image by calling `destroy()`.
