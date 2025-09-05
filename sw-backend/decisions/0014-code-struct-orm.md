# 14. ORM (EF Core, NHibernate, Dapper, SQL2DB)

Date: 2022-05-29

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/05/29|S.Bhatti|
|Accepted|--- |Synergy|

## Context (still in progress looking for some POCs to be completed)
 
The issue motivating this decision, and any context that influences or constrains the decision.

Modern enterprise applications use ORM to communicate with the database. This lets the application do query and manipulates data from database without getting into communication details. Due to this ease the development team remains focussed on business logic without much worrying about the communication. There are a number of ORMs available in the market, we need to choose the right ORM for the application. We are developing application based upon clean architecture with DDD pattern using in .net environment.

## Decision

The change that we're proposing or have agreed to implement.

## Consequences

Team pay more attention to the business logic rather than looking the issues in communication with DB. There is no repetitive piles of code needed for DB communication. The queries will be cached that will be available during the litfetime of the transaction. The properties of entity classes can be validated. We can prepare configuration files for the entities to be saved in database. Migrations API can be used to list the version of schema and can migrate to any version.
Since the ORMS provides abstraction, there are some challenges that could be faced.
Slower performance as compared to direct queries, which is generally dues to execution of more code and framework features like tracking.
Non supported database, each ORM supports some databases, EF Core currently supports a few DBs (SQL Server, Azure SQL Database, SQLite, Azure Cosmos DB, MySQL, PostgreSQL) but if there is any other database which is not supported by EF Core then we need to think of using NHibernate for those applications.
 
 - [Documentation](../documentation/code-structure/ORM-selection.md)