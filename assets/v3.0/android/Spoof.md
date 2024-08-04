# Spoof

## `public class Spoof`

Results from spoof detection.

### Fields

#### `public ErrorCode errorCode`

The error code indicating the result of the spoof detection operation.

#### `public boolean isReal = false`

The face image is real.

#### `public boolean isFake = false`

The image may be an attempted spoof.

#### `public float score`

The probability that the image is a spoof attempt (1 indicates a real image, 0 indicates a spoof attempt).

#### `public SpoofLabel label`

The label indicating the result of the spoof detection (e.g., REAL, FAKE).