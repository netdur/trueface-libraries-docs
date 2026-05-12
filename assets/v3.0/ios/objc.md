# Objective-C API

This is the reference for the public types and methods exposed by `<trueface/tf_sdk_binding.h>`. All classes and enums are prefixed with `TF` and are usable from both Objective-C and Swift.

---

## Enums

### TFErrorCode
Status codes returned from SDK operations. `NO_ERROR` indicates success.

```
NO_ERROR
INVALID_LICENSE
FILE_READ_FAIL
UNSUPPORTED_IMAGE_FORMAT
UNSUPPORTED_MODEL
NO_FACE_IN_FRAME
FAILED
COLLECTION_CREATION_ERROR
DATABASE_CONNECTION_ERROR
ENROLLMENT_ERROR
MAX_COLLECTION_SIZE_EXCEEDED
NO_RECORD_FOUND
NO_COLLECTION_FOUND
COLLECTION_DELETION_ERROR
EXTREME_FACE_ANGLE
FACE_TOO_CLOSE
FACE_TOO_FAR
FACE_TOO_SMALL
FACE_NOT_CENTERED
EYES_CLOSED
MASK_DETECTED
TOO_DARK
TOO_BRIGHT
DATABASE_NOT_CONNECTED
COLLECTION_NOT_LOADED
FEATURE_NOT_SUPPORTED
COLLECTION_IS_EMPTY
INPUT_IS_EMPTY
STRING_CANNOT_CONTAIN_HYPHEN
STRING_CANNOT_CONTAIN_UPPERCASE
NO_COLLECTION_SPECIFIED
POSTGRESQL_VERSION_MISMATCH
INVALID_ARGUMENT
```

### TFColorCode
Pixel layout of a raw image buffer passed to `preprocessImageWithData:`.

```
bgr
rgb
bgra
rgba
gray
yuv_i420
yuv_nv12
```

### TFObjectLabel
The 80 object classes returned by `detectObjects:`. `object_fork` and `object_clock` are prefixed to avoid clashing with Objective-C/Swift reserved identifiers.

```
person
bicycle
car
motorcycle
airplane
bus
train
truck
boat
traffic_light
fire_hydrant
stop_sign
parking_meter
bench
bird
cat
dog
horse
sheep
cow
elephant
bear
zebra
giraffe
backpack
umbrella
handbag
tie
suitcase
frisbee
skis
snowboard
sports_ball
kite
baseball_bat
baseball_glove
skateboard
surfboard
tennis_racket
bottle
wine_glass
cup
object_fork
knife
spoon
bowl
banana
apple
sandwich
orange
broccoli
carrot
hot_dog
pizza
donut
cake
chair
couch
potted_plant
bed
dining_table
toilet
tv
laptop
mouse
remote
keyboard
cell_phone
microwave
oven
toaster
sink
refrigerator
book
object_clock
vase
scissors
teddy_bear
hair_drier
toothbrush
```

### TFFaceDetectionFilter
Tradeoff between false positives and false negatives when filtering detection scores.

```
HIGH_RECALL
HIGH_PRECISION
BALANCED
UNFILTERED
```

### TFDatabaseManagementSystem
Backend used to persist faceprints. The iOS binding supports two backends.

```
SQLITE
NONE
```

### TFFacialRecognitionModel
Face recognition model used to generate faceprints. TFV7 is the most accurate; LITE_V3 is the most efficient.

```
LITE_V2
LITE_V3
TFV5_2
TFV6
TFV7
```

### TFFaceDetectionModel
Face detection model selection. `FACE_FAST` favours speed; `FACE_ACCURATE` favours recall.

```
FACE_FAST
FACE_ACCURATE
```

### TFObjectDetectionModel
Object detection model selection.

```
OBJECT_ACCURATE
OBJECT_FAST
```

### TFActiveSpoofStage
Identifies which of the two active-spoof captures is being processed.

```
NEAR
FAR
```

### TFMaskLabel
Result of mask detection.

```
MASK
NO_MASK
```

### TFGlassesLabel
Result of eyeglass detection.

```
GLASSES
NO_GLASSES
```

### TFSpoofLabel
Result of spoof (liveness) detection.

```
REAL
FAKE
```

