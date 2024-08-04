# FacialRecognitionModel

## `public enum FacialRecognitionModel`

Facial recognition models. Refer to the [ROC curves](https://docs.trueface.ai/roc-curves) to compare model accuracy and the [benchmarks page](https://docs.trueface.ai/benchmarks) to compare inference speed. The current most accurate model is TFV7.

### Enum Constants

#### `LITE_V2`

Note: Consider using LITE_V3 instead of this model. Lightweight model ideal for embedded systems, lightweight CPU-only deployments, prototyping, and some 1 to 1 matching use cases.

#### `LITE_V3`

Our most accurate lightweight model. Ideal for embedded systems or lightweight CPU-only deployments, prototyping, 1 to 1 matching, and some 1 to N use cases.

#### `TFV5_2`

TFV5_2 is a substitute for our TFV5 model which was available up until SDK version 1.8. This substitution was required due to model incompatibility with our new inference framework. The accuracy and inference speed are both comparable to TFV5. However, Faceprints are not compatible between the two models; if you would like to upgrade a collection containing TFV5 Faceprints to TFV5_2 Faceprints, you will need to regenerate and re-enroll Faceprints for all your images. TFV5_2 is currently the second-highest accuracy model for unmasked face images. Inference time is faster than TFV7 but comparable to TFV6. Ideal for GPU deployments and for 1 to N use cases.

#### `TFV6`

TFV6 is currently the second-highest accuracy model for masked face images. Use TFV6 in situations where it is anticipated that the probe image contains a masked face (for 1 to N search), or where one or both face images are masked (for 1 to 1 comparisons). TFV6 has comparable inference time to TFV5_2 and is faster than TFV7.

#### `TFV7`

TFV7 is currently our overall highest accuracy model, but it is also our slowest model. Ideal for GPU deployments and for 1 to N use cases.