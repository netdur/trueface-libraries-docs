# RemoveIdentityResult

## `public class RemoveIdentityResult`

This class represents the result of an identity removal operation, containing an error code and the number of faceprints removed.

### Fields

#### `public ErrorCode errorCode`

The error code indicating the result of the removal operation.

#### `public int numFaceprintsRemoved`

The number of faceprints removed during the operation.

### Constructors

#### `public RemoveIdentityResult()`

Default constructor.

#### `public RemoveIdentityResult(ErrorCode errorCode, int numFaceprintsRemoved)`

Constructor to initialize the `RemoveIdentityResult` with specific values.

- **Parameters:**
  - `errorCode` - The error code indicating the result of the removal operation.
  - `numFaceprintsRemoved` - The number of faceprints removed during the operation.