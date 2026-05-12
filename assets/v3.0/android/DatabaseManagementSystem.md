# DatabaseManagementSystem

Database management system used for storing templates.

## Values

- `SQLITE` - Use a SQLite backend. Writes templates to local disk. Ideal for embedded systems or use cases where only one process connects to the database.
- `POSTGRESQL` - Use a PostgreSQL backend (version 15 required). Ideal for distributed systems requiring synchronization. Not supported on mobile platforms.
- `NONE` - Do not write templates to disk; store only in RAM. Enrolled templates are not persisted after the program terminates.
