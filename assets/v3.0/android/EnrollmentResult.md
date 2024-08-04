# EnrollmentResult

## `public class EnrollmentResult`

This class represents the result of an enrollment operation, containing an error code and a UUID.

### Fields

#### `public ErrorCode errorCode`

The error code indicating the result of the enrollment operation.

#### `public String UUID`

The UUID of the enrolled entity.

### Constructors

#### `public EnrollmentResult()`

Default constructor.

#### `public EnrollmentResult(ErrorCode errorCode, String UUID)`

Constructor to initialize the `EnrollmentResult` with a specific error code and UUID.

- **Parameters:**
  - `errorCode` - The error code indicating the result of the enrollment operation.
  - `UUID` - The UUID of the enrolled entity.