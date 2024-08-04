# GPUModuleOptions

## `public class GPUModuleOptions`

GPU options for a specific module (e.g., face detector).

### Fields

#### `public Precision precision = Precision.FP16`

Precision level used for inference.

#### `public int maxBatchSize = 4`

The maximum batch size which will be used.

#### `public int optBatchSize = 1`

The batch size which should be optimized for. Must be less than or equal to `Trueface::GPUModuleOptions.maxBatchSize`.

#### `public long maxWorkspaceSizeMb = 2000`

The maximum allowable GPU memory to be used for model conversion, in Mb. Applications should allow the engine builder as much workspace as they can afford. At runtime, the SDK allocates no more than this and typically less.

### Constructors

#### `public GPUModuleOptions()`

Default constructor.

#### `public GPUModuleOptions(Precision precision, int maxBatchSize, int optBatchSize, long maxWorkspaceSizeMb)`

Constructor to initialize the `GPUModuleOptions` with specific values.

- **Parameters:**
  - `precision` - Precision level used for inference.
  - `maxBatchSize` - The maximum batch size which will be used.
  - `optBatchSize` - The batch size which should be optimized for.
  - `maxWorkspaceSizeMb` - The maximum allowable GPU memory to be used for model conversion, in Mb.