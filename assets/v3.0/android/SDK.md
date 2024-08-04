The content of the `SDK.java` file appears to include several additional methods and details. Here is the revised complete documentation, ensuring all public methods are included:

# Documentation

## `public SDK(Context context)`

Initialize the SDK using default configuration options.

* **Parameters:** `context` — Application context.
* **See also:** ConfigurationOptions

## `public SDK(Context context, ConfigurationOptions options)`

Initialize the SDK using custom configuration options.

* **Parameters:**
   * `context` — Application context.
   * `options` — Custom configuration options.
* **See also:** ConfigurationOptions

## `public SDK(Context context, long pointer)`

Initialize the SDK using an already initialized pointer.

* **Parameters:**
   * `context` — Application context.
   * `pointer` — SDK pointer.

## `public void setAutoDestroyOnGC(boolean autoDestroyOnGC)`

Disable destroying SDK on garbage collector event.

* **Parameters:** `autoDestroyOnGC` — Boolean flag.

## `public long getPointer()`

Get SDK pointer.

* **Returns:** Pointer.

## `public native void destroy()`

Manually destroy SDK.

## `public boolean setLicense(String token)`

Validate the given license token. This method must be called before using the SDK.

* **Parameters:** `token` — The license token.
* **Returns:** Whether the given license token is valid.
* **See also:**
   * this.isLicensed
   * this.getExpireTime

## `public boolean isLicensed()`

Check whether the given license token is valid and you can use the SDK.

* **Returns:** Whether the given license token is valid.
* **See also:**
   * this.setLicense
   * this.getExpireTime

## `public int getExpireTime()`

* **Returns:** The number of remaining days that the token is valid for.
* **See also:**
   * this.setLicense
   * this.isLicensed

## `public String getSDKVersion()`

Get the version number of the C++ SDK.

* **Returns:** Version number as a string.

## `public String getVersion()`

Get the version-build number of the Android SDK.

* **Returns:** Version number as a string.

## `public Image preprocessImage(String path)`

Preprocess the image to be used by other methods.

* **Parameters:** `path` — The path of a JPEG, JPG, PNG, BMP, or TIFF file.
* **Returns:** The preprocessed image.
* **See also:** Image

## `public Image preprocessImage(android.media.Image image)`

Preprocess the image to be used by other methods.

* **Parameters:** `image` — (android.media.Image) Image ideally from live camera buffer.
* **Returns:** The preprocessed image.
* **See also:** Image

## `public Image preprocessImage(Bitmap bitmap, ColorCode color)`

Preprocess the image to be used by other methods.

* **Parameters:**
   * `bitmap` — Bitmap image.
   * `color` — The image color model.
* **Returns:** The preprocessed image.
* **See also:** Image

## `public Image preprocessImage(Bitmap bitmap)`

Preprocess the image to be used by other methods.

* **Parameters:** `bitmap` — Bitmap image.
* **Returns:** The preprocessed image.
* **See also:** Image

## `public Image preprocessImage(int width, int height, byte[] data, ColorCode colorCode)`

Preprocess the image to be used by other methods.

* **Parameters:**
   * `colorCode` — Color space.
   * `data` — An 8-bit decoded image array, in the CPU memory or the GPU memory.
   * `width` — The image width.
   * `height` — The image height.
* **Returns:** The preprocessed image.
* **See also:** Image

## `public Image preprocessImage(int width, int height, byte[] data)`

Preprocess the image to be used by other methods.

* **Parameters:**
   * `data` — An 8-bit decoded image array, in the CPU memory or the GPU memory.
   * `width` — The image width.
   * `height` — The image height.
* **Returns:** The preprocessed image.
* **See also:** Image

## `public BoundingBox[] detectObjects(Image image)`

Detect people and objects in the image.

* **Parameters:** `image` — The input image returned by preprocessImage().
* **Returns:** A vector of BoundingBox objects that gets populated with the detected objects.
* **See also:** this.getObjectLabelString

## `public Point[] getFaceLandmarks(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Obtain the 106 face landmarks.

* **Parameters:**
   * `image` — The input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
* **Returns:** An array of 106 face landmark points.

## `public FaceBoxAndLandmarks detectLargestFace(Image image)`

Detect the largest face in the image.

* **Parameters:** `image` — The input image returned by preprocessImage().
* **Returns:** The bounding box and landmarks.
* **See also:** this.detectFaces

