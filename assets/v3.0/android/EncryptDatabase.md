# EncryptDatabase

## `public class EncryptDatabase`

Encrypt the biometric templates and identity strings when storing in the database using AES encryption. Note, enabling this option does add overhead to Faceprint enrollment as well as loading a collection from a database into memory. Enabling encryption does not increase the 1 to N identification time.

### Fields

#### `public boolean enableEncryption = false`

Enable database encryption. Must provide encryption key if encryption is enabled. If enabling encryption with PostgreSQL backend, it is strongly advised to require SSL for PostgreSQL connection.

#### `public String key`

Encryption key. The key is hashed to a fixed length before being used for encryption.

### Constructors

#### `public EncryptDatabase()`

Default constructor.

#### `public EncryptDatabase(boolean enableEncryption, String key)`

Constructor to initialize the `EncryptDatabase` with specific values.

- **Parameters:**
  - `enableEncryption` - Enable database encryption.
  - `key` - Encryption key.