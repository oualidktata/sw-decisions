# 9. Solution Repository (monorepo - multirepo)

Date: 2022-04-18

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/04/18|S.Bhatti|
|Accepted|--- |Synergy|

## Context

In microservice architecture, each microservice is a self-contained, independently deployable and autonomous service. Following the clean architecture implementation through DDD approach there are multiple projects within each service. By looking the complexity of the code, code repositories should be managed through a pattern, whether to use single repo for the solution or to use mutiple repositories for the whole solution.

![repos](../images/code-struct/mono-vs-poly-repo.png)

## Decision

We decided to use poly repo to support back-end services.

## Consequences

Using polyrepo approach the team is getting benefits of:
- Control access, only the authorized team can change the code of a service, the other teams can have only read rights. In this way there are less chances of wrong code change due to less domain knowledge.
- Deployment cycle is straight forward, each micro service is independent in its deployment and can use the latest versions of libraries from the nuget packages.
- Since each team is responsible of its own service, it will be easy for team members to resolve the merging conflicts.
- There is no chance of hard coupling between the microservices, since each team is responsible of a different service and will using it through the SDK or external source.
- Due to smaller codebase the build time will also be smaller.
- Shared Kernel provides the shareable code between the teams that will be deployed to nuget package and the services will be using the nuget packages.

The polyrepo approach works well for bigger indepedent teams, following the set patterns of collaborations. Where it really make sense of separating teams according to services of distributed system and each team is responsible of its serivce. But in small project teams where same team members are working on all the services, polyrepo will slow down productivity.

## References

- [Documentation](../documentation/code-structure/monorepo-polyrepo.md)