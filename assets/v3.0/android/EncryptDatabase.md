# EncryptDatabase

Encrypt the biometric templates and identity strings when storing in the database using AES encryption. Enabling this adds overhead to Faceprint enrollment and to loading a collection into memory, but does not affect 1-to-N identification time.

## Fields

- `boolean enableEncryption` - Enable database encryption. An encryption key must be provided when enabled. SSL is strongly advised when using encryption with the PostgreSQL backend.
- `String key` - Encryption key. The key is hashed to a fixed length before being used for encryption.
