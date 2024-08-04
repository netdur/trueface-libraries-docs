# Faceprint

## `public class Faceprint`

Face feature vector and meta data.

### Fields

#### `public List<Float> featureVector`

Vector of floats which describe the face.

#### `public String sdkVersion`

SDK version used to generate the feature vector.

#### `public String modelName`

Name of the model used to generate the feature vector.

#### `public ModelOptions modelOptions`

Additional options used when generating the feature vector.

### Constructors

#### `public Faceprint()`

Default constructor.

#### `public Faceprint(List<Float> featureVector, String sdkVersion, String modelName, ModelOptions modelOptions)`

Constructor to initialize the `Faceprint` with specific values.

- **Parameters:**
  - `featureVector` - Vector of floats which describe the face.
  - `sdkVersion` - SDK version used to generate the feature vector.
  - `modelName` - Name of the model used to generate the feature vector.
  - `modelOptions` - Additional options used when generating the feature vector.