# IdentifyTopCandidateResult

## `public class IdentifyTopCandidateResult`

This class represents the result of identifying the top candidate in a face recognition operation, containing the error code, candidate information, and a flag indicating if a candidate was found.

### Fields

#### `public ErrorCode errorCode`

The error code indicating the result of the identification operation.

#### `public Candidate candidate`

The top candidate identified in the face recognition operation.

#### `public boolean found`

Indicates whether a candidate was found.

### Constructors

#### `public IdentifyTopCandidateResult()`

Default constructor.

#### `public IdentifyTopCandidateResult(ErrorCode errorCode, Candidate candidate, boolean found)`

Constructor to initialize the `IdentifyTopCandidateResult` with specific values.

- **Parameters:**
  - `errorCode` - The error code indicating the result of the identification operation.
  - `candidate` - The top candidate identified in the face recognition operation.
  - `found` - Indicates whether a candidate was found.