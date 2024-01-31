# Trueface SDK Objective-C

This enumeration is a binding for a C++ SDK. For detailed explanations of each error code and the corresponding C++ SDK functionality, please refer to the [official C++ SDK documentation](https://reference.trueface.ai/cpp/dev/latest/index.html).

## Enums

### TFErrorCode
- This enumeration is used to handle errors and exceptions in a systematic way, allowing developers to easily identify and resolve issues during the integration and usage of the SDK.
```C
    NO_ERROR,
    INVALID_LICENSE,
    FILE_READ_FAIL,
    UNSUPPORTED_IMAGE_FORMAT,
    UNSUPPORTED_MODEL,
    NO_FACE_IN_FRAME,
    FAILED,
    COLLECTION_CREATION_ERROR,
    DATABASE_CONNECTION_ERROR,
    ENROLLMENT_ERROR,
    MAX_COLLECTION_SIZE_EXCEEDED,
    NO_RECORD_FOUND,
    NO_COLLECTION_FOUND,
    COLLECTION_DELETION_ERROR,
    EXTREME_FACE_ANGLE,
    FACE_TOO_CLOSE,
    FACE_TOO_FAR,
    FACE_TOO_SMALL,
    FACE_NOT_CENTERED,
    EYES_CLOSED,
    MASK_DETECTED,
    TOO_DARK,
    TOO_BRIGHT,
    DATABASE_NOT_CONNECTED,
    COLLECTION_NOT_LOADED,
    FEATURE_NOT_SUPPORTED,
    COLLECTION_IS_EMPTY,
    INPUT_IS_EMPTY,
    STRING_CANNOT_CONTAIN_HYPHEN
```

### TFColorCode
- This enumeration specifies the color formats that can be used with the SDK. It helps in defining the format of the images that are processed by the SDK.
```C
    bgr,
    rgb,
    bgra,
    rgba,
    gray,
    yuv_i420,
    yuv_nv12
```

Each color format has its specific use case and is important for ensuring compatibility with different types of image processing and computer vision tasks in the SDK.

### TFObjectLabel
- Enumerates the various object classes recognized by the SDK. This enumeration is essential for object detection and classification tasks. Notably, some keys are prefixed with object_ to avoid conflicts with Objective-C and Swift keywords.
```C
    person,
    bicycle,
    car,
    motorcycle,
    airplane,
    bus,
    train,
    truck,
    boat,
    traffic_light,
    fire_hydrant,
    stop_sign,
    parking_meter,
    bench,
    bird,
    cat,
    dog,
    horse,
    sheep,
    cow,
    elephant,
    bear,
    zebra,
    giraffe,
    backpack,
    umbrella,
    handbag,
    tie,
    suitcase,
    frisbee,
    skis,
    snowboard,
    sports_ball,
    kite,
    baseball_bat,
    baseball_glove,
    skateboard,
    surfboard,
    tennis_racket,
    bottle,
    wine_glass,
    cup,
    object_fork,  // Prefixed with 'object_' to avoid language conflicts
    knife,
    spoon,
    bowl,
    banana,
    apple,
    sandwich,
    orange,
    broccoli,
    carrot,
    hot_dog,
    pizza,
    donut,
    cake,
    chair,
    couch,
    potted_plant,
    bed,
    dining_table,
    toilet,
    tv,
    laptop,
    mouse,
    remote,
    keyboard,
    cell_phone,
    microwave,
    oven,
    toaster,
    sink,
    refrigerator,
    book,
    object_clock, // Prefixed with 'object_' to avoid language conflicts
    vase,
    scissors,
    teddy_bear,
    hair_drier,
    toothbrush
```

### TFFaceDetectionFilter
- This enumeration allows you to filter detected faces based on score thresholds, which are derived from the ROC (Receiver Operating Characteristic) curve. It helps in fine-tuning the balance between false positives and false negatives in face detection.
```C
    HIGH_RECALL,
    HIGH_PRECISION,
    BALANCED,
    UNFILTERED
```

Each option serves a specific purpose:

HIGH_RECALL: Best for scenarios where missing a face is more critical than mistakenly identifying a non-face as a face.
HIGH_PRECISION: Ideal when it is crucial to avoid false positives, even if it means some faces might not be detected.
BALANCED: Offers a middle ground, suitable for most applications where a balance is needed.
UNFILTERED: Useful for testing or in scenarios where capturing every potential face, regardless of false positives, is necessary.

### TFDatabaseManagementSystem
- Defines the options for the database management system used to store Faceprints. This enumeration helps in selecting the appropriate storage backend based on the application's requirements and constraints.
```C
    SQLITE,
    NONE
```
Each option caters to different use cases:

SQLITE: Ideal for more permanent and stable storage where data persistence across sessions is crucial. Particularly useful in embedded systems or situations with limited database connections.
NONE: Suitable for temporary or transient storage needs where persistence is not required, such as in testing environments or applications where data longevity is not a concern. This option ensures faster access but lacks data retention capabilities.

### TFFacialRecognitionModel
- Enumerates the facial recognition models provided by the SDK. Each model varies in terms of accuracy, inference speed, and intended use case. For a detailed comparison of model performances, refer to the SDK's [ROC](https://docs.trueface.ai/roc-curves) curves and the [FAQ page](https://reference.trueface.ai/cpp/dev/latest/py/faq.html#what-are-the-differences-between-the-face-recognition-models).
```C
    LITE,
    LITE_V2,
    TFV5_2,
    TFV6,
    TFV7
```
Each model serves specific requirements:

LITE & LITE_V2: Best for lightweight applications where speed is prioritized over accuracy.
TFV5_2: A balanced choice for unmasked face recognition, offering good speed and accuracy.
TFV6: Specialized for scenarios involving masked faces, ensuring high accuracy in such conditions.
TFV7: Offers the highest accuracy, ideal for applications where precision is paramount and computational resources are sufficient.

### TFObjectDetectionModel
- This enumeration specifies the models available for object detection in the SDK, offering a choice between accuracy and speed to accommodate different application requirements.
```C
    OBJECT_ACCURATE,
    OBJECT_FAST
```
Model Selection:

OBJECT_ACCURATE: Best for situations where detailed and precise object detection is essential, like in high-quality image analysis or environments where the accuracy of detection takes precedence over processing speed.
OBJECT_FAST: Recommended for use cases demanding quick feedback, such as in real-time surveillance systems, live video streaming, or applications where swift response times are crucial.

### TFFaceDetectionModel
- This enumeration defines the available models for face detection within the SDK. It allows selection between speed and accuracy based on the specific requirements of the use case.
```C
    FACE_FAST,
    FACE_ACCURATE
```

Each model caters to different needs:

* FACE_FAST: Best used in scenarios where responsiveness and real-time processing are key, such as in live video analysis or applications requiring rapid feedback.
* FACE_ACCURATE: Recommended for use cases where the accuracy of face detection is critical, like high-quality image analysis or when processing static images where time is not a constraint.

### TFActiveSpoofStage
- Enumerates the stages in active spoof detection, which involves analyzing two types of images: near and far.

* NEAR: Represents the near image stage in the active spoof detection process.
* FAR: Indicates the far image stage.
This enum is crucial for active spoof detection systems that require differentiating between these two stages for accurate analysis.

### TFMaskLabel
- Enumerates the results from mask detection on faces.

* MASK: Indicates that a mask is detected on the face.
* NO_MASK: Signifies that no mask is present on the face.
This enum is essential in applications where mask detection is necessary, especially relevant in health and safety protocols.

### TFGlassesLabel
- Enumerates the results from detecting eyeglasses on faces.

* GLASSES: Implies that glasses are detected on the face.
* NO_GLASSES: Means that no glasses are present on the face.
This is particularly useful in applications where the presence of glasses might affect facial recognition or other analyses.

### TFSpoofLabel
- Enumerates the results from spoof detection to determine the authenticity of a face image.

* REAL: The face image is identified as real.
* FAKE: The image is suspected to be an attempted spoof.
This enum is crucial for security and authentication systems to differentiate between genuine and spoofed face images.

### TFRotateFlags
- Enumerates options for rotating images, which is essential in ensuring images are oriented correctly for processing.

* ROTATE_0: Indicates no rotation is to be applied to the image.
* ROTATE_90_CLOCKWISE: Specifies a rotation of 90 degrees in the clockwise direction.
* ROTATE_180: Implies a rotation of 180 degrees, essentially flipping the image upside down.
* ROTATE_90_COUNTERCLOCKWISE: Denotes a rotation of 270 degrees clockwise, or equivalently 90 degrees counterclockwise.
This enum is crucial for image preprocessing, ensuring that the images are aligned correctly before further analysis or processing.

### TFFaceImageQuality
- Enumerates different quality levels of a face image, particularly in the context of its suitability for face recognition.

* GOOD: The image quality is deemed good for face recognition, with no significant issues affecting the recognition process.
* UNDER_EXPOSED: Indicates that the image is underexposed, which might hinder effective face recognition.
* OVER_EXPOSED: Suggests that the image is overexposed, potentially impacting the recognition accuracy.
* BLURRY: The image is blurry, which could negatively affect the clarity and recognition of facial features.
This enum is essential for assessing the suitability of face images in recognition systems, allowing for the filtering out of poor-quality images that might lead to inaccurate results.

## Classes

### TFEncryptDatabase
- is a class in the SDK for managing AES encryption of biometric templates and identity strings in the database.

### Properties:
* enableEncryption (bool): Determines whether database encryption is enabled or not. Enabling this adds overhead to Faceprint enrollment and loading a collection from a database into memory, but does not impact the 1 to N identification time. By default, encryption is disabled (false).

* key (NSString): The encryption key used for AES encryption. Before being used, the key is hashed to a fixed length. The default value for the key is an empty string (@"").

### Notes:
* When encryption is enabled, particularly with a PostgreSQL backend, it is highly recommended to use SSL for the PostgreSQL connection to ensure enhanced security.
* This class plays a critical role in protecting sensitive biometric data, making it essential for applications that handle personal identification information.

### TFInitializeModule
- is a class in the SDK designed for managing the initialization of various modules. It allows for either lazy initialization (default) or pre-initialization of modules.

### Properties:
* faceDetector (bool): Controls the initialization of the face detection module. Default is false, meaning lazy initialization.
* faceRecognizer (bool): Determines the initialization state of the face recognition module. Default is false.
* objectDetector (bool): Manages the initialization of the object detection module. Default is false.
* bodyposeEstimator (bool): Sets the initialization for the body pose estimation module. Default is false.
* blinkDetector (bool): Controls the initialization of the blink detection module. Default is false.
* activeSpoof (bool): Determines whether the active spoofing detection module is pre-initialized. Default is false.
* passiveSpoof (bool): Manages the initialization state of the passive spoofing detection module. Default is false.
* landmarkDetector (bool): Controls the initialization of the facial landmark detection module. Default is false.
* maskDetector (bool): Determines the initialization state of the mask detection module. Default is false.
* faceOrientationDetector (bool): Manages the initialization of the face orientation detection module. Default is false.
* faceBlurDetector (bool): Controls the initialization of the face blur detection module. Default is false.
* eyeglassDetector (bool): Determines whether the eyeglass detection module is pre-initialized. Default is false.

### Notes:
* By default, the SDK uses lazy initialization, meaning modules are only initialized when they are first used. This approach conserves memory by not loading models of unused modules.
* Pre-initialization loads the model files into memory during the SDK constructor, which can be beneficial if you know certain modules will be used, as it speeds up the first inference by avoiding on-demand loading.

### TFUninitializeModule
- is a class in the SDK designed for unloading models from memory when they are no longer needed. This helps in efficient memory management, especially in scenarios where certain modules are used sporadically.

### Properties:
* maskDetector (bool): Controls the unloading of the mask detection module from memory. Default is false.
* faceRecognizer (bool): Determines the unloading state of the face recognition module. Default is false.
* faceDetector (bool): Manages the unloading of the face detection module from memory. Default is false.
* objectDetector (bool): Sets the unloading for the object detection module. Default is false.
* bodyposeEstimator (bool): Controls the unloading of the body pose estimation module. Default is false.
* blinkDetector (bool): Manages the unloading state of the blink detection module. Default is false.
* activeSpoof (bool): Determines whether the active spoofing detection module is unloaded from memory. Default is false.
* passiveSpoof (bool): Controls the unloading of the passive spoofing detection module. Default is false.
* landmarkDetector (bool): Manages the unloading of the facial landmark detection module from memory. Default is false.
* faceOrientationDetector (bool): Determines the unloading state of the face orientation detection module. Default is false.
* faceBlurDetector (bool): Controls the unloading of the face blur detection module. Default is false.
* eyeglassDetector (bool): Manages the unloading state of the eyeglass detection module. Default is false.

### Notes:
* Unloading modules that are not in use can significantly free up memory resources, making the SDK more efficient, especially in resource-constrained environments.
* The properties in this class should be used judiciously to balance between memory usage and the readiness of the modules for quick deployment.

### TFConfigurationOptions
- is a class in the SDK that encapsulates various configuration settings for the SDK's functionality. It allows for customization of the SDK's behavior and performance to suit different platform and application requirements.

### Properties:
* useCoreML (bool): Option to use CoreML (iOS only). Defaults to false.
* mobilePowerSave (int): [Android Only] Controls power-saving mode. 0 for all cores enabled (default), 1 for little clusters only, and 2 for big clusters only.
* mobileThreads (int): [Mobile Only] Sets the number of threads for inference. On non-mobile platforms, OMP_NUM_THREADS environment variable is used instead.
* mobileAvailableMemory (long): [iOS Only] The amount of memory available for the iOS application. Set using os_proc_available_memory().
* frModel (TFFacialRecognitionModel): The model used for facial recognition. Default is TFV5.
* fdModel (TFFaceDetectionModel): The model used for face detection. Default is FACE_FAST.
* objModel (TFObjectDetectionModel): The model used for object detection. Default is OBJECT_ACCURATE.
* smallestFaceHeight (int): The minimum face height detectable by the face detector. Default is 40 pixels, with a minimum value of 16 pixels. Setting -1 adjusts the detection scale range dynamically.
* fdFilter (TFFaceDetectionFilter): The face detection filter used. Default is BALANCED.
* dbms (TFDatabaseManagementSystem): Database management system for storing Faceprints. Default is SQLITE.
* modelsPath (NSString): The directory path containing the model files.
* frVectorCompression (bool): Enables compression of the feature vector for faster 1 to 1 comparisons and 1 to N searches. Defaults to false.
* initializeModule (TFInitializeModule*): Allows pre-initialization of specified modules in the SDK constructor. Default uses lazy initialization.
* encryptDatabase (TFEncryptDatabase*): Option to encrypt biometric templates and identity strings in the database using AES encryption. Default is disabled.

### Notes:
* This class provides a comprehensive set of options to tailor the SDK's performance and functionality according to specific platform capabilities and application needs.
* Default values are set to ensure the SDK works out-of-the-box for most scenarios, with the flexibility to adjust settings for specialized use cases.

### TFPoint
- is a class in the SDK representing a point in a two-dimensional space, typically used for coordinates in image processing.

### Properties:
* x (float): Represents the coordinate along the horizontal axis, or pixel column.
* y (float): Represents the coordinate along the vertical axis, or pixel row.

### Notes:
* This class is fundamental for representing spatial locations in image and video analysis, such as identifying specific points on a detected object or facial feature.
* The use of floating-point values for x and y allows for precision, which is especially important in scenarios where exact pixel locations are crucial.

### TFModelOptions
- is a class in the SDK that provides configuration options specifically for generating the feature vector in facial recognition processes.

### Properties:
* frVectorCompression (bool): Indicates whether the feature vector compression, as specified by Trueface::ConfigurationOptions.frVectorCompression, was enabled during the generation of the template.

### Notes:
* This setting is particularly important for managing the balance between computational efficiency and the precision of the feature vector used in facial recognition.
* Enabling frVectorCompression can lead to more efficient storage and faster processing, which is beneficial in scenarios with resource constraints or when handling large volumes of data.

### TFFaceprint
- is a class in the SDK that encapsulates the face feature vector along with its associated metadata. This class is vital for representing and storing the unique characteristics of a face as recognized by the SDK.

### Properties:
* featureVector (NSArray): An array of floats describing the face. This vector is the core representation of the facial features as recognized by the SDK.
* sdkVersion (NSString): The version of the SDK used to generate the feature vector. This information is crucial for ensuring compatibility and understanding the context in which the faceprint was created.
* modelName (NSString): The name of the model used to generate the feature vector. Different models may produce different types of feature vectors, so this information is important for accurate recognition and comparison.
* modelOptions (TFModelOptions*): A reference to TFModelOptions which contains additional configuration options used during the generation of the feature vector.

### Notes:
* TFFaceprint plays a central role in facial recognition tasks, enabling the SDK to capture, compare, and analyze facial features effectively.
* The inclusion of metadata like sdkVersion and modelName alongside the featureVector ensures that the faceprint data is self-contained and can be used reliably across different versions or configurations of the SDK.
* modelOptions provide insights into the specific settings used during the generation of the feature vector, which can be critical for certain advanced use cases or troubleshooting.

### TFBoundingBox
- is a class in the SDK that represents a bounding box around a detected object or feature in an image. This class is crucial for object detection and localization tasks.

### Properties:
* labelString (NSString*): The label of the detected object as a string. This provides a human-readable name for the object class.
* label (TFObjectLabel): The enumerated label of the detected object. It corresponds to specific object classes defined in the TFObjectLabel enumeration.
* probability (float): The confidence probability of the detection. This value indicates how confident the model is that the bounding box accurately represents the detected object.
* topLeft (TFPoint*): A TFPoint object representing the top-left corner of the bounding box. It specifies the starting point of the bounding box in the image.
* width (float): The width of the bounding box, indicating how wide the detected object is within the image.
* height (float): The height of the bounding box, indicating the vertical size of the detected object.

### Notes:
* TFBoundingBox is integral for understanding where in an image a particular object is located and how large it appears in that image.
* The combination of topLeft, width, and height provides a complete description of the bounding box's position and size, which is essential for applications like object tracking, counting, or further analysis.
*  labelString and label offer flexibility in how the detected objects are identified and processed, catering to both human-readable and programmatically efficient formats.

### TFLandmark
- is a class in the SDK used to represent a landmark, typically a body joint, in body pose estimation tasks.

### Properties:
* point (TFPoint*): A TFPoint object that specifies the coordinate of the joint in the image. This coordinate pinpoints the exact location of the landmark.
* score (float): A value representing the confidence score for the detected joint. This score indicates the likelihood that the landmark is correctly identified at the specified point.
* label (NSString*): A label for the joint, providing a human-readable identifier for the type of landmark (e.g., elbow, knee, etc.).

### Notes:
* TFLandmark is crucial for applications involving body pose estimation, where identifying and tracking various body joints is essential.
* The point property ensures precise localization of each joint, which is fundamental in accurately interpreting human body language and movements.
* The score adds a layer of confidence assessment, allowing for more reliable and accurate pose estimation, particularly in complex or dynamic environments.

### TFFaceBoxAndLandmarks
- is a class in the SDK designed for representing detected faces along with their bounding boxes and facial landmarks.

### Properties:
* topLeft (TFPoint*): A TFPoint object representing the top-left corner of the face bounding box. This point marks the starting coordinate of the bounding box on the image.
* bottomRight (TFPoint*): A TFPoint object indicating the bottom-right corner of the face bounding box. This, in combination with topLeft, defines the size and position of the bounding box.
* landmarks (NSArray*): An array of TFPoint objects, each representing a specific facial landmark (like the left eye, right eye, nose, left mouth corner, and right mouth corner). These landmarks provide detailed positional information about key facial features.
* score (float): A confidence score indicating the likelihood of the detection being a true positive. A value lower than 0.85 typically suggests a higher chance of the detection being a false positive.

### Notes:
* TFFaceBoxAndLandmarks is essential in facial recognition and analysis tasks, where precise detection and identification of faces and their features are required.
* The combination of a bounding box (topLeft and bottomRight) and facial landmarks (landmarks) allows for detailed and accurate analysis of faces in images, useful in applications like emotion recognition, identity verification, and augmented reality.
* The score property adds a layer of confidence assessment, enabling applications to filter out less reliable detections and focus on high-confidence results.

### TFCandidate
- is a class in the SDK that represents a candidate in face recognition tasks, primarily used in scenarios involving matching or comparing faces.

### Properties:
* similarityMeasure (float): A value representing the computed similarity between two face feature vectors. This measure indicates how closely the candidate's features match those of the target face.
* matchProbability (float): The probability that the two face feature vectors are a match. This provides an assessment of the likelihood of the candidate being the correct match.
* identity (NSString*): A string representing the identity of the match. This could be a name, an identifier, or any label assigned to the recognized face.
* UUID (NSString*): The unique identifier for the match. This is typically a UUID (Universally Unique Identifier) that uniquely distinguishes each candidate.

### Notes:
* TFCandidate plays a vital role in applications where face recognition is used for identification, verification, or comparison purposes.
* The combination of similarityMeasure and matchProbability provides a comprehensive understanding of how close the candidate is to the target face, both in terms of feature similarity and the overall probability of a match.
* identity and UUID offer ways to link the recognized face to specific individuals or entries in a database, facilitating tasks like user authentication, personalized experiences, or tracking in security systems.

### TFSpoofPrediction
- is a class in the SDK used for representing the outcome of a spoof detection analysis. This class is essential in scenarios where determining the authenticity of a presented face (real vs. spoof) is crucial.

### Properties:
* errorCode (TFErrorCode): An enumerated value representing any error that might have occurred during the spoof detection process. This helps in identifying issues or failures in the detection.
* score (float): A confidence score indicating the likelihood of the detection being accurate. This score assesses the confidence level of the spoof prediction.
* label (TFSpoofLabel): An enumeration that classifies the result of the spoof detection into categories, such as real, fake, or uncertain.

### Notes:
* TFSpoofPrediction is particularly important in security and authentication systems where distinguishing between genuine and fake (spoofed) faces is vital to prevent unauthorized access or fraud.
* The errorCode property provides a way to handle and respond to potential errors or anomalies in the spoof detection process, ensuring robust and reliable operation.
* The score and label together offer a comprehensive assessment of the spoof detection, allowing systems to make informed decisions based on the level of confidence and the type of prediction (real or spoof).

### TFCollectionMetadata
- is a class in the SDK that provides metadata information about a specific faceprint collection. This class is key for managing and understanding the characteristics of faceprint collections.

### Properties:
* collectionName (NSString*): The name of the collection. It serves as an identifier for different collections.
numIdentities (unsigned long long): The number of unique identities in the collection. This indicates the diversity of the dataset.
* numFaceprints (unsigned long long): The total number of faceprints enrolled in the collection. This reflects the size of the collection.
* modelName (NSString*): The name of the facial recognition model used to generate the faceprints in the collection. It helps in understanding the compatibility and performance aspects.
* featureVectorSizeBytes (int): The size of the faceprint feature vector in bytes. This gives an idea about the data size of each faceprint.
* modelOptions (TFModelOptions*): Additional options that were used to generate the faceprints in the collection. This includes settings like vector compression.
* encrypted (bool): Indicates whether the collection is encrypted or not. This is crucial for security and privacy considerations.

### Notes:
* TFCollectionMetadata is essential for applications that manage multiple faceprint collections, as it provides vital information for organizing, retrieving, and understanding these collections.
* Knowing the modelName and modelOptions used for a collection is important for ensuring consistency and compatibility, especially when working with different versions or configurations of the SDK.
* The encrypted property is particularly important for applications dealing with sensitive or private data, ensuring adherence to privacy standards and regulations.

### TFBlinkState
- is a class in the SDK that provides results from blink detection, allowing for analysis of eye closure states. This class is especially useful in applications involving driver monitoring, fatigue detection, or user interaction based on eye movements.

### Properties:
* isLeftEyeClosed (bool): A boolean indicating whether the left eye is predicted to be closed. The prediction is based on a combination of the left eye's score and aspect ratio.
* isRightEyeClosed (bool): Similar to isLeftEyeClosed, but for the right eye. It indicates whether the right eye is predicted to be closed.
* leftEyeScore (float): A score indicating the state of the left eye - with 0 indicating closed and 1 indicating open. This score is part of the computation to determine isLeftEyeClosed.
* rightEyeScore (float): A score for the right eye, functioning similarly to leftEyeScore. It's used in determining isRightEyeClosed.
* leftEyeAspectRatio (float): The aspect ratio of the left eye, computed as the height divided by the width of the eye. It's a factor in calculating isLeftEyeClosed.
* rightEyeAspectRatio (float): The aspect ratio for the right eye, calculated in the same way as leftEyeAspectRatio. It plays a role in the prediction for isRightEyeClosed.

### Notes:
* TFBlinkState is integral in systems where understanding eye movements and states is critical. By providing detailed metrics like scores and aspect ratios, it allows for nuanced analysis of eye behavior.
* The properties offer the flexibility to set custom thresholds that best suit specific camera setups and lighting conditions, enhancing the adaptability of the blink detection feature.
* The combination of scores and aspect ratios makes the blink detection more robust and reliable, catering to a wide range of real-world conditions and scenarios.

### TFColorRGB
- is a class in the SDK designed to represent colors in the RGB color space. It's particularly useful in applications that involve image processing and need to define specific colors for various purposes like drawing, filtering, or visualization.

### Properties:
* r (int): Represents the red channel of the color. The value must be within the range [0, 255], where 0 means no red and 255 means full red intensity.
* g (int): Represents the green channel. Similar to the red channel, its value is between 0 and 255, indicating the intensity of the green color.
* b (int): Stands for the blue channel, again with values ranging from 0 to 255, determining the intensity of the blue color.

### Notes:
* TFColorRGB is essential for defining and manipulating colors in image and video analysis tasks. It allows for precise control over the color components, enabling accurate color representation and manipulation.
* The use of integer values in the range [0, 255] makes it compatible with standard RGB color models used in digital images and displays.
* This class can be used in various contexts like setting the color of bounding boxes, landmarks, or overlays in image processing applications.

### TFSimilarity
- is a class in the SDK designed to encapsulate the results of a similarity assessment, typically used in face recognition and matching scenarios.

### Properties:
* matchProbability (float): Represents the probability that two face feature vectors are a match. This value provides an assessment of the likelihood of a correct match.
* similarityMeasure (float): A value indicating the degree of similarity between two feature vectors. This measure is key in determining how closely the features of two faces resemble each other.

### Notes:
* TFSimilarity is critical in applications where determining the degree of resemblance between faces is necessary, such as in authentication or identification systems.
* The combination of matchProbability and similarityMeasure offers a comprehensive view of the similarity, enabling more informed decisions based on both the likelihood and the degree of match.

### TFCollectionIdentities
- is a class used for representing a pair of identity information within a collection, typically used in scenarios involving database management and faceprint identification.

### Properties:
* identity (NSString*): A string representing the identity of a person or an object within the collection. This could be a name, label, or any identifier.
* UUID (NSString*): The unique identifier associated with the identity. It's typically a UUID (Universally Unique Identifier) that serves to distinguish each entry in the collection.

### Notes:
* TFCollectionIdentities plays an important role in managing and referencing specific identities within a large collection of faceprints or other biometric data.
* The use of UUID alongside a human-readable identity provides a robust way to manage and query identities within the system, ensuring both clarity and uniqueness.

### TFHeadOrientation
- is a class in the SDK used to represent the orientation of a head in three-dimensional space. This class is essential in applications that require analyzing or tracking head movements and positions.

### Properties:
* yaw (float): Represents the rotation around the vertical axis (Y-axis), indicating left or right rotation of the head.
* pitch (float): Represents the rotation around the side-to-side axis (X-axis), indicating up or down tilt of the head.
* roll (float): Represents the rotation around the front-to-back axis (Z-axis), indicating the tilt of the head to the left or right shoulder.
* errorCode (TFErrorCode): An enumerated value that captures any error that might have occurred during the head orientation detection. This helps in identifying and handling potential issues.

### Notes:
* TFHeadOrientation is crucial in scenarios such as driver monitoring systems, interactive applications responding to head movements, and augmented reality experiences.
* The properties yaw, pitch, and roll enable a comprehensive understanding of head orientation, which is key for accurate and realistic interaction in various applications.
* The inclusion of errorCode ensures robust error handling, allowing for more reliable and error-resilient head orientation detection.

### TFFacechip
- is a class in the SDK that manages a 'face chip' image. A face chip is an aligned and cropped image of a face, optimized for facial recognition and analysis.

### Methods:
* destroy(): Frees the resources associated with the face chip.
* loadImage(NSString *filepath): Loads a face chip image from the specified file path.
* saveImage(NSString *filepath): Saves the face chip image to the specified file path.
* getChannels(): Returns the number of color channels in the face chip image.
* getHeight(): Retrieves the height of the face chip image.
* getWidth(): Retrieves the width of the face chip image.
* getData(): Returns the face chip image data as NSData.
* getUIImage(): Converts and returns the face chip image as a UIImage object (useful for iOS applications).

### Notes:
* `destroy()`: This method is specifically designed to proactively manage memory by freeing up the resources associated with the face chip. In scenarios like live camera processing, where images are continuously analyzed, Automatic Reference Counting (ARC) in iOS might not release memory quickly enough. This can lead to memory buildup and potential application crashes due to excessive memory usage.
By explicitly calling destroy, developers can force the application to immediately free the memory associated with a face chip, preventing memory buildup and enhancing application stability and performance.
Furthermore, during the dealloc phase, when ARC finally attempts to clean up, the invalidate flag is used to determine if the memory has already been freed, ensuring that memory management is handled effectively and avoiding any redundant release attempts.

### TFImage
- is a class in the SDK that represents an image, providing functionalities for manipulation and analysis. This class is essential for handling image data within various image processing tasks in the SDK.

### Methods:
* getErrorCode(): Returns a TFErrorCode indicating the status or any error associated with the image.
* destroy(): Frees the resources associated with the image. This method is particularly useful in scenarios involving real-time image processing (like camera feeds), where it can be used to manage memory effectively, preventing buildup and potential crashes.
* rotate(TFRotateFlags rotateFlags): Rotates the image according to the specified TFRotateFlags.
* saveImage(NSString *filepath): Saves the image to the specified file path.
* getChannels(): Returns the number of color channels in the image.
* getHeight(): Retrieves the height of the image.
* getWidth(): Retrieves the width of the image.
* getData(): Returns the image data as NSData.
* getUIImage(): Converts and returns the image as a UIImage object (useful for iOS applications).

### Notes:
* Similar to TFFacechip, the destroy method in TFImage serves a critical role in proactive memory management, especially in high-frequency image processing scenarios. It allows developers to immediately release the memory associated with an image, which is vital in real-time applications to prevent memory overflow and ensure smooth operation.


### TFSDK
- is a comprehensive class in the SDK that encapsulates a wide range of functionalities related to image processing, face recognition, object detection, and more. This class serves as the central interface for most of the SDK's capabilities.

### Initialization and Management Methods:
* init: Initializes the SDK.
* initWithConfigurationOptions:: Initializes the SDK with specified configuration options.

### License Management:
* setLicense:: Sets the license token for the SDK.
* isLicensed: Checks if the SDK is properly licensed.
* getExpireTime: Retrieves the expiration time of the license.
* getVersion: Gets the SDK version.

### Image Processing:
* preprocessImage:: Preprocesses a UIImage.
* preprocessImageWithData:: Preprocesses an image with specific data, dimensions, and color code.
* preprocessImagePath:: Preprocesses an image from a file path.

### Detection and Recognition:
* detectObjects:: Detects objects in a given image.
* estimatePose:: Estimates the body pose from an image.
* detectLargestFace:: Detects the largest face in an image.
* detectFaces:: Detects all faces in an image.
* getFaceLandmarks::: Retrieves facial landmarks.
* extractAlignedFace::: Extracts an aligned face from the image.
* extractAlignedFace:::::: Extracts an aligned face with specified margins and scale.
* getLargestFaceFeatureVector:: Gets the feature vector of the largest detected face.
* getFaceFeatureVector::: Obtains the face feature vector for a specific face.
* faceprintToJson:: Converts a faceprint to JSON.
* jsonToFaceprint:: Converts JSON to a faceprint.
* getSimilarity::: Computes the similarity between two faceprints.
* estimateHeadOrientation::: Estimates the head orientation.
* estimateFaceImageQuality:: Estimates the quality of a face image.

### Exposure and Quality Checks:
* checkFaceImageExposure:::: Checks the exposure quality of a face image.
* detectBlink::: Detects blinking in a face.
* checkSpoofImageFaceSize:::: Checks the face size in an image for spoof detection.
* detectActiveSpoof::: Detects active spoofing attempts.
* detectSpoof:::: Detects spoofing in a face image.

### Database and Collection Management:
* createDatabaseConnection:: Creates a database connection.
* createLoadCollection:: Creates and loads a collection.
* createCollection:: Creates a new collection.
* loadCollection:: Loads an existing collection.
* deleteCollection:: Deletes a collection.
* enrollFaceprint::: Enrolls a faceprint in a collection.
* getCollectionNames: Retrieves the names of all collections.
* getCollectionMetadata:: Gets metadata of a specific collection.
* getCollectionIdentities:: Retrieves identities within a collection.
* removeByUUID:: Removes a faceprint by UUID.
* removeByIdentity:: Removes a faceprint by identity.

### Identification and Candidate Retrieval:
* identifyTopCandidate:: Identifies the top candidate matching a faceprint.
* identifyTopCandidate::: Identifies the top candidate with a threshold.
* identifyTopCandidates::: Identifies the top candidates.
* identifyTopCandidates:::: Identifies top candidates with a threshold.

### Feature Detection:
* detectMask::: Detects if a mask is worn in a face image.
* detectGlasses::: Detects if glasses are worn in a face image.
* getFaceImageRotation:: Determines the rotation of a face image.
* detectFaceImageBlur:: Detects blur in a face image.
