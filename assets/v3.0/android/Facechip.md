# Facechip

## `public class Facechip implements AutoCloseable`

Class which is used to manage a face chip image. A face chip represents an aligned and cropped face image. A Facechip can be in CPU memory or GPU memory.

### Fields

#### `public long pointer`

Pointer to the native face chip object.

#### `public ErrorCode errorCode`

Error code indicating the result of operations on the face chip.

### Constructors

#### `public Facechip(long pointer)`

Constructor to initialize the `Facechip` with a specific pointer.

- **Parameters:**
  - `pointer` - The pointer to the native face chip object.

#### `public Facechip()`

Default constructor. Initializes the `Facechip` with a new native face chip object.

### Methods

#### `public native ErrorCode loadImage(String filepath)`

Load the face chip from disk.

- **Parameters:**
  - `filepath` - The filepath of the facechip to load.

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

#### `public native byte[] getData()`

Get the decoded image buffer.

- **Returns:** The decoded image buffer.

#### `public Bitmap getDataAsBitmap()`

Get the image data as a `Bitmap`.

- **Returns:** The decoded image as a `Bitmap`.

#### `public native void destroy()`

Destroy the native face chip object.

#### `public void close()`

Close the face chip, releasing any resources.

#### `protected void finalize() throws Throwable`

Finalize the object, ensuring resources are released.

- **Throws:** `Throwable` - if an error occurs during finalization.