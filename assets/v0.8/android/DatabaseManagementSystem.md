# DatabaseManagementSystem

## `public enum DatabaseManagementSystem`

Database Management System for storing templates

## `SQLITE,`

Use sqlite backend. Write templates to local disk. Ideal for embedded systems or use cases where only one process connects to the database.

## `NONE`

Do not write template to disk, only store in ram. Warning, enrolled templates will not be saved after the program terminates
