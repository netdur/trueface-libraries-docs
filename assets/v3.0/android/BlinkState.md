# BlinkState

Results from blink detection. You can use the members to set your own thresholds appropriate for your camera and lighting conditions.

## Fields

- `boolean isLeftEyeClosed` - Predicted result for the left eye being closed. Computed as `leftEyeScore < 0.5`.
- `boolean isRightEyeClosed` - Predicted result for the right eye being closed. Computed as `rightEyeScore < 0.5`.
- `float leftEyeScore` - Score indicating if the left eye is open or closed. 0 indicates closed, 1 indicates open.
- `float rightEyeScore` - Score indicating if the right eye is open or closed. 0 indicates closed, 1 indicates open.
- `float leftEyeAspectRatio` - The aspect ratio of the left eye, computed as height / width.
- `float rightEyeAspectRatio` - The aspect ratio of the right eye, computed as height / width.