### TFRotateFlags
Image rotation amounts.

```
ROTATE_0
ROTATE_90_CLOCKWISE
ROTATE_180
ROTATE_90_COUNTERCLOCKWISE
```

### TFFaceImageQuality
Qualitative assessment of a face image for recognition.

```
GOOD
UNDER_EXPOSED
OVER_EXPOSED
BLURRY
```

---

## Configuration classes

### TFConfigurationOptions
Configuration passed to `-[TFSDK initWithConfigurationOptions:]`.

**Properties:**
- `bool useCoreML` - Enable the CoreML inference provider on supported devices.
- `TFFacialRecognitionModel frModel` - Face recognition model (default `TFV5`).
- `TFFaceDetectionModel fdModel` - Face detection model (default `FACE_FAST`).
- `TFObjectDetectionModel objModel` - Object detection model (default `OBJECT_ACCURATE`).
- `int smallestFaceHeight` - Minimum detectable face height in pixels (default 40, min 16, `-1` enables dynamic range).
- `TFFaceDetectionFilter fdFilter` - Face detection score filter (default `BALANCED`).
- `TFDatabaseManagementSystem dbms` - Backend for storing faceprints (default `SQLITE`).
- `NSString *modelsPath` - Directory containing the model files.
- `bool frVectorCompression` - Compress feature vectors to speed up 1:1 and 1:N comparisons.
- `TFInitializeModule *initializeModule` - Pre-initialize specific modules at construction time.
- `TFEncryptDatabase *encryptDatabase` - AES encryption settings for stored faceprints.

### TFInitializeModule
Per-module flags that opt out of lazy initialization by loading the model in the SDK constructor.

**Properties:**
- `bool faceDetector` - Pre-load the face detector.
- `bool faceRecognizer` - Pre-load the face recognizer.
- `bool objectDetector` - Pre-load the object detector.
- `bool blinkDetector` - Pre-load the blink detector.
- `bool activeSpoof` - Pre-load the active spoof detector.
- `bool passiveSpoof` - Pre-load the passive spoof detector.
- `bool landmarkDetector` - Pre-load the 106-point landmark detector.
- `bool maskDetector` - Pre-load the mask detector.
- `bool faceOrientationDetector` - Pre-load the face orientation detector.
- `bool faceBlurDetector` - Pre-load the face blur detector.
- `bool eyeglassDetector` - Pre-load the eyeglass detector.
- `bool faceTemplateQualityEstimator` - Pre-load the face template quality estimator.

### TFUninitializeModule
Per-module flags passed to `-[TFSDK uninitializeModule:]` to release loaded models.

**Properties:**
- `bool maskDetector` - Unload the mask detector.
- `bool faceRecognizer` - Unload the face recognizer.
- `bool faceDetector` - Unload the face detector.
- `bool objectDetector` - Unload the object detector.
- `bool bodyposeEstimator` - Unload the body pose estimator.
- `bool blinkDetector` - Unload the blink detector.
- `bool activeSpoof` - Unload the active spoof detector.
- `bool passiveSpoof` - Unload the passive spoof detector.
- `bool landmarkDetector` - Unload the 106-point landmark detector.
- `bool faceOrientationDetector` - Unload the face orientation detector.
- `bool faceBlurDetector` - Unload the face blur detector.
- `bool eyeglassDetector` - Unload the eyeglass detector.
- `bool faceTemplateQualityEstimator` - Unload the face template quality estimator.

### TFEncryptDatabase
AES-encryption settings for collections persisted to disk.

**Properties:**
- `bool enableEncryption` - Enable encryption of stored templates and identity strings.
- `NSString *key` - Encryption key; hashed to a fixed length before use.

### TFModelOptions
Options recorded in a faceprint indicating how the feature vector was generated.

**Properties:**
- `bool frVectorCompression` - Whether vector compression was enabled at generation time.

### TFColorRGB
24-bit RGB colour. Channel values must be in `[0, 255]`.

**Properties:**
- `int r` - Red channel.
- `int g` - Green channel.
- `int b` - Blue channel.

---

## Core classes

### TFSDK
The main entry point. Owns native resources; call `dealloc` (or release in MRR) when finished. Pre-initialize heavy modules through `TFConfigurationOptions.initializeModule` to avoid first-call latency.

