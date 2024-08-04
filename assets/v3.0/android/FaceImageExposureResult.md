# FaceImageExposureResult

## `public class FaceImageExposureResult`

This class represents the result of a face image exposure analysis operation, containing the error code, quality result, and various exposure percentages.

### Fields

#### `public ErrorCode errorCode`

The error code indicating the result of the exposure analysis operation.

#### `public FaceImageQuality result`

The quality result of the face image exposure analysis.

#### `public float percentImageBright`

The percentage of the image that is considered too bright.

#### `public float percentImageDark`

The percentage of the image that is considered too dark.

#### `public float percentFaceBright`

The percentage of the face that is considered too bright.

### Constructors

#### `public FaceImageExposureResult(ErrorCode errorCode, FaceImageQuality result, float percentImageBright, float percentImageDark, float percentFaceBright)`

Constructor to initialize the `FaceImageExposureResult` with specific values.

- **Parameters:**
  - `errorCode` - The error code indicating the result of the exposure analysis operation.
  - `result` - The quality result of the face image exposure analysis.
  - `percentImageBright` - The percentage of the image that is considered too bright.
  - `percentImageDark` - The percentage of the image that is considered too dark.
  - `percentFaceBright` - The percentage of the face that is considered too bright.