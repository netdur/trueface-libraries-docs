# IdentifyTopCandidatesResult

## `public class IdentifyTopCandidatesResult`

This class represents the result of identifying the top candidates in a face recognition operation, containing the error code, a list of candidates, and a flag indicating if any candidates were found.

### Fields

#### `public ErrorCode errorCode`

The error code indicating the result of the identification operation.

#### `public List<Candidate> candidates`

A list of the top candidates identified in the face recognition operation.

#### `public boolean found`

Indicates whether any candidates were found.

### Constructors

#### `public IdentifyTopCandidatesResult()`

Default constructor.

#### `public IdentifyTopCandidatesResult(ErrorCode errorCode, List<Candidate> candidates, boolean found)`

Constructor to initialize the `IdentifyTopCandidatesResult` with specific values.

- **Parameters:**
  - `errorCode` - The error code indicating the result of the identification operation.
  - `candidates` - A list of the top candidates identified in the face recognition operation.
  - `found` - Indicates whether any candidates were found.