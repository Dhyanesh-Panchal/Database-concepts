# Partitioning
Database partitioning (also called data partitioning) refers to breaking the data in an application’s database into separate pieces, or partitions.

Exampl query For CLickhouse:
Query based on Month based partitioning.
```clickhouse
CREATE TABLE testdb.test_table_partioned
(
    date Date,
    user_id UInt32,
    user_name String
)
ENGINE = MergeTree
ORDER BY (user_id, user_name)
PARTITION BY toStartOfMonth(date);
```

- Whenever a set of rows is inserted into the table, instead of creating (at least) one single data part containing all the inserted rows (as described here), ClickHouse creates one new data part for each unique partition key value among the inserted rows.

![Partition in clickhouse](https://clickhouse.com/docs/assets/ideal-img/partitions.bf99fea.1024.png)
