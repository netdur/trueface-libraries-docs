# DatabaseManagementSystem

## `public enum DatabaseManagementSystem`

Database Management System for storing templates.

### Enum Constants

#### `SQLITE`

Use SQLite backend. Write templates to local disk. Ideal for embedded systems or use cases where only one process connects to the database.

#### `POSTGRESQL`

Use a PostgreSQL backend. You must use PostgreSQL version 15. Ideal for distributed systems requiring synchronization. Note: Not supported on mobile platforms.

#### `NONE`

Do not write template to disk, only store in RAM. Warning, enrolled templates will not be saved after the program terminates.