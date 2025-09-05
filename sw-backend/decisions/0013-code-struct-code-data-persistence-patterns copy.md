# 13. Use of Repository Pattern (should describe the code structuring using repository pattern which is in Arch style topic)

Date: 2022-05-20

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/05/20|S.Bhatti|
|Accepted|--- |Synergy|

## Context

A Repository pattern is a design pattern that mediates data from and to the Domain and Data Access Layers ( like Entity Framework Core / Dapper). Repositories are classes that hide the logics required to store or retrieve data. Thus, our application will not care about what kind of ORM we are using, as everything related to the ORM is handled within a repository layer. This allows you to have a cleaner seperation of concerns. Repository pattern is one of the heavily used Design Patterns to build cleaner solutions.
Microsoft has built the Entity Framework Core using the Repository Pattern and Unit of Work Patterns. So, why do we need to add **another layer of abstraction** over the Entity Framework Core, which is yet another abstration of Data Access. 
[Microsoft themselves recommend](https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/infrastructure-persistence-layer-implemenation-entity-framework-core#using-a-custom-repository-versus-using-ef-dbcontext-directly) using Repository Patterns in complex scenarios to reduce the coupling and provide better Testability of your solutions. In cases where you want the simplest possible code, you would want to avoid the Repository Pattern.
 

## Decision
We will use repository pattern

## Consequences

By using the repository pattern we will achieve 
* Isolate the database code, it helps in following the recommendation in the chosen clean architecture 
* Domain Driven-Design is a way to design systems, and it suggests aggregation through the aggregate root.
* In case of reads when we are using a micro-ORM and sometimes may be writing sql code, it will bypass EFCore completely, and will keep the complex query in one place
* In some usecase where the system is not much complex, DBContext can be used directly intead of having repositories 

 - [Documentation](../documentation/code-structure/Repository-pattern.md)