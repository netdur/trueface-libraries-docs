# MaskDetectionResult

## `public class MaskDetectionResult`

This class represents the result of a mask detection operation, containing the detected label and a confidence score.

### Fields

#### `public MaskLabel label`

The label indicating whether a mask was detected.

#### `public float score`

The confidence score of the detection.

### Constructors

#### `public MaskDetectionResult()`

Default constructor.

#### `public MaskDetectionResult(MaskLabel label, float score)`

Constructor to initialize the `MaskDetectionResult` with specific values.

- **Parameters:**
  - `label` - The label indicating whether a mask was detected.
  - `score` - The confidence score of the detection.