# UnsupportedOnMobile

Runtime annotation that marks an SDK method or field as unavailable on Android. Calling an annotated member at runtime is undefined — typically it returns an error code or throws.

The annotation is shared between the Android binding and the upstream SDK metadata; on mobile its purpose is documentation only.

```java
@UnsupportedOnMobile
public void someDesktopOnlyApi() { ... }
```
