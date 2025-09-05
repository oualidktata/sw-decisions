# Solution structure (Clean Arch, DDD)

Date: 2022-05-10

Most enterprise applications with significant business and technical complexity are defined by multiple layers. The layers are a logical artifact, and are not related to the deployment of the service. They exist to help team manage the complexity in the code. Different layers (like the domain model layer versus the presentation layer, etc.) might have different types, which mandate translations between those types.


# Solution organization

Since the solution is based on clean architecture, there is clear separation of layers in the solution.Each layer is in a separate project to keep the logical separation. We want to design the system so that each layer communicates only with certain other layers. That approach may be easier to enforce if layers are implemented as different class libraries, because we can clearly identify what dependencies are set between libraries. The shared kernel contains libraries that can be used by other projects and can be referenced.

![object mapping](../../images/code-struct/multiProject.png)

## API Layer
The API Layer is the presentation layer for this service, that can be consumed by other services or from the orchestrator. Its acting as the interfacing between the service and the rest of the world.

## Domain Model Layer
This layer is responsible for representing business concepts, business information and business rules. It should also reflect the states about the business situation. This is the layer where the business is expressed. This is the heart of the business software.
The layer is being coded as a class library with the domain entities that capture data as well as behavior.

![object mapping](../../images/code-struct/domain-layer.png)

When tackling complexity, it is important to have a domain model controlled by aggregate roots that make sure that all the invariants and rules related to that group of entities (aggregate) are performed through a single entry-point or gate, the aggregate root.

## Application Layer

In Clean Architecture this is the layer that is at top of domain model layer. This layer defines the jobs the software is supposed to do and directs the domain objects to perform accordingly. It does not contain business rules or knowledge, but only coordinates tasks and delegates work to collaborations of domain objects in the next layer down. 

![object mapping](../../images/code-struct/application-layer.png)

The microservice's application layer is coded as a class library. It includes queries if using a CQRS approach, commands accepted by the microservice, and even the event-driven communication between microservices (integration events). It delegates the execution of business rules to the domain model classes themselves (aggregate roots and domain entities), which will ultimately update the data within those domain entities.
This includes Interfaces and DTOs for cross cutting concerns. Authorization operations, requirements and handlers implementation is also part of this layer. 

## Infrastructure Layer
The infrastructure layer is how the data that is initially held in domain entities (in memory) is persisted in databases or another persistent store. This layer contains details, concrete implementations for repositories, event store, service bus implementations etc. This contains the "how" the system should do what is supposed to do. 

![object mapping](../../images/code-struct/infrastructure-layer.png)

## Shared Kernel

This directory is a logical separation of code that can be used by other layers. There are class libraries that can be used by any service in any required layer.
The shared kernel holds service implementation for cross-cutting concerns such as user management, authentication, authorization, service bus, localization, secret management, observability and common practices for data persistence.

![object mapping](../../images/code-struct/shared-kernel.png)

# Dependencies between layers in service

Domain entities should not have any direct dependency (like deriving from a base class) on any data access infrastructure framework like Entity Framework Core or NHibernate. Ideally, domain entities should not derive from or implement any type defined in any infrastructure framework.
The Application layer depends on Domain and Infrastructure, Infrastructure depends on Domain, but Domain does not depend on any other layer.

Most modern ORM frameworks like Entity Framework Core allow this approach, so that your domain model classes are not coupled to the infrastructure.

![object mapping](../../images/code-struct/layers.png)

# Lightweight Solution organization

Implementing a simpler data-driven microservice in a simpler way, still the DDD approach can be followed. The project as a whole is a single project, but the code with in the project is organized to provide a separation of DDD layers.
The directory Domain Model Layer will contain the code related to domain in the same way as its in multiproject solution. Similarly the application and infrastructure directories contains the code files related to those layers.
This approach does not provide the de-coupling and flexibility as of the real implementation. But it organizes the code, which is more convenient for other team members to understand and trace.
![object mapping](../../images/code-struct/singleProject.png)

# Directory Structure

Below given image describes how the solution for any service looks like.
Each microservice will have (API, Domain, Application, Infrastructure) projects. The projects will have unit tests projects besides them. 

![object mapping](../../images/code-struct/Folders.png)


## Resources
[1] https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/ddd-oriented-microservice
[2] https://docs.microsoft.com/en-us/dotnet/architecture/microservices/multi-container-microservice-net-applications/microservice-application-design
[3] https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/domain-events-design-implementation
[4] https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/net-core-microservice-domain-model
[5] https://github.com/ardalis/CleanArchitecture


