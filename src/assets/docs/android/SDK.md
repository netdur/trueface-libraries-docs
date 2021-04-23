# SDK

## `public SDK(Context context)`

Initialize the SDK using default configuration options.

 * **Parameters:** `context` — Application context.
 * **See also:** ConfigurationOptions

## `public SDK(Context context, ConfigurationOptions options)`

Initialize the SDK using custom configuration options.

 * **Parameters:**
   * `context` — Application context.
   * `options` — custom configuration options.
 * **See also:** ConfigurationOptions

## `public boolean setLicense(String token)`

Validates the given license token. Need to call this method before being able to use the SDK.

 * **Parameters:** `token` — the license token (if you do not have this talk to support@trueface.ai).
 * **Returns:** Whether the given license token is valid.
 * **See also:**
   * this.isLicensed
   * this.getExpireTime

## `public boolean isLicensed()`

Checks whether the given license token is valid and you can use the SDK.

 * **Returns:** Whether the given license token is valid.
 * **See also:**
   * this.setLicense
   * this.getExpireTime

## `public int getExpireTime()`

 * **Returns:** the number of remaining days that the token is valid for.
 * **See also:**
   * this.setLicense
   * this.isLicensed

## `public String getVersion()`

Gets the version-build number of the SDK.

 * **Returns:** Version Number as a String.

## `@Deprecated public String getMobileVersion()`

Gets the version-build number of the SDK.

 * **Returns:** Version Number as a String.

## `public ErrorCode setImage(YuvImage image)`

Set the image that is processed by the other methods.

 * **Parameters:** `image` — image ideally from live camera buffer
 * **Returns:** error code
 * **See also:** ErrorCode

## `public ErrorCode setImage(Image image)`

Set the image that is processed by the other methods.

 * **Parameters:** `image` — image ideally from live camera buffer
 * **Returns:** error code
 * **See also:** ErrorCode

## `public ErrorCode setImage(Bitmap bitmap, ColorCode color)`

Set the image that is processed by the other methods.

 * **Parameters:**
   * `bitmap` — bitmap image.
   * `color` — the image color model.
 * **Returns:** error code
 * **See also:**
   * ErrorCode
   * ColorCode

## `public ErrorCode setImage(Bitmap bitmap)`

Set the image that is processed by the other methods.

 * **Parameters:** `bitmap` — bitmap image.
 * **Returns:** error code
 * **See also:** ErrorCode

## `public ErrorCode setImage(int width, int height, byte[] data, ColorCode colorCode)`

Set the image that is processed by the other methods.

 * **Parameters:**
   * `data` — an 8-bit decoded image array, in the CPU memory or the GPU memory.
   * `width` — the image width.
   * `height` — the image height.
 * **Returns:** error code
 * **See also:** ErrorCode

## `public ErrorCode setImage(String path)`

Set the image that is processed by the other methods.

 * **Parameters:** `path` — the path of a JPEG, JPG, PNG, or TIFF file (path must not contain ~ ).
 * **Returns:** error code
 * **See also:** ErrorCode

## `public BoundingBox[] detectObjects()`

Detect people and objects in the image.

 * **Returns:** a vector of BoundingBox objects that gets populated with the detected objects.
 * **See also:** this.getObjectLabelString

## `public String getObjectLabelString(ObjectLabel label)`

Converts an object label to a String. This can be used to display the object labels.

 * **Parameters:** `label` — the label of a BoundingBox.
 * **Returns:** The object label as a String.
 * **See also:** this.detectObjects

## `public FaceBoxAndLandmarks detectLargestFace()`

Detect the largest face in the image. See detectFaces() for the detection scale range.

 * **Returns:** the bounding box and landmarks.
 * **See also:** this.detectFaces

## `public FaceBoxAndLandmarks[] detectFaces()`

Detect all the faces in the image. This method has a small false positive rate. To reduce the false positive rate to near zero, filter out faces with score lower than 0.90.

The face detector has a detection scale range of about 5 octaves. \ref ConfigurationOptions.smallestFaceHeight determines the lower of the detection scale range. E.g., setting \ref ConfigurationOptions.smallestFaceHeight to 40 pixels yields the detection scale range of ~40 pixels to 1280 (=40x2^5) pixels.

 * **Returns:** a vector of bounding box and landmarks.

## `public Faceprint getLargestFaceFeatureVector()`

Detect the largest face in the image and return its feature vector.

 * **Returns:** a Faceprint object which will contain the face feature vector.

## `public Faceprint getFaceFeatureVector(FaceBoxAndLandmarks faceBoxAndLandmarks)`

