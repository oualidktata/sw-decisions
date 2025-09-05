# 12. Code Structuring - following (CQRS, MediatR)

Date: 2022-04-13

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/04/18|S.Bhatti|
|Accepted|--- |Synergy|

## Context

Clean architecture has been chosen as an architecture for the solution, so design of the system needs to use the recommendations of the clean architecture, following this and separating the solution into projects (API, Domain, Application and infrastructure) the structure of code how the request will be entertained is required. The other recommended patterns are CQRS and Mediator.

## Processing request for Query

1. When there is a request from any external source, it could be from frontend application, or internal gateway or orchestrator the API project's end point will receive the call.
2. The controller creates a query and push into mediatR pipeline.
3. The application layer if has implemented any pre-process behavior for the pipeline, those will be executed
4. The query handler will receive call from the pipeline, which will execute the query using the repository
5. The repositories contracts are defined in domain layer, and are referenced in application and infrastructure layers
6. The infrastructure layer implements repositories
7. It will be initiated and return the requested result to the query handler
8. The Application layer runs the post processing behaviors if any defined for the mediator pipeline
9. The response will be served to the requester through the API controller

![Mediator](../images/code-struct/ddd-reads.png)


## Processing request for Command

1. When there is a request from any external source, it could be from frontend application, or internal gateway or orchestrator the API project's controller will receive the call.
2. The controller creates a query and push into mediatR pipeline.
3. The application layer if has implemented any pre-process behavior(s) for the pipeline, those will be executed
4. The Command handler will receive call from the pipeline, which will execute the command using the repository and the aggregate
5. The repositories contracts are defined in domain layer, and are referenced in application and infrastructure layers
6. The infrastructure layer implements repositories
7. It will persist the entity
8. The application layer will publish the domain events 
9. Domain events will be handled in the application layer
10. There could be a need for raising an integration event, either from domain event handler or from the Command handler in the application handler.
11. If there is any integration event that will be handled by the integration event handler.
12. Considering intergation event to be sent out side the boundary of the domain, there Integration event service in shared-kernel.
13. Integration event service lies in infrastructure category of shared-kernel, and it deals with how to raise integration events and dispatch it.
14. The Application layer runs the post processing behaviors if any defined for the mediator pipeline
15. The response will be served to the requester through the API controller


![Mediator](../images/code-struct/ddd-write.png)

_flow of request when changing or adding data_


The application layer is managing the commands, queries separately. Its easy to find the related code by using this directory structure, the handlers contains the handlers of commands, queries, domain events and integration events.

![Mediator](../images/code-struct/application-folders.png)
## Decision

We will use pre-process and post-process bahviors, the domain events will be published through MediatR notifications. The directory structure will be followed to keep the declaration and handlers separately.

## Consequences

With the separation of commands and queries the scalability of the system increases.
* The queries can use completely different ORM than the commands
* The aggregate does not need to be used while querying since there should not be any state change.
* The complex logic of commands is separate and can easily be modified without impacting the querying.
* All the related events (domain, integration) provides the separation of concern and cleanliness when making any change.
* The API layer is de-coupled with the application layer, since its sending the commands and queries to the mediator pipeline.

Although the code is separated into directories and based upon the logical separation of application, new developer can lost into the details of having too many directories and files.
