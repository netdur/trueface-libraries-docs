# CollectionNamesResult

## `public class CollectionNamesResult`

This class represents the result of a collection names retrieval operation, containing an error code and a list of collection names.

### Fields

#### `public ErrorCode errorCode`

The error code indicating the result of the operation.

#### `public List<String> collectionNames`

A list of collection names.

### Constructors

#### `public CollectionNamesResult()`

Default constructor.

#### `public CollectionNamesResult(ErrorCode errorCode, List<String> collectionNames)`

Constructor to initialize the `CollectionNamesResult` with a specific error code and list of collection names.

- **Parameters:**
  - `errorCode` - The error code indicating the result of the operation.
  - `collectionNames` - A list of collection names.