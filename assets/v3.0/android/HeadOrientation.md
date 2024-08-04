# HeadOrientation

## `public class HeadOrientation`

Used to describe the orientation of a head.

### Fields

#### `public float yaw`

The rotation angle around the image's vertical axis, in radians.

#### `public float pitch`

The rotation angle around the image's transverse axis, in radians.

#### `public float roll`

The rotation angle around the image's longitudinal axis, in radians.

#### `public double[] rotationVec`

The rotation vector, can be passed to the `drawHeadOrientationBox()` method.

#### `public double[] translationVec`

The translation vector, can be passed to the `drawHeadOrientationBox()` method.

### Constructors

#### `public HeadOrientation()`

Default constructor.

#### `public HeadOrientation(float yaw, float pitch, float roll, double[] rotationVec, double[] translationVec)`

Constructor to initialize the `HeadOrientation` with specific values.

- **Parameters:**
  - `yaw` - The rotation angle around the image's vertical axis, in radians.
  - `pitch` - The rotation angle around the image's transverse axis, in radians.
  - `roll` - The rotation angle around the image's longitudinal axis, in radians.
  - `rotationVec` - The rotation vector.
  - `translationVec` - The translation vector.