Extract the face feature vector from an aligned face image.

 * **Parameters:** `faceBoxAndLandmarks` — face box returned by detectFaces() or detectLargestFace().
 * **Returns:** Faceprint to contain the face template.

## `public Similarity getSimilarity(Faceprint faceprint1, Faceprint faceprint2)`

Compute the similarity between two feature vectors, or how similar two faces are.

 * **Parameters:**
   * `faceprint1` — Faceprint of first template to be compared.
   * `faceprint2` — Faceprint of second template to be compared.
 * **Returns:** the computed similarity measure.

## `public EstimateHeadOrientation estimateHeadOrientation(FaceBoxAndLandmarks faceBoxAndLandmarks)`

Estimate the head pose.

 * **Parameters:** `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
 * **Returns:** EstimateHeadOrientation
 * **See also:** EstimateHeadOrientation

## `@Deprecated public BlinkDetection detectBlink()`

Estimate score for eye blink.

 * **Returns:** BlinkDetection
 * **See also:** BlinkDetection

## `@Deprecated public Spoof detectSpoof(FaceBoxAndLandmarks faceBoxAndLandmarks, float threshold)`

Detect if there is a presentation attack attempt.

 * **Parameters:**
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
   * `threshold` — the spoof score threshold above which it is considered a spoof attempt.
 * **Returns:** Spoof
 * **See also:** Spoof

## `public ErrorCode createDatabaseConnection(String databaseConnectionString)`

Create a connection to a new or existing database. If the database does not exist, a new one will be created with the provided name. If the NONE DatabaseManagementSystem (memory only) configuration option is selected, this function does not need to be called (and is a harmless no-op).

 * **Parameters:** `databaseConnectionString` — If SQLITE DatabaseManagementSystem is selected, this should be the filepath to the database.

     ex. "myDatabase.db" (note, a prefix to app folder is added)

     <p>
 * **Returns:** error code

     #see ErrorCode

## `public ErrorCode createLoadCollection(String collectionName)`

Create a new collection, or load data from an existing collection into memory (RAM) if one with the provided name already exists in the database.

 * **Parameters:** `collectionName` — the name of the collection.
 * **Returns:** error code

     #see ErrorCode

## `public String enrollFaceprint(Faceprint faceprint, String identity)`

Enroll a template for a new or existing identity in the collection.

 * **Parameters:**
   * `faceprint` — the template to enroll in the collection.
   * `identity` — the identity corresponding to the template.
 * **Returns:** UUID universally unique identifier corresponding to the template.

## `public ErrorCode removeByUUID(String UUID)`

Remove a template from the collection using the UUID.

 * **Parameters:** `UUID` — the universally unique identifier corresponding to the template to be removed from the collection.
 * **Returns:** error code

     #see ErrorCode

## `public ErrorCode removeByIdentity(String identity)`

Remove all templates in the collection corresponding to the identity.

 * **Parameters:** `identity` — the identity to remove from the collection.
 * **Returns:** error code

     #see ErrorCode

## `public Candidate identifyTopCandidate(Faceprint faceprint, float threshold)`

Get the top candidate identity in the collection and the corresponding similarity score and match probability.

 * **Parameters:**
   * `faceprint` — the template to be identified.
   * `threshold` — the similarity score threshold above which it is considered a match.

     Higher thresholds may result in faster queries.

     Refer to https://performance.trueface.ai/ when selecting a threshold.
 * **Returns:** Candidate
 * **See also:** Candidate

## `public Candidate[] identifyTopCandidates(Faceprint faceprint, int numCandidates, float threshold)`

Get a list of the top n candidate identities in the collection and their corresponding similarity scores and match probabilities.

 * **Parameters:**
   * `faceprint` — the template to be identified.
   * `numCandidates` — max number of candidate identities to return.
   * `threshold` — the similarity score threshold above which it is considered a match.

     Higher thresholds may result in faster queries.

     Refer to https://performance.trueface.ai/ when selecting a threshold.
 * **Returns:** list candidates
 * **See also:** Candidate

## `public MaskResult detectMask(FaceBoxAndLandmarks faceBoxAndLandmarks)`

Detect whether the face in the image is wearing a mask or not

 * **Parameters:** `faceBoxAndLandmarks` — returned by detectFaces() or detectLargestFace().
 * **Returns:** MaskResult
 * **See also:** MaskResult

## `public GlassesLabel detectGlasses(FaceBoxAndLandmarks faceBoxAndLandmarks)`

Detect whether the face in the image is wearing any type of eye glasses or not

 * **Parameters:** `faceBoxAndLandmarks` — returned by detectFaces() or detectLargestFace().
 * **Returns:** GlassesLabel

     #see GlassesLabel
