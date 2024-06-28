# Documentation

## `public class Facechip`

Class which is used to manage a face chip image. A face chip represents and aligned and cropped face image. A Facechip can be in CPU memory or GPU memory.

## `public native void loadImage(String filepath)`

Load the face chip from disk.

* **Parameters:** `filepath` — the filepath of the facechip to load.

## `public native void saveImage(String filepath)`

Save the preprocessed image to disk.

* **Parameters:** `filepath` — the filepath where the image should be saved, including the image extension

## `public native int getHeight()`

Get the image height in pixels.

* **Returns:** Returns the image height in pixels.

## `public native int getWidth()`

Get the image width in pixels.

* **Returns:** Returns the image width in pixels.

## `public native byte[] getData()`

Get the decoded image buffer.

* **Returns:** Returns the decoded image buffer.