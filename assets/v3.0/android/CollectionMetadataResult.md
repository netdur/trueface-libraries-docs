# CollectionMetadataResult

## `public class CollectionMetadataResult`

This class represents the result of a collection metadata retrieval operation, containing an error code and the collection metadata.

### Fields

#### `public ErrorCode errorCode`

The error code indicating the result of the operation.

#### `public CollectionMetadata metadata`

The metadata of the collection.

### Constructors

#### `public CollectionMetadataResult()`

Default constructor.

#### `public CollectionMetadataResult(ErrorCode errorCode, CollectionMetadata metadata)`

Constructor to initialize the `CollectionMetadataResult` with a specific error code and collection metadata.

- **Parameters:**
  - `errorCode` - The error code indicating the result of the operation.
  - `metadata` - The metadata of the collection.