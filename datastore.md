# Datastore
A datastore is a broad term for any system that persistently stores and manages data, encompassing databases, file systems, and more. 

## A General Hierarchy
```text
📂 Data Storage Landscape
├── 🗂️ Datastore (General Term for Any Data Storage)
│   ├── 📁 File-Based Storage
│   │   ├── 📄 File Systems (NTFS, EXT4, HDFS)
│   │   ├── 🎯 Object Storage (Amazon S3, Google Cloud Storage)
│   │   ├── 🔢 Block Storage (AWS EBS, SAN)
│   ├── 🗃️ Database (Structured Data Storage)
│   │   ├── 📊 Relational Databases (SQL-Based)
│   │   │   ├── MySQL
│   │   │   ├── PostgreSQL
│   │   │   ├── Oracle DB
│   │   ├── 🔀 NoSQL Databases (Non-Relational)
│   │   │   ├── Key-Value Stores (Redis, DynamoDB)
│   │   │   ├── Document Stores (MongoDB, CouchDB)
│   │   │   ├── Columnar Stores (Cassandra, HBase)
│   │   │   ├── Graph Databases (Neo4j, Amazon Neptune)
│   ├── ⚡ Caches & Message Queues
│   │   ├── Redis
│   │   ├── Memcached
│   │   ├── Kafka
│   │   ├── RabbitMQ
│
├── 🏦 Data Warehouse (Structured Analytical Storage)
│   ├── Amazon Redshift
│   ├── Google BigQuery
│   ├── Snowflake
│   ├── Apache Hive
│
├── 🌊 Data Lake (Raw & Unstructured Storage)
│   ├── HDFS (Hadoop Distributed File System)
│   ├── Amazon S3 (Data Lake Storage)
│   ├── Azure Data Lake Storage
│   ├── Processing & Querying Engines
│   │   ├── Apache Spark
│   │   ├── Presto
│   │   ├── Apache Hive
│
└── 🏠 Data Lakehouse (Hybrid of Data Warehouse & Data Lake)
    ├── Databricks Lakehouse
    ├── Snowflake (Lakehouse Model)
    ├── Apache Iceberg
```

> - A database is just a collection of information. A data warehouse is often considered a step "above" a database, in that it's a larger store for data that could come from a variety of sources.
> - Both databases and data warehouses usually contain data that's either structured or semi-structured. 
> - In contrast, a data lake is a large store for data in its original, raw format.


## Databases
Good Reference: [Ref](https://www.redpanda.com/blog/database-data-lake-data-warehouse-differences#:~:text=Simply%20put%2C%20a%20database%20is,would%20be%20a%20data%20lake.)
- Databases are collections of data that are typically structured.
- Compared to the other two types, databases are optimized for data accessibility and retrieval. This means they excel at transactional operations but aren't really suitable for use cases involving heavy data analysis.


## Data warehouse
- Unlike databases, which typically have a single source of data, data warehouses hold records that come from a variety of sources.
- Data warehouse's primary goal is to enable its users to perform analysis on aggregated data from different (but related) sources.
- Some common features of a Warehouse include:
  - Ability to handle large data volumes
  - ETL support
  - Compatibility with OLAP and BI Tools
- The most popular data warehouses include Amazon Redshift, Google BigQuery, and Snowflake.

## Data Lakes
A data lake is a type of repository that stores data in its natural (or raw) format. Also called “data pools”.
Unlike databases and data warehouses, which typically only support structured data, data lakes allow you to store raw, unstructured data as is.
- Data lakes are the only type of data store that can handle unstructured data. You can dump anything into a data lake, and it won't complain during the write. However, this does mean that you'll likely have to do some preprocessing on the data before you can perform any meaningful analysis on it.
- Data lakes supports ELT where Data is Extracted and Load first-Transformed Later.
- Popular Data Lakes include: Google Cloud Storage, Azur Datalake Storage Gen2, Amazon S3.
