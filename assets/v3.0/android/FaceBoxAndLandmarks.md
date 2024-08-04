# FaceBoxAndLandmarks

## `public class FaceBoxAndLandmarks`

This class represents the face bounding box and facial landmarks.

### Fields

#### `public Point topLeft`

The top left corner of the bounding box.

#### `public Point bottomRight`

The bottom right corner of the bounding box.

#### `public List<Point> landmarks`

A list of points representing the facial landmarks: subject's right eye, subject's left eye, nose, subject's right mouth corner, subject's left mouth corner.

#### `public float score`

Likelihood of this being a true positive.

### Constructors

#### `public FaceBoxAndLandmarks()`

Default constructor.

#### `public FaceBoxAndLandmarks(Point topLeft, Point bottomRight, List<Point> landmarks, float score)`

Constructor to initialize the `FaceBoxAndLandmarks` with specific values.

- **Parameters:**
  - `topLeft` - The top left corner of the bounding box.
  - `bottomRight` - The bottom right corner of the bounding box.
  - `landmarks` - A list of points representing the facial landmarks.
  - `score` - Likelihood of this being a true positive.