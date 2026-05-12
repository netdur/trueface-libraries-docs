# FaceImageExposureResult

Result of a face image exposure analysis.

## Fields

- `ErrorCode errorCode` - The error code indicating the result of the operation. See [ErrorCode](/v3.0/android/ErrorCode).
- `FaceImageQuality result` - The exposure quality classification. See [FaceImageQuality](/v3.0/android/FaceImageQuality).
- `float percentImageBright` - The percentage of the image that is overexposed.
- `float percentImageDark` - The percentage of the image that is underexposed.
- `float percentFaceBright` - The percentage of the face that is overexposed.
