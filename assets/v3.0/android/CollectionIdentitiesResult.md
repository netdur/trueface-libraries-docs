# CollectionIdentitiesResult

## `public class CollectionIdentitiesResult`

This class represents the result of a collection identities operation, containing an error code and a map of identities.

### Fields

#### `public ErrorCode errorCode`

The error code indicating the result of the operation.

#### `public Map<String, List<String>> identities`

A map where the key is a string representing the identity and the value is a list of strings associated with that identity.

### Constructors

#### `public CollectionIdentitiesResult()`

Default constructor.

#### `public CollectionIdentitiesResult(ErrorCode errorCode, Map<String, List<String>> identities)`

Constructor to initialize the `CollectionIdentitiesResult` with a specific error code and identities map.

- **Parameters:**
  - `errorCode` - The error code indicating the result of the operation.
  - `identities` - A map where the key is a string representing the identity and the value is a list of strings associated with that identity.