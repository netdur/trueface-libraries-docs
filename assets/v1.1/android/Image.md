# Documentation

## `public class Image`

Class which is used to manage a decoded image which is in the format expected by inference functions. Should populate Image using the preprocessImage functions. An Image can be in CPU memory or GPU memory.

## `public native void rotate(RotateFlags rotateFlags)`

Rotate the image.

* **Parameters:** `rotateFlags` — the RotateFlags.

  Positive values mean counter-clockwise rotation (the coordinate origin is assumed to be the top-left corner).

## `public native void saveImage(String filepath)`

Save the preprocessed image to disk.

* **Parameters:** `filepath` — the filepath where the image should be saved, including the image extension

## `public native int getHeight()`

Get the image height in pixels.

* **Returns:** Returns the image height in pixels.

## `public native int getWidth()`

Get the image width in pixels.

* **Returns:** Returns the image width in pixels.