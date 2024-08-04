# Image

## `public class Image implements AutoCloseable`

Class which is used to manage a decoded image which is in the format expected by inference functions. Should populate `Image` using the preprocessImage functions. An `Image` can be in CPU memory or GPU memory.

### Fields

#### `public long pointer`

Pointer to the native image object.

#### `public ErrorCode errorCode`

Error code indicating the result of operations on the image.

#### `private boolean invalidate`

Flag indicating if the image is invalid.

### Constructors

#### `public Image(long pointer)`

Constructor to initialize the `Image` with a specific pointer.

- **Parameters:**
  - `pointer` - The pointer to the native image object.

#### `public Image()`

Default constructor. Initializes the `Image` with a new native image object.

### Methods

#### `public native void rotate(RotateFlags rotateFlags)`

Rotate the image.

- **Parameters:**
  - `rotateFlags` - The RotateFlags indicating the rotation direction. Positive values mean counter-clockwise rotation (the coordinate origin is assumed to be the top-left corner).

#### `public native void saveImage(String filepath)`

Save the preprocessed image to disk.

- **Parameters:**
  - `filepath` - The filepath where the image should be saved, including the image extension.

#### `public native int getHeight()`

Get the image height in pixels.

- **Returns:** The image height in pixels.

#### `public native int getWidth()`

Get the image width in pixels.

- **Returns:** The image width in pixels.

#### `public native void destroy()`

Destroy the native image object.

#### `public void close()`

Close the image, releasing any resources.

#### `protected void finalize() throws Throwable`

Finalize the object, ensuring resources are released.

- **Throws:** `Throwable` - if an error occurs during finalization.