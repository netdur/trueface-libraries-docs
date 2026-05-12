# IdentifyTopCandidateResult

Result of identifying the top candidate in a 1-to-N face search.

## Fields

- `ErrorCode errorCode` - The error code indicating the result of the operation. See [ErrorCode](/v3.0/android/ErrorCode).
- `Candidate candidate` - The top candidate. See [Candidate](/v3.0/android/Candidate).
- `boolean found` - Whether a candidate above the match threshold was found.
