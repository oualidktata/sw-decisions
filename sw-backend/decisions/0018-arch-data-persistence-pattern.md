# 18. Data Persistence Pattern

Date: 2022-04-25

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/04/25 |S.Bhatti|
|Accepted|2022/08/04 |Synergy|

## Context

Designing enterprise application needs an efficient persistence layer. Considering the architecture style and patterns, a more decoupled, highly scalable and maintainable approach is required. Following the DDD patterns with clean architecture, the choice of persistence layer could be using repository pattern with unit of work pattern.
A Repository pattern is a design pattern that mediates data from and to the Domain and Data Access Layers ( like Entity Framework Core / Dapper). Repositories are classes that hide the logics required to store or retreive data. Thus, our application will not care about what kind of ORM we are using, as everything related to the ORM is handled within a repository layer. This allows you to have a cleaner seperation of concerns. Repository pattern is one of the heavily used Design Patterns to build cleaner solutions.

Microsoft has built the Entity Framework Core using the Repository Pattern and Unit of Work Patterns. The school of thought encourages the use of direct dbContext instead of repository/unit of work pattern. The argument is, why do we need to add **another layer of abstraction** over the Entity Framework Core, which is yet another abstration of Data Access. 

![CQRS DDD Model](../images/code-struct/repository-dbcontext.png)

Using Entity Framework DbContext class directly from the application layer approach is encouraged where service is not much complex and developer wants to use the simplest code possible.
[Microsoft themselves recommend](https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/infrastructure-persistence-layer-implemenation-entity-framework-core#using-a-custom-repository-versus-using-ef-dbcontext-directly) using Repository Patterns in complex scenarios to reduce the coupling and provide better Testability of your solutions.
Implementing custom repositories provides number of benefits when implementing more complex microservices or applications. The Unit of Work and Repository patterns are intended to encapsulate the infrastructure persistence layer so it is decoupled from the application and domain-model layers.

 
## Decision

We will use repository and unit of work pattern.

## Consequences

The use of this pattern helps the application in following ways:
* Using repository pattern decouples the application layer from infrastructure layer.
* Repository Pattern Makes Our Code More Testable
* Repository Pattern Solves the DDD’s One Repository Per Aggregate Root
* Repository Pattern Helps Us Easily Switch out ORM
* In case of reads when we are using a micro-ORM and sometimes may be writing sql code, it will bypass EFCore completely, and will keep the complex query in one place

There is also an overhead of implementing the patterns over ORM.
* The code has more number of files, as there are more files more code to be implemented.
* Since there is another abstraction layer, the code is complex

So In some usecases considering the complexity of the system where the system is not much complex, DBContext can be used directly instead of having repositories 

## References

- [Documentation](../documentation/arch-style/Repository-pattern.md)