## `public FaceBoxAndLandmarks[] detectFaces(Image image)`

Detect all the faces in the image. This method has a small false positive rate. To reduce the false positive rate to near zero, filter out faces with a score lower than 0.90.

* **Parameters:** `image` — The input image returned by preprocessImage().
* **Returns:** A vector of bounding box and landmarks.

## `public Facechip extractAlignedFace(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Align the detected face to be optimized for passing to feature extraction. If using the face chip with Trueface algorithms, do not change the default margin and scale values.

* **Parameters:**
   * `image` — The input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — The FaceBoxAndLandmarks returned by detectLargestFace() or detectFaces().
* **Returns:** Facechip.
* **See also:** Facechip

## `public float estimateFaceImageQuality(Facechip facechip)`

Estimate the quality of the face image for recognition.

* **Parameters:** `facechip` — The Facechip returned by extractAlignedFace().
* **Returns:** Quality, a value between 0 to 1, 1 being perfect quality for recognition.

## `public Faceprint getLargestFaceFeatureVector(Image image)`

Detect the largest face in the image and return its feature vector.

* **Parameters:** `image` — The input image returned by preprocessImage().
* **Returns:** A Faceprint object which will contain the face feature vector.

## `public Faceprint getFaceFeatureVector(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Extract the face feature vector from an aligned face image.

* **Parameters:**
   * `image` — The input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — Face box returned by detectFaces() or detectLargestFace().
* **Returns:** Faceprint to contain the face template.

## `public Similarity getSimilarity(Faceprint faceprint1, Faceprint faceprint2)`

Compute the similarity between two feature vectors, or how similar two faces are.

* **Parameters:**
   * `faceprint1` — Faceprint of the first template to be compared.
   * `faceprint2` — Faceprint of the second template to be compared.
* **Returns:** The computed similarity measure.

## `public EstimateHeadOrientation estimateHeadOrientation(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Estimate the head pose.

* **Parameters:**
   * `image` — The input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
* **Returns:** EstimateHeadOrientation.
* **See also:** EstimateHeadOrientation

## `public BlinkState detectBlink(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Estimate score for eye blink.

* **Parameters:**
   * `image` — The input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
* **Returns:** BlinkState.
* **See also:** BlinkState

## `public ErrorCode checkSpoofImageFaceSize(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks, ActiveSpoofStage activeSpoofStage)`

Ensure that the face size meets the requirements for active spoof. This function must be called before calling detectActiveSpoof().

* **Parameters:**
   * `image` — The input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — The face on which to run active spoof detection.
   * `activeSpoofStage` — The stage of the image, either near stage or far stage.
* **Returns:** Error code.

## `public Spoof detectActiveSpoof(Point[] nearFaceLandmarks, Point[] farFaceLandmarks)`

Detect if there is a presentation attack attempt. Must call checkSpoofImageFaceSize() on both input faces before calling this function.

* **Parameters:**
   * `nearFaceLandmarks` — The face landmarks of the near face, obtained by calling getFaceLandmarks().
   * `farFaceLandmarks` — The face landmarks of the far face, obtained by calling getFaceLandmarks().
* **Returns:** Spoof. If the spoof score is above the threshold, then it is classified as a real face. If the spoof score is below the threshold, then it

 is classified as a fake face.

## `public Spoof detectSpoof(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks, float threshold)`

Detect if there is a presentation attack attempt.

* **Parameters:**
   * `image` — The input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
   * `threshold` — The spoof score threshold above which it is considered a spoof attempt.
* **Returns:** Spoof.
* **See also:** Spoof

## `public Spoof detectSpoof(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Detect if there is a presentation attack attempt.

* **Parameters:**
   * `image` — The input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
* **Returns:** Spoof.
* **See also:** Spoof

## `public ErrorCode createDatabaseConnection(String databaseConnectionString)`

Create a connection to a new or existing database. If the database does not exist, a new one will be created with the provided name.

* **Parameters:** `databaseConnectionString` — If SQLITE DatabaseManagementSystem is selected, this should be the filepath to the database.
* **Returns:** Error code.

## `public ErrorCode createLoadCollection(String collectionName)`

Create a new collection, or load data from an existing collection into memory if one with the provided name already exists in the database.

* **Parameters:** `collectionName` — The name of the collection.
* **Returns:** Error code.