#### License and lifecycle

##### `- (id)init`
Initialize the SDK with default configuration.

##### `- (id)initWithConfigurationOptions:(TFConfigurationOptions *)options`
Initialize the SDK with the supplied configuration.

##### `- (void)dealloc`
Release all native resources owned by the SDK.

##### `- (void)uninitializeModule:(TFUninitializeModule *)uninitializeModule`
Unload model files for the modules whose flags are set.

##### `- (bool)setLicense:(NSString *)token`
Apply a license token. Must be called before running inference. Returns `true` if the token is valid.

##### `+ (bool)checkLicense:(NSString *)token`
Validate a license token without constructing an SDK instance.

##### `- (bool)isLicensed`
Whether the SDK currently holds a valid license.

##### `- (int)getExpireTime`
Remaining days the current license token is valid for.

##### `- (NSString *)getVersion`
SDK version string.

##### `+ (NSString *)getVersion`
SDK version string, class method form.

#### Image preprocessing

##### `- (TFImage *)preprocessImage:(UIImage *)image`
Wrap a `UIImage` for inference.

##### `- (TFImage *)preprocessImageWithData:(NSData *)imageData width:(int)width height:(int)height colorCode:(TFColorCode)colorCode`
Wrap a raw pixel buffer with the specified dimensions and pixel layout.

##### `- (TFImage *)preprocessImagePath:(NSString *)imagePath`
Load and wrap an image from a file path.

#### Face detection

##### `- (TFDetectLargestFaceResult *)detectLargestFace:(TFImage *)image`
Detect the single largest face in the image.

##### `- (TFDetectFacesResult *)detectFacesForImage:(TFImage *)image`
Detect every face in the image.

##### `- (TFLandmarksResult *)getFaceLandmarksForImage:(TFImage *)image faceBoxAndLandmarks:(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks`
Get the 106-point landmark set for a previously detected face.

##### `- (TFFacechip *)extractAlignedFaceFromImage:(TFImage *)image usingFaceBoxAndLandmarks:(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks`
Align and crop a face into a `TFFacechip` suitable for feature extraction and quality APIs.

##### `- (TFFacechip *)extractAlignedFaceFromImage:(TFImage *)image usingFaceBoxAndLandmarks:(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks marginLeft:(int)marginLeft marginTop:(int)marginTop marginRight:(int)marginRight marginBottom:(int)marginBottom scale:(float)scale`
Align and crop a face with explicit margins and scale.

##### `- (TFFaceImageRotationResult *)getFaceImageRotation:(TFImage *)image`
Detect the rotation required to make the largest face upright. Use for offline images, skip in live video.

#### Feature extraction and matching

##### `- (TFFaceprint *)getLargestFaceFeatureVectorFromImage:(TFImage *)image`
Detect the largest face and return its faceprint in one call.

##### `- (TFFaceprint *)getFaceFeatureVectorForImage:(TFImage *)image faceBoxAndLandmarks:(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks`
Generate a faceprint for an already-detected face.

##### `- (NSString *)faceprintToJson:(TFFaceprint *)faceprint`
Serialize a faceprint to JSON.

##### `- (TFFaceprint *)jsonToFaceprint:(NSString *)faceprint`
Deserialize a faceprint from a JSON string.

##### `- (TFSimilarity *)getSimilarityBetweenFaceprint:(TFFaceprint *)faceprint1 andFaceprint:(TFFaceprint *)faceprint2`
Compare two faceprints, returning a similarity measure and calibrated match probability.

#### Quality

##### `- (TFFaceImageQualityResult *)estimateFaceImageQuality:(TFFacechip *)alignedFaceImage`
Score the visual quality of an aligned face for recognition.

##### `- (TFFaceTemplateQualityResult *)estimateFaceTemplateQuality:(TFFacechip *)alignedFaceImage`
Estimate the biometric utility of a face independent of visual quality.

##### `- (TFFaceImageExposureResult *)checkFaceImageExposure:(TFImage *)image :(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks`
Check over- and under-exposure of the face region.

