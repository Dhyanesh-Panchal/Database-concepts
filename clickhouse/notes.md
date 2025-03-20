# Basic CRUD

- Good doc for syntax: [Ref](https://clickhouse.com/docs/sql-reference/syntax)

## 1. Create Database:
```clickhouse
CREATE DATABASE IF NOT EXISTS test_db
```
## 2. Create Table
```clickhouse
CREATE TABLE IF NOT EXISTS testdb.test_table
(
    user_id UInt32,
    user_name String,
    timestamp Datetime,
    metric Float32
)
ENGINE=MergeTree()
PRIMARY KEY (user_id, timestamp)
```
### Primary keys
- **primary keys in ClickHouse are not unique for each row in a table**
- The primary key determines how the data is sorted when written to disk.
  - This granularity concept creates a _sparse index_ that can easily fit in memory, and the granules represent a stripe of the smallest amount of column data that gets processed during `SELECT` queries.

### Query Parameters

## 3. Insert Data
```clickhouse
INSERT INTO testdb.test_table (user_id, message, timestamp, metric) VALUES
    (101, 'Hello, ClickHouse!',                                 now(),       -1.0    ),
    (102, 'Insert a lot of rows per batch',                     yesterday(), 1.41421 ),
    (102, 'Sort your data based on your commonly-used queries', today(),     2.718   ),
    (101, 'Granules are the smallest chunks of data read',      now() + 5,   3.14159 )
```
- Docs recomend to insert large data in single batches:
  > - By default, each insert sent to ClickHouse causes ClickHouse to immediately create a part of storage containing the data from the insert together with other metadata that needs to be stored.
  > - Therefore, sending a smaller amount of inserts that each contain more data, compared to sending a larger amount of inserts that each contain less data, will reduce the number of writes required.
  > - Generally, we recommend inserting data in fairly large batches of at least 1,000 rows at a time, and ideally between 10,000 to 100,000 rows. (Further details here).


## 4. Update Data
- Modifying or deleting existing data is labeled "mutations" and is done using `ALTER TABLE` keyword.
```clickhouse
ALTER TABLE testdb.test_table 
UPDATE metric = 100.123 
WHERE user_id <= 4
```

### Altering columns
- Good Ref: [Column Manipulations](https://clickhouse.com/docs/sql-reference/statements/alter/column#rename-column)
#### Add Column
```clickhouse
ALTER TABLE testdb.test_table
    ADD COLUMN newColumn UInt64 FIRST;
```
- By Default the column gets add at the last. `FIRST` is used to add the column at First.

#### Rename a column
```clickhouse
ALTER TABLE testdb.test_table
    RENAME COLUMN newColumn TO new_column;
```
#### Modify Column
Move the columns
```clickhouse
ALTER TABLE testdb.test_table
    MODIFY COLUMN user_id UInt32 FIRST;
```
Type conversion
```clickhouse

```



## 5. Delete Data

```clickhouse
ALTER TABLE testdb.test_table DELETE WHERE user_id > 4
```

#### Lightweight Deletes
- It is only available for the *MergeTree table engine family.
```clickhouse
DELETE FROM testdb.test_table WHERE user_id > 4
```

---
# Other points
- ``SHOW DATABASES`` to see the Databases.

### **Heredoc**:
- It is a way to define a multilined string while maintaining the original formating:
  - ``SELECT $heredoc$SHOW CREATE VIEW my_view$heredoc$;``
  - Here the "SHOW CREATE VIEW my_view" is reated as a string.
  - Tip: We can use a heredoc to embed snippets of SQL, HTML, or XML code, etc.
