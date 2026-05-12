# Face Recognition Concepts

Face recognition with the Trueface SDK is a pipeline of discrete steps. Each step is a separate API call, which gives you control over what to run, when, and at what resolution.

## 1. Capture an input image

Provide a clear, well-lit image — from camera, file, or raw bytes. The minimum recommended size for reliable detection is **480 × 360**, with each face occupying at least **100 × 100 pixels** for detection and **200 × 200** for landmark or feature extraction.

Make sure the image is rotated to upright before passing it in. The SDK does not auto-rotate based on EXIF.

## 2. Detect faces

Run face detection to locate every face in the frame as a [`FaceBoxAndLandmarks`](/v3.0/android/FaceBoxAndLandmarks), which carries a bounding box, five-point landmarks (eyes, nose, mouth corners), and a detection score.

For most authentication flows you only care about the largest face — use `detectLargestFace` to skip the multi-face overhead.

## 3. Extract a faceprint

A **faceprint** is a fixed-size feature vector (a `Faceprint` object) computed from a detected face. Faceprints are the unit of comparison — never raw pixels.

Faceprints from the same person score higher when compared, regardless of pose, lighting, or background, as long as the input image quality is sufficient.

## 4. Store faceprints in a collection

A **collection** is a named, on-device set of faceprints with an associated identity string per entry. Collections are backed by SQLite. Enroll once, then identify many times.

Collections also store the model name used to generate their faceprints. You cannot mix faceprints from different recognition models in the same collection.

## 5. Compare or identify

- **1:1 comparison** — `getSimilarity(fp1, fp2)` returns a similarity score and a calibrated match probability. Use this for verification flows.
- **1:N identification** — `identifyTopCandidate(faceprint, threshold, collectionName)` searches a loaded collection and returns the best match above the threshold, or null.

## 6. Choose a threshold

A threshold is a similarity score above which two faceprints are considered the same person. Lower thresholds increase recall (fewer false rejects) but also increase false-accept risk. Pick the threshold for your security posture — typical security-conscious values are in the 0.4–0.6 similarity range for the heavier recognition models.

## 7. Use liveness and quality checks

Before trusting a recognition result, verify the input is from a real, present person:

- **Passive spoof** — `detectSpoof` flags photos, screens, and masks from a single frame.
- **Active spoof** — `detectActiveSpoof` runs a two-stage near/far flow with explicit landmarks at each stage.
- **Quality** — `estimateFaceImageQuality`, `detectFaceImageBlur`, `checkFaceImageExposure` reject low-quality captures before they reach the recognition step.

## 8. Iterate on thresholds and models

Recognition is a tradeoff between speed and accuracy. The lightweight models (`LITE_V2`, `LITE_V3`) run fast on phones with small memory footprints; the heavy models (`TFV6`, `TFV7`) give the highest accuracy on capable hardware. Profile both, then pick.
