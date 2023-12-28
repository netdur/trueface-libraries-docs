# Documentation

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

## `public SDK(Context context, long pointer)`

Initialize the SDK using already initialized pointer

* **Parameters:**
   * `context` — Application context.
   * `pointer` — SDK pointer

## `public void setAutoDestroyOnGC(boolean autoDestroyOnGC)`

Disable destroying SDK on garbage collector event

* **Parameters:** `autoDestroyOnGC` — boolean

## `public long getPointer()`

Get SDK pointer

* **Returns:** pointer

## `public native void destroy()`

Manually destroy SDK

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

## `public String getSDKVersion()`

Gets the version number of the C++ SDK.

* **Returns:** Version Number as a String.

## `public String getVersion()`

Gets the version-build number of the Android SDK.

* **Returns:** Version Number as a String.

## `public Image preprocessImage(String path)`

Preprocess the image to be used by the other methods.

* **Parameters:** `path` — the path of a JPEG, JPG, PNG, BMP, or TIFF file (path must not contain ~ ).
* **Returns:** the preprocesses image.
* **See also:** Image

## `public Image preprocessImage(android.media.Image image)`

Preprocess the image to be used by the other methods.

* **Parameters:** `image` — (android.media.Image) image ideally from live camera buffer
* **Returns:** the preprocesses image.
* **See also:** Image

## `public Image preprocessImage(Bitmap bitmap, ColorCode color)`

Preprocess the image to be used by the other methods.

* **Parameters:**
   * `bitmap` — bitmap image.
   * `color` — the image color model.
* **Returns:** the preprocesses image.
* **See also:** Image

## `public Image preprocessImage(Bitmap bitmap)`

Preprocess the image to be used by the other methods.

* **Parameters:** `bitmap` — bitmap image.
* **Returns:** the preprocesses image.
* **See also:** Image

## `public Image preprocessImage(int width, int height, byte[] data, ColorCode colorCode)`

Preprocess the image to be used by the other methods.

* **Parameters:**
   * `colorCode` — color space
   * `data` — an 8-bit decoded image array, in the CPU memory or the GPU memory.
   * `width` — the image width.
   * `height` — the image height.
* **Returns:** the preprocesses image.
* **See also:** Image

## `public Image preprocessImage(int width, int height, byte[] data)`

Preprocess the image to be used by the other methods.

* **Parameters:**
   * `data` — an 8-bit decoded image array, in the CPU memory or the GPU memory.
   * `width` — the image width.
   * `height` — the image height.
* **Returns:** the preprocesses image.
* **See also:** Image

## `public BoundingBox[] detectObjects(Image image)`

Detect people and objects in the image.

* **Parameters:** `image` — the input image returned by preprocessImage().
* **Returns:** a vector of BoundingBox objects that gets populated with the detected objects.
* **See also:** this.getObjectLabelString

## `public Point[] getFaceLandmarks(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Obtain the 106 face landmarks.

* **Parameters:**
   * `image` — the input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
* **Returns:** landmarks an array of 106 face landmark points.

## `public FaceBoxAndLandmarks detectLargestFace(Image image)`

Detect the largest face in the image. See detectFaces() for the detection scale range.

* **Parameters:** `image` — the input image returned by preprocessImage().
* **Returns:** the bounding box and landmarks.
* **See also:** this.detectFaces

## `public FaceBoxAndLandmarks[] detectFaces(Image image)`

Detect all the faces in the image. This method has a small false positive rate. To reduce the false positive rate to near zero, filter out faces with score lower than 0.90.

The face detector has a detection scale range of about 5 octaves. \ref ConfigurationOptions.smallestFaceHeight determines the lower of the detection scale range. E.g., setting \ref ConfigurationOptions.smallestFaceHeight to 40 pixels yields the detection scale range of ~40 pixels to 1280 (=40x2^5) pixels.

* **Parameters:** `image` — the input image returned by preprocessImage().
* **Returns:** a vector of bounding box and landmarks.

## `public Facechip extractAlignedFace(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Align the the detected face to be optimized for passing to feature extraction. If using the face chip with Trueface algorithms (ex face recognition), do not change the default margin and scale values.

* **Parameters:**
   * `image` — the input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — the FaceBoxAndLandmarks returned

     by detectLargestFace() or detectFaces().
* **Returns:** facechip
* **See also:** Facechip

## `public float estimateFaceImageQuality(Facechip facechip)`

Estimate the quality of the face image for recognition.

* **Parameters:** `facechip` — The Facechip returned by extractAlignedFace().
* **Returns:** quality a value between 0 to 1, 1 being prefect quality for recognition.

  We suggest using a threshold of 0.999 as a filter for enrollment images.

## `public Faceprint getLargestFaceFeatureVector(Image image)`

Detect the largest face in the image and return its feature vector.

* **Parameters:** `image` — the input image returned by preprocessImage().
* **Returns:** a Faceprint object which will contain the face feature vector.

## `public Faceprint getFaceFeatureVector(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Extract the face feature vector from an aligned face image.

* **Parameters:**
   * `image` — the input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — face box returned by detectFaces() or detectLargestFace().
* **Returns:** Faceprint to contain the face template.

## `public Similarity getSimilarity(Faceprint faceprint1, Faceprint faceprint2)`

Compute the similarity between two feature vectors, or how similar two faces are.

