# CollectionMetadata

## `public class CollectionMetadata`

This class represents the metadata of a collection used in the face recognition system.

### Fields

#### `public String collectionName`

The name of the collection.

#### `public long numIdentities`

The number of unique identities in the collection.

#### `public long numFaceprints`

The total number of Faceprints enrolled in the collection.

#### `public String modelName`

The name of the face recognition model used to generate the Faceprints enrolled in the collection.

#### `public int featureVectorSizeBytes`

The size of the Faceprint feature vector in bytes.

#### `public ModelOptions modelOptions`

Additional options which were used to generate Faceprints enrolled in the collection.

#### `public boolean encrypted`

Indicates if the collection is encrypted.

### Constructors

#### `public CollectionMetadata()`

Default constructor.

#### `public CollectionMetadata(String collectionName, long numIdentities, long numFaceprints, String modelName, int featureVectorSizeBytes, ModelOptions modelOptions, boolean encrypted)`

Constructor to initialize the `CollectionMetadata` with specific values.

- **Parameters:**
  - `collectionName` - The name of the collection.
  - `numIdentities` - The number of unique identities in the collection.
  - `numFaceprints` - The total number of Faceprints enrolled in the collection.
  - `modelName` - The name of the face recognition model used to generate the Faceprints enrolled in the collection.
  - `featureVectorSizeBytes` - The size of the Faceprint feature vector in bytes.
  - `modelOptions` - Additional options which were used to generate Faceprints enrolled in the collection.
  - `encrypted` - Indicates if the collection is encrypted.