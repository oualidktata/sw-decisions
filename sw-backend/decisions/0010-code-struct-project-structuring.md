# 10. Project Structuring following (Clean Architecture, DDD)

Date: 2022-04-13

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/04/18|S.Bhatti|
|Accepted|--- |Synergy|

## Context

With the use of clean architecture the application is much decoupled. The primary focus is on the core and logic of the domain. Since by adopting domain driven design we are able to clearly separate the business concepts into bounded contexts.
This is time when team needs to decide what the code structure should be that fullfill the recommendations of chosen desgin methodologies. 
There are different approaches to strcuture the solution derived from clean architecture.

## Decision

We will use a multiproject solution approach (separate folder for each service) that will have projects (API, Application, Domain and Infrastructure). The Solution will also have a sharedKernel project having all the common code that can be used and referenced by other services.

## Consequences

With the use of multiproject solution, the team is organizing the code very well. This helps us to avail all the benefits of DDD and clean architecture approach. The code is more testable, with clear separation of concern and decoupling. 
This enables the team to work on different part of the code without breaking others code. 
This also helps team to be more productive
With the inception of this organization, team can face few hurdles. Being a bigger organization unit, new team member can be lost in details, which can be mitigated with the help of proper guidance and consistency in organizing the code.


- [Documentation](../documentation/code-structure/solution-structure.md)