* **Parameters:**
   * `faceprint1` — Faceprint of first template to be compared.
   * `faceprint2` — Faceprint of second template to be compared.
* **Returns:** the computed similarity measure.

## `public EstimateHeadOrientation estimateHeadOrientation(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Estimate the head pose.

* **Parameters:**
   * `image` — the input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
* **Returns:** EstimateHeadOrientation
* **See also:** EstimateHeadOrientation

## `public BlinkState detectBlink(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Estimate score for eye blink.

* **Parameters:**
   * `image` — the input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
* **Returns:** BlinkState
* **See also:** BlinkState

## `public ErrorCode checkSpoofImageFaceSize(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks, ActiveSpoofStage activeSpoofStage)`

Ensures that the face size meets the requirements for active spoof. Must check return value of function! Active spoof works by analyzing the way a persons face changes as they move closer to a camera. The active spoof solution therefore expects the face a certain distance from the camera. **In the far image, the face should be about 18 inches from the camera, while in the near image, the face should be 7-8 inches from the camera.**

This function must be called before calling detectActiveSpoof().

* **Parameters:**
   * `image` — the input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — The face on which to run active spoof detection.
   * `activeSpoofStage` — The stage of the image, either near stage or far stage.
* **Returns:** error code, see ErrorCode.

  If `ErrorCode::NO_ERROR` is returned, then the image is eligible for active spoof detection.

  If `ErrorCode::FACE_TOO_CLOSE` or `ErrorCode::FACE_TOO_FAR` is returned, the image is not eligible for active spoof detection.

    <p>

## `public Spoof detectActiveSpoof(Point[] nearFaceLandmarks, Point[] farFaceLandmarks)`

Detect if there is a presentation attack attempt. Must call checkSpoofImageFaceSize() on both input faces before calling this function.

* **Parameters:**
   * `nearFaceLandmarks` — The face landmarks of the near face, obtained by calling getFaceLandmarks().
   * `farFaceLandmarks` — The face landmarks of the far face, obtained by calling getFaceLandmarks().
* **Returns:** Spoof The predicted spoof result, using a spoofScore threshold of 1.05.

  If the spoof score is above the threshold, then it is classified as a real face.

  If the spoof score is below the threshold, then it is classified as a fake face.

## `public Spoof detectSpoof(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks, float threshold)`

Detect if there is a presentation attack attempt.

* **Parameters:**
   * `image` — the input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
   * `threshold` — the spoof score threshold above which it is considered a spoof attempt.
* **Returns:** Spoof
* **See also:** Spoof

## `public Spoof detectSpoof(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Detect if there is a presentation attack attempt.

* **Parameters:**
   * `image` — the input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
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

## `public ErrorCode createCollection(String collectionName)`

Create a new collection in the database. Before enrolling Faceprints into newly created collection, must call loadCollection(). If the collection with the provided name already exists, this is a harmless no-op.

* **Parameters:** `collectionName` — the name of the collection.
* **Returns:** error code, see ErrorCode.

## `public ErrorCode loadCollection(String collectionName)`

Loads the collection into memory. Must be called before enrolling Faceprints or calling identification functions.

* **Parameters:** `collectionName` — the name of the collection to load into memory.
* **Returns:** error code, see ErrorCode.

  Will return an error if the collection does not exist.

## `public ErrorCode deleteCollection(String collectionName)`

Deletes a collection from the current database.

* **Parameters:** `collectionName` — the name of the collection to delete.
* **Returns:** error code, see ErrorCode.

  Will return an error if the collection does not exist.

## `public String enrollFaceprint(Faceprint faceprint, String identity)`

Enroll a template for a new or existing identity in the collection.

* **Parameters:**
   * `faceprint` — the template to enroll in the collection.
   * `identity` — the identity corresponding to the template.
* **Returns:** UUID universally unique identifier corresponding to the template.

## `public String[] getCollectionNames()`

Get a list of the names of all the collections in the database. Collection names can then be passed to getCollectionMetadata() and getCollectionIdentities().

* **Returns:** list of collection names in the database.

## `public CollectionMetadata getCollectionMetadata(String collectionName)`

Get the metadata for the specified collection in the database, loaded or unloaded.

* **Parameters:** `collectionName` — the name of the collection for which to retrieve the metadata.
* **Returns:** metadata the metadata for the specified collection.

## `public HashMap<String, String> getCollectionIdentities(String collectionName)`

Get a map of identities and UUIDs for the specified collection in the database, loaded or unloaded. This can be a slow operation (especially for unloaded collections), call sparingly.

* **Parameters:** `collectionName` — the name of the collection for which to retrieve the identities.

  There can be multiple UUIDs mapped to a single identity if multiple Faceprints were enrolled for that identity.
* **Returns:** identities a map of identities and corresponding UUIDs.

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

## `public MaskResult detectMask(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Detect whether the face in the image is wearing a mask or not

* **Parameters:**
   * `image` — the input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — returned by detectFaces() or detectLargestFace().
* **Returns:** MaskResult
* **See also:** MaskResult

## `public GlassesLabel detectGlasses(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Detect whether the face in the image is wearing any type of eye glasses or not

* **Parameters:**
   * `image` — the input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — returned by detectFaces() or detectLargestFace().
* **Returns:** GlassesLabel

  #see GlassesLabel