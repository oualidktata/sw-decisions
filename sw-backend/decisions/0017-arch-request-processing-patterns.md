# 17. Request Processing pattern

Date: 2022-04-21

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/04/21 |S.Bhatti|
|Accepted|2022/08/04  |Synergy|

## Context

Traditionally data driven applications are using models to store/load data from data store. When a UI component initiates request, the backend components receives it, perform the business logic and executes it to data store to load or store data. Normally for both read and write operations, the same DTO is being used. In more complex applications, application may need to perform a number of queries, returning different DTOs and then transforming those queries to return the required data. While on write side (saving data) object mapping can be complicated, the model may implement complex validation and business logic, which make the model overly complicated. Due to this coupling of same dtos for data storing and retrieval, the flexibility and maintenability of read/write does not exist. This can also be a blocker for independent scaling.

## Decision

We will implement CQRS with MediatR library.

## Consequences

With the use of CQRS and MediatR the application have much **simpler queries**, avoiding the extra overhead of complex joins reading the data. This will also help in:
* Independent scalling, read and write workloads can be scaled independently and will result in fewer lock contentions.
* Optimized data schemas, the read side will use the schema optimized for queries and write side will use schema optimized for updates
* The complex logic of writes will be in the write side, while read model will remain relatively simple.
* Easy to maintain the code being separated based upon the task (Read/write).
* Decouples the components initiating the read/write from the components implementing the operation

Using the pattern also has some challenges.
* Although its quite logical to separate read/write operation, but adopting it coming from the traditional mindset can be hard that will become lesser after practice and learnings.
* The developer can be overwhelmed by the number of files required due the separation of read/write and the processing of request
* If read and writes are separate databases then the read data could be stale, the system should follow eventual consistency and write data must be reflated to the read data.


## License
The license for MediatR library is Apache License 2.0

- [Documentation](../documentation/arch-style/CQRS-Mediatr.md)