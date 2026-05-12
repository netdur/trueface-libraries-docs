# IdentifyTopCandidatesResult

Result of identifying the top N candidates in a 1-to-N face search.

## Fields

- `ErrorCode errorCode` - The error code indicating the result of the operation. See [ErrorCode](/v3.0/android/ErrorCode).
- `List<Candidate> candidates` - The list of top candidates. See [Candidate](/v3.0/android/Candidate).
- `boolean found` - Whether any candidates above the match threshold were found.