## `public ErrorCode createCollection(String collectionName)`

Create a new collection in the database. Before enrolling Faceprints into the newly created collection, you must call loadCollection(). If the collection with the provided name already exists, this is a harmless no-op.

* **Parameters:** `collectionName` — The name of the collection.
* **Returns:** Error code.

## `public ErrorCode loadCollection(String collectionName)`

Load the collection into memory. Must be called before enrolling Faceprints or calling identification functions.

* **Parameters:** `collectionName` — The name of the collection to load into memory.
* **Returns:** Error code.

## `public ErrorCode deleteCollection(String collectionName)`

Delete a collection from the current database.

* **Parameters:** `collectionName` — The name of the collection to delete.
* **Returns:** Error code.

## `public String enrollFaceprint(Faceprint faceprint, String identity)`

Enroll a template for a new or existing identity in the collection.

* **Parameters:**
   * `faceprint` — The template to enroll in the collection.
   * `identity` — The identity corresponding to the template.
* **Returns:** UUID universally unique identifier corresponding to the template.

## `public String[] getCollectionNames()`

Get a list of the names of all the collections in the database. Collection names can then be passed to getCollectionMetadata() and getCollectionIdentities().

* **Returns:** List of collection names in the database.

## `public CollectionMetadata getCollectionMetadata(String collectionName)`

Get the metadata for the specified collection in the database, loaded or unloaded.

* **Parameters:** `collectionName` — The name of the collection for which to retrieve the metadata.
* **Returns:** Metadata for the specified collection.

## `public HashMap<String, String> getCollectionIdentities(String collectionName)`

Get a map of identities and UUIDs for the specified collection in the database, loaded or unloaded. This can be a slow operation (especially for unloaded collections), call sparingly.

* **Parameters:** `collectionName` — The name of the collection for which to retrieve the identities.
* **Returns:** Identities, a map of identities and corresponding UUIDs.

## `public ErrorCode removeByUUID(String UUID)`

Remove a template from the collection using the UUID.

* **Parameters:** `UUID` — The universally unique identifier corresponding to the template to be removed from the collection.
* **Returns:** Error code.

## `public ErrorCode removeByIdentity(String identity)`

Remove all templates in the collection corresponding to the identity.

* **Parameters:** `identity` — The identity to remove from the collection.
* **Returns:** Error code.

## `public Candidate identifyTopCandidate(Faceprint faceprint, float threshold)`

Get the top candidate identity in the collection and the corresponding similarity score and match probability.

* **Parameters:**
   * `faceprint` — The template to be identified.
   * `threshold` — The similarity score threshold above which it is considered a match.
* **Returns:** Candidate.

## `public MaskResult detectMask(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Detect whether the face in the image is wearing a mask.

* **Parameters:**
   * `image` — The input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
* **Returns:** MaskResult.
* **See also:** MaskResult

## `public GlassesDetectionResult detectGlasses(Image image, FaceBoxAndLandmarks faceBoxAndLandmarks)`

Detect whether the face in the image is wearing any type of eyeglasses.

* **Parameters:**
   * `image` — The input image returned by preprocessImage().
   * `faceBoxAndLandmarks` — FaceBoxAndLandmarks returned by detectFaces() or detectLargestFace().
* **Returns:** GlassesDetectionResult.
* **See also:** GlassesDetectionResult

## `public RotateFlags getFaceImageRotation(Image image)`

Detect the orientation of a face image. Returns the rotation required to achieve neutral orientation. As this method does add overhead, we advise only adding it to your pipeline when doing offline processing (e.g., reading a database of ID images where some ID images may not be oriented correctly).

* **Parameters:** `image` — The input image returned by preprocessImage().
* **Returns:** The rotation required to achieve neutral orientation.

## `public FaceImageBlurDetectionResult detectFaceImageBlur(Facechip facechip)`

Determine if the face image is blurry or of good quality for face recognition.

* **Parameters:** `facechip` — The Facechip returned by extractAlignedFace().
* **Returns:** FaceImageBlurDetectionResult, which contains the quality and blur score.

## `public Faceprint jsonToFaceprint(String jsonStr)`

Convert a JSON string representation of a Faceprint to a Faceprint object.

* **Parameters:** `jsonStr` — The JSON string representation of a Faceprint.
* **Returns:** The Faceprint object populated from the JSON string.
