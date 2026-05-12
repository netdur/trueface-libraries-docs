# HeadOrientation

Describes the orientation of a head.

## Fields

- `float yaw` - The rotation angle around the image's vertical axis, in radians.
- `float pitch` - The rotation angle around the image's transverse axis, in radians.
- `float roll` - The rotation angle around the image's longitudinal axis, in radians.
- `double[] rotationVec` - The rotation vector. Can be passed to `drawHeadOrientationBox()`.
- `double[] translationVec` - The translation vector. Can be passed to `drawHeadOrientationBox()`.
