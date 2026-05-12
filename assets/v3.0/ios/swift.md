# Swift bridging

The Trueface SDK is an Objective-C framework. Xcode's Swift importer transforms Objective-C selectors into Swift function signatures automatically — here's what to expect.

## Naming

| Objective-C | Swift |
|---|---|
| Class prefix `TF` | Kept (`TFSDK`, `TFImage`) |
| Selector base name (before first `:`) | Function name |
| Preposition-style fragments (`InImage`, `WithLandmarks`) | Become labels, often shortened |

## Parameters

- The first parameter usually drops its external name and folds into the selector base.
- Subsequent parameters get short, prepositional labels (`with:`, `using:`, `in:`).

## Example

Objective-C selector:

```objc
- (TFSpoofResult *)detectSpoofInImage:(TFImage *)image
              withFaceBoxAndLandmarks:(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks
                            threshold:(float)threshold;
```

Imported into Swift:

```swift
func detectSpoof(in image: TFImage,
                 with faceBoxAndLandmarks: TFFaceBoxAndLandmarks,
                 threshold: Float) -> TFSpoofResult?
```

Call site:

```swift
let result = sdk.detectSpoof(in: image, with: face, threshold: 0.5)
```

## Nullability

Objective-C methods that may return `nil` (anything declared `nullable` or without `nonnull` annotations) come into Swift as **optional** return types. Always unwrap defensively:

```swift
guard let faceprint = sdk.getLargestFaceFeatureVector(from: image) else { return }
```

## See also

The full Objective-C method list is in [Objective-C reference](/v3.0/ios/objc).
