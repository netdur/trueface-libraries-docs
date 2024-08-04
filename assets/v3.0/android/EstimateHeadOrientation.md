# EstimateHeadOrientation

## `public class EstimateHeadOrientation`

This class represents the head orientation estimate, including angles and vectors.

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

#### `public EstimateHeadOrientation()`

Default constructor. Initializes `rotationVec` and `translationVec` with a length of 3.