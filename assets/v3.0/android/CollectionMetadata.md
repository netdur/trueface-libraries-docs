# CollectionMetadata

Metadata describing a Faceprint collection.

## Fields

- `String collectionName` - The name of the collection.
- `long numIdentities` - The number of unique identities in the collection.
- `long numFaceprints` - The total number of Faceprints enrolled in the collection.
- `String modelName` - The name of the face recognition model used to generate the Faceprints in the collection.
- `int featureVectorSizeBytes` - The size of the Faceprint feature vector in bytes.
- `ModelOptions modelOptions` - Options used to generate the Faceprints in the collection. See [ModelOptions](/v3.0/android/ModelOptions).
- `boolean encrypted` - Indicates if the collection is encrypted.
