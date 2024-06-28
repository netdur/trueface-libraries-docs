# Documentation

## `public class InitializeModule`

Initialize module in SDK constructor. By default, the SDK uses lazy initialization, meaning modules are only initialized when they are first used (on first inference). This is done so that modules which are not used do not load their models into memory, and hence do not utilize memory. The downside to this is that the first inference will be much slower as the model file is being decrypted and loaded into memory. Therefore, if you know you will use a module, choose to pre-initialize the module, which reads the model file into memory in the SDK constructor.

## `public boolean faceDetector = false`

Face detector

## `public boolean faceRecognizer = false`

Face recognizer

## `public boolean objectDetector = false`

Object detector

## `public boolean bodyposeEstimator = false`

Bodypose estimator

## `public boolean liveness = false`

Liveness

## `public boolean activeSpoof = false`

Active spoof

## `public boolean landmarkDetector = false`

106 face point landmark detector