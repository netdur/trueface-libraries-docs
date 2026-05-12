# Models

Models are distributed as encrypted `.enc` files. Download the ones you need and place them in your app's assets, then point `ConfigurationOptions.modelsPath` at the directory.

You only need to ship the models for features your app actually uses — every model loads lazily.

## Face recognition

Pick **one** recognition model. You cannot mix faceprints from different models in the same collection.

| Model | Notes |
|---|---|
| [LITE_V2](https://storage.googleapis.com/sdk-models/enc/face_recognition/face_recognition_lite_v2.trueface.v2.enc) | Lightweight, fast — good for prototyping |
| [LITE_V3 (CPU)](https://storage.googleapis.com/sdk-models/enc/face_recognition/face_recognition_lite_v3_cpu.trueface.v2.enc) | Lightweight, most accurate small model |
| [LITE_V3 (GPU)](https://storage.googleapis.com/sdk-models/enc/face_recognition/face_recognition_lite_v3_gpu.trueface.v2.enc) | LITE_V3 optimized for GPU inference |
| [TFV5_2](https://storage.googleapis.com/sdk-models/enc/face_recognition/face_recognition_v5_2.trueface.v2.enc) | High accuracy on unmasked faces |
| [TFV6](https://storage.googleapis.com/sdk-models/enc/face_recognition/face_recognition_v6.trueface.v2.enc) | High accuracy on masked faces |
| [TFV7](https://storage.googleapis.com/sdk-models/enc/face_recognition/face_recognition_v7.trueface.v2.enc) | Highest overall accuracy; slowest |

## Face detection

| Model | Notes |
|---|---|
| [Fast v2](https://storage.googleapis.com/sdk-models/enc/face_detection/face_detector_v2_fast.trueface.v2.enc) | Default. Good speed/accuracy balance. |
| [Accurate v2 (CPU)](https://storage.googleapis.com/sdk-models/enc/face_detection/face_detector_cpu_v2_accurate.trueface.v2.enc) | Higher accuracy, higher latency |
| [Accurate v2 (GPU)](https://storage.googleapis.com/sdk-models/enc/face_detection/face_detector_gpu_v2_accurate.trueface.v2.enc) | Accurate variant for GPU inference |

## Object detection

| Model | Notes |
|---|---|
| [Fast v2](https://storage.googleapis.com/sdk-models/enc/object_detection/object_detector_v2_fast.trueface.v2.enc) | 640 × 640 input |
| [Accurate v2](https://storage.googleapis.com/sdk-models/enc/object_detection/object_detector_v2_accurate.trueface.v2.enc) | 1280 × 1280 input |

## Liveness and quality

| Model | Notes |
|---|---|
| [Spoof detector v6](https://storage.googleapis.com/sdk-models/enc/spoof/spoof_detection_v6.trueface.v2.enc) | Passive spoof |
| [Face landmark detector v2](https://storage.googleapis.com/sdk-models/enc/landmark_detection/face_landmark_detector_v2.trueface.v2.enc) | 106-point landmarks |
| [Face blur detector v1](https://storage.googleapis.com/sdk-models/enc/blur/face_blur_detector_v1.trueface.v2.enc) | Blur classifier |
| [Face orientation detector v1](https://storage.googleapis.com/sdk-models/enc/face_orientation/face_orientation_detector_v1.trueface.v2.enc) | Yaw/pitch/roll |
| [Face template quality v1 (CPU)](https://storage.googleapis.com/sdk-models/enc/face_template_quality/face_template_quality_v1_cpu.trueface.v2.enc) | Pre-recognition quality gate |
| [Face template quality v1 (GPU)](https://storage.googleapis.com/sdk-models/enc/face_template_quality/face_template_quality_v1_gpu.trueface.v2.enc) | GPU variant |

## Attributes

| Model | Notes |
|---|---|
| [Mask detector v3](https://storage.googleapis.com/sdk-models/enc/mask/mask_detector_v3.trueface.v2.enc) | Mask / no-mask |
| [Eyeglass detector v1](https://storage.googleapis.com/sdk-models/enc/eyeglasses/eyeglass_detector_v1.trueface.v2.1.enc) | Glasses / no-glasses |
| [Blink detector v3](https://storage.googleapis.com/sdk-models/enc/blink/blink_detector_v3.trueface.v2.enc) | Per-eye blink state |

## Deprecated

| Model | Notes |
|---|---|
| [Body pose estimator v1](https://storage.googleapis.com/sdk-models/enc/body_pose_estimator/v1/body_pose_estimator_v1.trueface.v2.1.enc) | Deprecated, no replacement on mobile |
