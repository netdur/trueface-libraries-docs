# SimilarityResult

## `public class SimilarityResult`

This class represents the result of a similarity comparison operation, containing the match probability and similarity measure.

### Fields

#### `public float matchProbability`

The probability that the two face feature vectors are a match.

#### `public float similarityMeasure`

The computed similarity measure.

### Constructors

#### `public SimilarityResult()`

Default constructor.

#### `public SimilarityResult(float matchProbability, float similarityMeasure)`

Constructor to initialize the `SimilarityResult` with specific values.

- **Parameters:**
  - `matchProbability` - The probability that the two face feature vectors are a match.
  - `similarityMeasure` - The computed similarity measure.