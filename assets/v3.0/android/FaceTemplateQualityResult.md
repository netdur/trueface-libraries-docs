# FaceTemplateQualityResult

## `public class FaceTemplateQualityResult`

This class represents the result of a face template quality assessment operation, containing the error code, a boolean indicating the quality of the template, and a quality score.

### Fields

#### `public ErrorCode errorCode`

The error code indicating the result of the quality assessment operation.

#### `public boolean isTemplateQualityGood`

Indicates whether the face template quality is good.

#### `public float score`

The quality score of the face template.

### Constructors

#### `public FaceTemplateQualityResult(ErrorCode errorCode, boolean isTemplateQualityGood, float score)`

Constructor to initialize the `FaceTemplateQualityResult` with specific values.

- **Parameters:**
  - `errorCode` - The error code indicating the result of the quality assessment operation.
  - `isTemplateQualityGood` - Indicates whether the face template quality is good.
  - `score` - The quality score of the face template.