##### `- (TFFaceImageBlurResult *)detectFaceImageBlur:(TFFacechip *)facechip`
Detect blur in an aligned face image.

#### Attributes

##### `- (TFHeadOrientation *)estimateHeadOrientationForImage:(TFImage *)image faceBoxAndLandmarks:(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks`
Estimate yaw, pitch, and roll of the head, plus rotation and translation vectors.

##### `- (TFBlinkState *)detectBlinkInImage:(TFImage *)image withFaceBoxAndLandmarks:(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks`
Per-eye blink state, score, and eye aspect ratio.

##### `- (TFMaskResult *)detectMaskInImage:(TFImage *)image withFaceBoxAndLandmarks:(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks`
Classify the face as masked or unmasked.

##### `- (TFGlassesResult *)detectGlassesInImage:(TFImage *)image withFaceBoxAndLandmarks:(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks`
Classify whether the face is wearing glasses.

#### Spoof detection

##### `- (TFErrorCode)checkSpoofImageFaceSizeForImage:(TFImage *)image withFaceBoxAndLandmarks:(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks activeSpoofStage:(TFActiveSpoofStage)activeSpoofStage`
Validate face size for an active-spoof capture. Returns `NO_ERROR`, `FACE_TOO_CLOSE`, or `FACE_TOO_FAR`.

##### `- (TFActiveSpoofResult *)detectActiveSpoofWithNearFaceLandmarks:(NSArray *)nearFaceLandmarks farFaceLandmarks:(NSArray *)farFaceLandmarks`
Active spoof detection using paired near and far landmark sets.

##### `- (TFSpoofResult *)detectSpoofInImage:(TFImage *)image withFaceBoxAndLandmarks:(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks threshold:(float)threshold`
Passive spoof detection with a custom score threshold.

#### Object detection

##### `- (TFDetectObjectsResult *)detectObjects:(TFImage *)image`
Run the 80-class object detector.

#### Collections

##### `- (TFErrorCode)createDatabaseConnection:(NSString *)databaseConnectionString`
Open or create the backing database. For SQLite, this is a filename.

##### `- (TFErrorCode)createCollection:(NSString *)collectionName`
Create a new empty collection. Call `loadCollection:` before enrolling.

##### `- (TFErrorCode)createLoadCollection:(NSString *)collectionName`
Create-or-load: open the collection if it exists, otherwise create it.

##### `- (TFErrorCode)loadCollection:(NSString *)collectionName`
Load an existing collection into memory.

##### `- (TFErrorCode)deleteCollection:(NSString *)collectionName`
Drop a collection from the database.

##### `- (TFCollectionNamesResult *)getCollectionNames`
List every collection in the connected database.

##### `- (TFCollectionMetadata *)getCollectionMetadata:(NSString *)collectionName`
Identity count, faceprint count, model used, and encryption status for a collection.

##### `- (TFCollectionIdentitiesResult *)getCollectionIdentities:(NSString *)collectionName`
List identity / UUID pairs enrolled in a collection.

#### Enrollment and identification

##### `- (TFEnrollFaceprintResult *)enrollFaceprint:(TFFaceprint *)faceprint withIdentity:(NSString *)identity collectionName:(NSString *)collectionName`
Add a faceprint to a collection under the given identity. Returns the assigned UUID.

##### `- (TFRemoveByIdentityResult *)removeByUUID:(NSString *)identity collectionName:(NSString *)collectionName`
Remove a single enrollment by its UUID.

##### `- (TFRemoveByIdentityResult *)removeByIdentity:(NSString *)identity collectionName:(NSString *)collectionName`
Remove every faceprint enrolled under an identity.

##### `- (TFIdentifyTopCandidateResult *)identifyTopCandidateWithFaceprint:(TFFaceprint *)faceprint collectionName:(NSString *)collectionName`
Best match for a probe faceprint within a collection.

##### `- (TFIdentifyTopCandidatesResult *)identifyTopCandidatesWithFaceprint:(TFFaceprint *)faceprint collectionName:(NSString *)collectionName`
Top candidates for a probe faceprint, using default count and threshold.

