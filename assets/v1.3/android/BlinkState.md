# Documentation

## `public class BlinkState`

Results from blink detection. You can use the members of `Trueface::BlinkState` to set your own thresholds which work best for your camera and lighting conditions.

## `public boolean isLeftEyeClosed = false`

Computed as `Trueface::BlinkState.leftEyeScore` < 0.3 && `Trueface::BlinkState.leftEyeAspectRatio` < 0.22.

## `public boolean isRightEyeClosed = false`

Computed as `Trueface::BlinkState.rightEyeScore` < 0.3 && `Trueface::BlinkState.rightEyeAspectRatio` < 0.22.

## `public float leftEyeScore = 0.f`

0 indicates closed, 1 indicates open.

## `public float rightEyeScore = 0.f`

0 indicates closed, 1 indicates open.

## `public float leftEyeAspectRatio = 0.f`

The aspect ratio of the left eye, computed as height / width.

## `public float rightEyeAspectRatio = 0.f`

The aspect ratio of the right eye, computed as height / width.