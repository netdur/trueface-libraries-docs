# Spoof

Result of spoof detection.

## Fields

- `ErrorCode errorCode` - The error code indicating the result of the operation. See [ErrorCode](/v3.0/android/ErrorCode).
- `boolean isReal` - The face image is real.
- `boolean isFake` - The image may be an attempted spoof.
- `float score` - The probability the image is real (1 indicates real, 0 indicates spoof).
- `SpoofLabel label` - The spoof detection label. See [SpoofLabel](/v3.0/android/SpoofLabel).