##### `- (TFIdentifyTopCandidatesResult *)identifyTopCandidatesWithFaceprint:(TFFaceprint *)faceprint numberOfCandidates:(int)numCandidates threshold:(float)threshold collectionName:(NSString *)collectionName`
Top-N candidates above the threshold, ordered by descending similarity.

---

### TFImage
A preprocessed image owned by native code. Call `destroy` from real-time pipelines (camera frames) to release memory eagerly instead of waiting for ARC.

**Methods:**
- `- (TFErrorCode)getErrorCode` - Status of the preprocessing that produced this image.
- `- (void)destroy` - Free the underlying native buffer immediately.
- `- (void)dealloc` - Standard ARC destructor; releases the buffer if not already destroyed.
- `- (void)rotate:(TFRotateFlags)rotateFlags` - Rotate the image in place.
- `- (void)resize:(int)width :(int)height` - Resize the image in place.
- `- (void)saveImage:(NSString *)filepath` - Save the image to disk.
- `- (int)getChannels` - Number of colour channels.
- `- (int)getHeight` - Height in pixels.
- `- (int)getWidth` - Width in pixels.
- `- (NSData *)getData` - Raw pixel data.
- `- (UIImage *)getUIImage` - Convert to `UIImage`.

### TFFacechip
An aligned, cropped face image produced by `extractAlignedFaceFromImage:...`. Input to feature extraction, image quality, template quality, and blur APIs.

**Methods:**
- `- (void)setOwnership:(struct TF_Facechip)tfFacechip` - Internal: take ownership of a native facechip.
- `- (void)destroy` - Free the underlying native buffer immediately.
- `- (void)dealloc` - Standard ARC destructor; releases the buffer if not already destroyed.
- `- (void)loadImage:(NSString *)filepath` - Load a facechip image from disk.
- `- (void)saveImage:(NSString *)filepath` - Save the facechip to disk.
- `- (int)getChannels` - Number of colour channels.
- `- (int)getHeight` - Height in pixels.
- `- (int)getWidth` - Width in pixels.
- `- (NSData *)getData` - Raw pixel data.
- `- (UIImage *)getUIImage` - Convert to `UIImage`.

### TFFaceprint
A face feature vector and the metadata identifying how it was generated.

**Properties:**
- `bool foundFace` - Whether a face was found during generation.
- `TFErrorCode errorCode` - Status of the generation call.
- `NSArray *featureVector` - Array of `NSNumber` floats describing the face.
- `NSString *sdkVersion` - SDK version that produced the faceprint.
- `NSString *modelName` - Name of the face recognition model used.
- `TFModelOptions *modelOptions` - Options used at generation time.

---

## Detection result classes

### TFPoint
2D point in image coordinates.

**Properties:**
- `float x` - Pixel column.
- `float y` - Pixel row.

### TFFaceBoxAndLandmarks
A detected face: bounding box, five landmarks, and detection score.

**Properties:**
- `TFPoint *topLeft` - Top-left corner of the face bounding box.
- `TFPoint *bottomRight` - Bottom-right corner of the face bounding box.
- `NSArray *landmarks` - Five `TFPoint` landmarks: left eye, right eye, nose, left mouth corner, right mouth corner.
- `float score` - Detection confidence; values below 0.85 are likely false positives.
- `float height` - Face box height in pixels.
- `float area` - Face box area in pixels squared.

### TFLandmark
A single body-pose joint.

**Properties:**
- `TFPoint *point` - Coordinate of the joint.
- `float score` - Detection score for the joint.
- `NSString *label` - Joint label.

### TFBoundingBox
A detected object's bounding box and class.

**Properties:**
- `NSString *labelString` - Object class as a human-readable string.
- `TFObjectLabel label` - Object class enum value.
- `float probability` - Detection confidence.
- `TFPoint *topLeft` - Top-left corner of the bounding box.
- `float width` - Width of the bounding box in pixels.
- `float height` - Height of the bounding box in pixels.

### TFCandidate
A candidate match returned by identification.

**Properties:**
- `float similarityMeasure` - Raw similarity between the probe and the candidate.
- `float matchProbability` - Calibrated match probability.
- `NSString *identity` - Enrolled identity string.
- `NSString *UUID` - UUID of the matching faceprint.

### TFBlinkState
Per-eye blink results.

