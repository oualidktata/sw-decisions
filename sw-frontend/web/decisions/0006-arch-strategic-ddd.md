# 06. Architecture: Strategic DDD to identify and isolate sub-domains

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|02/08/2022|O.Ktata|
|Accepted|02/08/2022|Synergy|

## Context

### 1-Identifying Subdomains and bounded Context
An important aspect of Strategic Design is that each domain is **modeled separately**. Each model is only valid for a specific area. DDD calls this area the bounded context when it comes to define a solution. Put simply, a specific model makes sense only on that specific bounded context.  Beyond these borders there is a different perspective to the same concepts. The Ubiquitous language used in each domain is very effective at drawing the borders between contexts. 
This is the key for **decoupling domains** from each other [2]. 

### 2-Exposing public API
Strategic design is all about identifying loosely-coupled sub-domains. But how loosely coupled domains do communicate with each other when needed?

Strategic design define a principle called “**Open Host Service**”(OHS) that protects the level of isolation between bounded contexts by proposing an **API that exposes only selected aspects** for other domains. This API should be stable and backwards-compatible to prevent breaking other domains. Everything else is hidden behind this API and hence can be **changed easily** [2].

Every identified bounded context will have a file that exposes it's public API, this file is also called a Barrel.
A barrel, in Angular, is simply a module file which provides a centralized place for exporting components, interfaces, services etc. Then, in the main module (in our case it's a Shell module but usually it's the AppModule), we make all imports from the barrel file. 

## Decision

- Clearly separate domains based on the ubiquitous domain language thus allowing autonomous teams to work in isolation.
- Apply Open Host service pattern using Barrels.

For the implementation details, please refer to the supporting documentation.
## Consequences

- Team autonomy
- Clear separation of concerns
- Loosely-coupled modules
- Easily convertible to MFE
- Better encapsulation and easier access constraints implementation.
 
## Resources
[1] [High-level architecture](../documentation/architecture-part-1-high-level-architecture.md)
[2] [Strategic DDD](../documentation/architecture-part-2-DDD.md)


