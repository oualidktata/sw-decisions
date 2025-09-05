# Repositoy pattern and its use with EFCore

Date: 2022-05-20

# Repository Design Pattern

The Repository Design Pattern is used to create an abstraction layer between the data access layer and the business logic layer of the application. Following the clean architecture the infrastructure layer has implementation of the repository, while the domain layer provides the abstraction of repository that is being used by the application layer to communicate with the data access layer.

# Ef Core
Entity Framework (EF) Core is a lightweight, extensible, open source and cross-platform version of the popular Entity Framework data access technology. EF Core can serve as an object-relational mapper (O/RM), which:
- Enables .NET developers to work with a database using .NET objects.
- Eliminates the need for most of the data-access code that typically needs to be written.

## Why Repositories should be avoided

The argument against using repository pattern are:
* It **duplicates** what Entity Framework (EF) DbContext give you anyway
* Due to **abstraction over abstraction** hide a perfectly good framework behind a façade 
* A repository normally returns a IEnumerable /IQueryable result of one type, to get the information of other entities in relationship, normally lazy loading is used. Which is another round trip to the server. This **kills the performance** of the application.
* Since the repository is created near to the DB layer, the data returned may not be the exact what is required by the caller. Then we may need to adapt the output of repository and get the required data, instead it will more efficient if only query data that is required in first place. 

## Why Repositories should be used

Although EF Core is a capable and developer-friendly framework, it is not always advantageous to use DbContext directly in the application layer.

 * EF Core is able to work with widespread relational database systems. At that point, EF Core itself can be thought of as an abstraction. However, if you want to use a different persistence technology other than EF Core for various reasons, this may cause the entire application layer to change.
 * To avoid code repetition: It may be necessary to group the same data access operations under a class or method to avoid code duplication. When calling the same repository from different places in application layer.
 * Controlling the business needs through aggregate root following the DDD pattern. For example, the order details should only be interacted through order, this can be achieved through repository.
 * Data ‘modification/filter’ ‘before/after’ on ‘read/write’ operations: There may be a need to intervene in data reading and writing such as handling soft delete or auditing records.
* Isolating data access layer, The application layer should not be affected by changing data access technologies.
* Encourages the clear separation of concern of the layers in clean architecture

# CQRS and Use of Repository 

When using CQRS we are segregating commands from queries. Would it be same repository for both commands and queries and why.

Simply this represents the CQRS reads and writes.

![object mapping](../../images/code-struct/command-repo1.png)

When using the same repository for both query and commands, it looks like this.

![object mapping](../../images/code-struct/command-repo2.png)

We can think that there is no state change in case of queries, so then it means the aggregate should not be used here. Further it depends upon the query what data is required by the query, does not need to be the same as of the repository. Further more we may be using different ORM/micro-ORM considering the performance of the system. 
Considering this point we can think of separating the repository to Read-Repository and Write-Repository separating the concern here.


![object mapping](../../images/code-struct/command-repo3.png)

Here in this case both query and commands are being performed with the same Datastore, which could be different.

# Recommendations

* Repository pattern should be used considering the complexity of the system
* Queries will be using read-repository to keep the read code in isolation
* Read repository will be using the micro-ORM for performance reason
* Read repository will also remain separate from the application layer

## Resources
[1] (https://www.thereformedprogrammer.net/is-the-repository-pattern-useful-with-entity-framework-core/) 
[2] (https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/infrastructure-persistence-layer-implementation-entity-framework-core)
[3] (https://codewithmukesh.com/blog/repository-pattern-in-aspnet-core/)
[4] (https://medium.com/borda-technology/combining-repository-pattern-and-unit-of-work-using-entityframework-core-db5c2d9a19cd)
[5] (https://www.thecodebuzz.com/entity-framework-repository-implementation-efcore-net-core/)
[6] (https://dev.azure.com/PrattAndWhitneyCanada/DT%20LAB/_wiki/wikis/ERA%20Wiki/396/Repository-Pattern)
[7] (https://dev.azure.com/PrattAndWhitneyCanada/DT%20LAB/_wiki/wikis/ERA%20Wiki/398/Evaluate-EF-Core-as-ORM-using-Repository-pattern)