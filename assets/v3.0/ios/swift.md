### Interoperability of Objective-C and Swift

Objective-C methods are automatically imported into Swift with a transformed syntax that aligns with Swift’s language conventions. Understanding these transformations will help Swift developers effectively use Objective-C APIs.

#### Naming Conventions

1. **Prefix Stripping**: Objective-C methods often have prefixes related to the class or framework they belong to (e.g., `TF`). Swift removes these prefixes in the method name as they are usually redundant within the context of use.

2. **Base Name Simplification**: The initial part of the Objective-C method name (before the first colon) becomes the base name in Swift. If the base name includes prepositions or conjunctions (e.g., `In`, `With`, `And`), Swift often omits these to streamline the method name. For example, `detectSpoofInImage` becomes `detectSpoof`.

#### Parameter Handling

1. **First Parameter Adaptation**: In Objective-C, the first parameter is often part of the method name. In Swift, the first parameter is typically standalone and its external name is omitted, making it part of the function signature. For example, `image` in `detectSpoofInImage` becomes just `in`.

2. **External Parameter Names**: Swift uses external names for the second and subsequent parameters to clarify their roles. These names are usually derived from the Objective-C method’s parameter names but are more concise. For instance, `withFaceBoxAndLandmarks:` becomes `with:`.

3. **Argument Labels**: Swift encourages the use of argument labels to make function calls read as sentences. This means that each parameter in Swift has a label that describes its purpose, enhancing code readability and maintainability.

#### Example Transformation

Objective-C Method:
```objective-c
- (TFSpoofResult*)detectSpoofInImage:(TFImage *)image withFaceBoxAndLandmarks:(TFFaceBoxAndLandmarks *)faceBoxAndLandmarks threshold:(float)threshold;
```

Swift Equivalent:
```swift
func detectSpoof(in image: TFImage, with faceBoxAndLandmarks: TFFaceBoxAndLandmarks, threshold: Float) -> TFSpoofResult
```

In Swift, this method is called as follows:
```swift
let spoofResult = sdk.detectSpoof(in: image, with: faceBoxAndLandmarks, threshold: 0.5)
```

- `in`: This label makes it clear that the function is detecting spoofing within a specific image.
- `with`: Clarifies that detection uses the provided face box and landmarks.
- `threshold`: Remains largely unchanged but is now an external parameter name, making its purpose in the call clear.

#### Summary

Understanding these transformation rules helps in utilizing Objective-C APIs within Swift. By recognizing these patterns, developers can predict how Objective-C methods will appear in Swift and use them effectively without needing to look up each method’s Swift signature.
