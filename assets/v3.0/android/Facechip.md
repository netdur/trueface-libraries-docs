# Facechip

Manages a face chip image. A face chip is an aligned and cropped face image, which may reside in CPU or GPU memory. Implements `AutoCloseable`.

## Fields

- `long pointer` - Pointer to the native face chip object.
- `ErrorCode errorCode` - Error code indicating the result of operations on this object. See [ErrorCode](/v3.0/android/ErrorCode).

## Methods

### `ErrorCode loadImage(String filepath)`

Load a face chip from disk.

### `void saveImage(String filepath)`

Save the face chip image to disk. The path must include an image extension.

### `int getHeight()`

Return the image height in pixels.

### `int getWidth()`

Return the image width in pixels.

### `byte[] getData()`

Return the decoded image buffer.

### `Bitmap getDataAsBitmap()`

Return the decoded image as an Android `Bitmap` (112x112 ARGB_8888).

### `void destroy()`

Release the native face chip resources.

### `void close()`

Closes the Facechip by calling `destroy()`.
