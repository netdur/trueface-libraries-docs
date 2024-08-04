# GlassesDetectionResult

## `public class GlassesDetectionResult`

This class represents the result of a glasses detection operation, containing the detected label and a confidence score.

### Fields

#### `public GlassesLabel label`

The label indicating whether glasses were detected.

#### `public float score`

The confidence score of the detection.

### Constructors

#### `public GlassesDetectionResult()`

Default constructor.

#### `public GlassesDetectionResult(GlassesLabel label, float score)`

Constructor to initialize the `GlassesDetectionResult` with specific values.

- **Parameters:**
  - `label` - The label indicating whether glasses were detected.
  - `score` - The confidence score of the detection.