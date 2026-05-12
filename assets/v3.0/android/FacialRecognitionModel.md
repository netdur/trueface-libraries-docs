# FacialRecognitionModel

Available facial recognition models. Refer to the [ROC curves](https://docs.trueface.ai/roc-curves) and [benchmarks](https://docs.trueface.ai/benchmarks) for accuracy and inference speed comparisons. TFV7 is currently the most accurate model.

## Values

- `LITE_V2` - Lightweight model for embedded systems and lightweight CPU-only deployments. Consider using `LITE_V3` instead.
- `LITE_V3` - The most accurate lightweight model. Suitable for embedded systems, prototyping, 1-to-1 matching, and some 1-to-N use cases.
- `TFV5_2` - Substitute for the legacy TFV5 model. Faceprints are not compatible between TFV5 and TFV5_2. Second-highest accuracy for unmasked face images; faster than TFV7. Ideal for GPU deployments and 1-to-N use cases.
- `TFV6` - Second-highest accuracy for masked face images. Use when probe or gallery images may contain masked faces.
- `TFV7` - Highest overall accuracy, but slower than the other models. Ideal for GPU deployments and 1-to-N use cases.