**Properties:**
- `TFErrorCode errorCode` - Status of the blink detection.
- `bool isLeftEyeClosed` - Predicted left-eye closed state.
- `bool isRightEyeClosed` - Predicted right-eye closed state.
- `float leftEyeScore` - Left-eye open/closed score (0 closed, 1 open).
- `float rightEyeScore` - Right-eye open/closed score (0 closed, 1 open).
- `float leftEyeAspectRatio` - Left-eye height divided by width.
- `float rightEyeAspectRatio` - Right-eye height divided by width.

### TFHeadOrientation
Estimated head pose.

**Properties:**
- `float yaw` - Rotation around the vertical axis, in radians.
- `float pitch` - Rotation around the transverse axis, in radians.
- `float roll` - Rotation around the longitudinal axis, in radians.
- `TFErrorCode errorCode` - Status of the orientation estimate.
- `NSArray<NSNumber *> *rotationVec` - Rotation vector.
- `NSArray<NSNumber *> *translationVec` - Translation vector.

### TFSpoofPrediction
Result of a generic spoof prediction.

**Properties:**
- `TFErrorCode errorCode` - Status of the spoof prediction.
- `float score` - Spoof confidence score.
- `TFSpoofLabel label` - `REAL` or `FAKE`.

### TFSpoofResult
Result of `detectSpoofInImage:...`, bundling head orientation, blink state, and mask label.

**Properties:**
- `TFHeadOrientation *headOrientation` - Head orientation at capture time.
- `TFBlinkState *blinkState` - Blink state at capture time.
- `TFMaskLabel maskLabel` - Whether a mask is present.
- `TFSpoofLabel label` - `REAL` or `FAKE`.
- `float score` - Spoof confidence score.
- `TFErrorCode errorCode` - Status of the spoof detection.

### TFActiveSpoofResult
Result of paired near/far active spoof detection.

**Properties:**
- `TFSpoofLabel label` - `REAL` or `FAKE`.
- `float score` - Spoof confidence score.
- `TFErrorCode errorCode` - Status of the active spoof detection.

### TFMaskResult
Result of mask detection.

**Properties:**
- `TFMaskLabel label` - `MASK` or `NO_MASK`.
- `float score` - Mask confidence score.
- `TFErrorCode errorCode` - Status of the mask detection.

### TFGlassesResult
Result of eyeglass detection.

**Properties:**
- `TFGlassesLabel label` - `GLASSES` or `NO_GLASSES`.
- `TFErrorCode errorCode` - Status of the glasses detection.

### TFFaceImageRotationResult
Detected rotation required to bring the largest face upright.

**Properties:**
- `TFRotateFlags rotation` - Rotation needed.
- `TFErrorCode errorCode` - Status of the rotation check.

### TFFaceImageBlurResult
Result of blur detection on an aligned face.

**Properties:**
- `TFFaceImageQuality faceImageQuality` - Qualitative result; `GOOD` or `BLURRY`.
- `float score` - Blur score.
- `TFErrorCode errorCode` - Status of the blur detection.

### TFFaceImageExposureResult
Result of exposure analysis over the face region.

**Properties:**
- `TFFaceImageQuality faceImageQuality` - Qualitative result; `GOOD`, `UNDER_EXPOSED`, or `OVER_EXPOSED`.
- `float percentImageBright` - Percentage of the full image classified as bright.
- `float percentImageDark` - Percentage of the full image classified as dark.
- `float percentFaceBright` - Percentage of the face region classified as bright.
- `TFErrorCode errorCode` - Status of the exposure check.

### TFFaceImageQualityResult
Visual quality score for an aligned face.

**Properties:**
- `float score` - Visual quality score; ~0.999 is a typical enrollment threshold.
- `TFErrorCode errorCode` - Status of the quality check.

### TFFaceTemplateQualityResult
Biometric utility of an aligned face for recognition, independent of visual quality.

**Properties:**
- `bool isTemplateQualityGood` - Whether the template quality passes the default threshold.
- `float score` - Template quality score.
- `TFErrorCode errorCode` - Status of the template quality check.

### TFSimilarity
Result of comparing two faceprints.

