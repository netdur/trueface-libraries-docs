# FaceBoxAndLandmarks

Face bounding box and facial landmarks.

## Fields

- `Point topLeft` - The top left corner [Point](/v3.0/android/Point) of the bounding box.
- `Point bottomRight` - The bottom right corner [Point](/v3.0/android/Point) of the bounding box.
- `List<Point> landmarks` - Facial landmarks: subject right eye, subject left eye, nose, subject right mouth corner, subject left mouth corner.
- `float score` - Likelihood of this being a true positive.
