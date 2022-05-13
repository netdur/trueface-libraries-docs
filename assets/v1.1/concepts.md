## Face Recognition Implement Flow

To successfully implement a face recognition process, please follow this simple logic:

### 1. Obtain Photo
First obtain a valid photo, either as file or bytes array, make sure to have a clear, well lighted photo, in medium size and rotated correctly.

### 2. Find Faces
Find faces in given photo, this is a critical step in face recognition process, in most cases, you may only interest in the largest face in photo.

### 3. Extract Features
Once you have successfully found a face in given photo, extract face features (in form of array of numbers) and store it somewhere with label of person.

### 3. Calculate Similarity
To verify or recognite a person, please do steps 1, 2 and 3, then calculate of previously obtained features and current features. 

### 4. SDK Utilities
To make process easier, we have set of API methods to enroll and match candidates based on face features.
