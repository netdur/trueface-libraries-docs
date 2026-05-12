# CollectionIdentitiesResult

Result of retrieving identities from a collection, containing an error code and the identity map.

## Fields

- `ErrorCode errorCode` - The error code indicating the result of the operation. See [ErrorCode](/v3.0/android/ErrorCode).
- `Map<String, List<String>> identities` - A map from each identity to the list of Faceprint UUIDs enrolled under that identity.