**Properties:**
- `TFErrorCode errorCode` - Status of the comparison.
- `float matchProbability` - Calibrated match probability.
- `float similarityMeasure` - Raw similarity measure.

---

## Collection result classes

### TFCollectionMetadata
Metadata about a single collection. Also returned directly by `getCollectionMetadata:`.

**Properties:**
- `TFErrorCode errorCode` - Status of the metadata fetch.
- `NSString *collectionName` - Collection name.
- `unsigned long long numIdentities` - Number of unique identities enrolled.
- `unsigned long long numFaceprints` - Total faceprints enrolled.
- `NSString *modelName` - Face recognition model the collection was generated with.
- `int featureVectorSizeBytes` - Size of each feature vector in bytes.
- `TFModelOptions *modelOptions` - Options used when the faceprints were generated.
- `BOOL encrypted` - Whether the collection is AES-encrypted on disk.

### TFCollectionIdentities
A single identity / UUID pair within a collection.

**Properties:**
- `NSString *identity` - Identity string assigned at enrollment.
- `NSString *UUID` - UUID of the enrolled faceprint.

### TFCollectionNamesResult
Result of `getCollectionNames`.

**Properties:**
- `NSArray *collectionNames` - Array of `NSString` collection names.
- `TFErrorCode errorCode` - Status of the call.

### TFCollectionIdentitiesResult
Result of `getCollectionIdentities:`.

**Properties:**
- `NSArray *collectionIdentities` - Array of `TFCollectionIdentities` entries.
- `TFErrorCode errorCode` - Status of the call.

---

## Operation result classes

### TFDetectObjectsResult
Result of `detectObjects:`.

**Properties:**
- `NSArray *boundingBoxes` - Array of `TFBoundingBox` objects for each detected object.
- `TFErrorCode errorCode` - Status of the detection.

### TFDetectLargestFaceResult
Result of `detectLargestFace:`.

**Properties:**
- `TFFaceBoxAndLandmarks *faceBoxAndLandmarks` - The detected face, when `found` is true.
- `bool found` - Whether a face was found.
- `TFErrorCode errorCode` - Status of the detection.

### TFDetectFacesResult
Result of `detectFacesForImage:`.

**Properties:**
- `NSArray *faceBoxAndLandmarks` - Array of `TFFaceBoxAndLandmarks` for each detected face.
- `TFErrorCode errorCode` - Status of the detection.

### TFFaceLandmarksResult
Result type for face-landmark queries.

**Properties:**
- `NSArray *faceLandmark` - Array of `TFPoint` landmarks.
- `TFErrorCode errorCode` - Status of the call.

### TFLandmarksResult
Result of `getFaceLandmarksForImage:`. The 106 face landmarks are returned as `TFPoint` objects.

**Properties:**
- `NSArray *landmark` - Array of `TFPoint` landmarks.
- `TFErrorCode errorCode` - Status of the call.

### TFEnrollFaceprintResult
Result of `enrollFaceprint:withIdentity:collectionName:`.

**Properties:**
- `NSString *UUID` - UUID assigned to the new enrollment.
- `TFErrorCode errorCode` - Status of the enrollment.

### TFRemoveByIdentityResult
Result of `removeByIdentity:collectionName:` or `removeByUUID:collectionName:`.

**Properties:**
- `int numFaceprintsRemoved` - Number of faceprints removed.
- `TFErrorCode errorCode` - Status of the removal.

### TFIdentifyTopCandidateResult
Result of `identifyTopCandidateWithFaceprint:collectionName:`.

**Properties:**
- `TFCandidate *candidate` - Best candidate, when `found` is true.
- `bool found` - Whether a candidate above the threshold was found.
- `TFErrorCode errorCode` - Status of the identification.

### TFIdentifyTopCandidatesResult
Result of the `identifyTopCandidatesWithFaceprint:...` family.

**Properties:**
- `NSArray *candidates` - Array of `TFCandidate` objects ordered by descending similarity.
- `bool found` - Whether any candidates were found.
- `TFErrorCode errorCode` - Status of the identification.

### TFFacechipResult
C struct returned by some internal helpers; bundles a facechip with an error code.

**Properties:**
- `TFFacechip *facechip` - The facechip.
- `TFErrorCode errorCode` - Status of the call.
