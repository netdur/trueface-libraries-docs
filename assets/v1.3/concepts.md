## Face Recognition Implement Flow

To successfully implement a face recognition process, please follow the simple logic / steps detailed below:

### 1. Obtain a Photograph
First, obtain a valid photo (either as a file or as array bytes). Make sure to have a clear photo with good lighting. The photo should be in medium size and rotated correctly/in the correct orientation.

### 2. Find Faces in Your Photo
Find faces in your given photo. This is a critical step in the face recognition process, in most cases, you may only be interested in the largest face in photo since that will be the easiest to use for further processing.

### 3. Extract Facial Features
Once you have successfully found a face in a given photo, extract the facial features (in the form of array of numbers) and store it somewhere. Then label your array with name of an actual person, for example, Joshua or Byran.

### 3. Calculate Similarity
To verify or recognize a person, execute steps 1, 2, and 3. Then, using previously calculated features (such as those stored in a previous array), compare previous array results with current features. Obviously, if the previous and current values are similar or an exact match then your facial recognition is a match. If not, then you will have a mismatch and the face won’t be recognized.

### 4. SDK Utilities
To make the process easier, we have a set of API methods to enroll and match candidates based on facial features. You can use the power of the SDK to make your work easier for developing and deployment of your facial recognition program. 

We are always available for any support required regarding our SDK. Thank you.

