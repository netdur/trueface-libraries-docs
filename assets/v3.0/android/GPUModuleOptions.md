# GPUModuleOptions

GPU options for a specific module (e.g. face detector). Annotated `@UnsupportedOnMobile`.

## Fields

- `Precision precision` - Precision level used for inference. Default `FP16`. See [Precision](/v3.0/android/Precision).
- `int maxBatchSize` - Maximum batch size to support. Default `4`.
- `int optBatchSize` - Batch size to optimize for. Must be less than or equal to `maxBatchSize`. Default `1`.
- `long maxWorkspaceSizeMb` - Maximum GPU memory in MB available for model conversion. Default `2000`.
