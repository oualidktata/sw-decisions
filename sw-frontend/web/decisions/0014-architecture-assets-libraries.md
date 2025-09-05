# 14. Architecture: Assets libraries

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|05/08/2022|O.Ktata|
|Accepted|05/08/2022|Synergy|

## Context

After setting up the workspace, it's time for the architecture. We need to define the layers, the components and all the relationships. We need to define the principles and rules that will be enforced by the architecture so that developers understand the rationale behind each decision in order to not deviate from the agreed upon vision.


## Decision

### 1-Strategic DDD
#### 1.1-Identifying bounded contexts
We will use Strategic DDD to identify bounded context. In DDD the domain is the scope of the business problem that is trying to be solved through Software. A domain have multiple sub-domains. Everyone of these sub-domain has its own problems, language, and terminologies. A bounded context is merely a representation of a sub-domain in the solution's space. The main characteristic of sub-domain/bounded context is that they are loosely coupled. Identifying Sub-domains could be done using several heuristics: 

- **Organizational Structure**: different business units, different roles could indicate different sub-domains.
- **Vocabulary**: the ubiquitous language is one of the main tools used to identify sub-domains. When the language changes, it's more likely we are in another sub-domain.
- **Pivotal events**: Events are facts. A pivotal event is raised when the event indicates a completion of a given action or task.If the domain feels the need to notify this completion. It's more likely to notify other sub-domains that may continue the work on their end.

There are many methods and techniques that help with the strategic DDD. Event storming is one of the recommended techniques in this regard. These approaches are out of scope for now.
#### 1.2-Exposing public API
Strategic design defines a principle called “**Open Host Service**”. This principle protects the level of isolation between bounded contexts by proposing an **API that exposes only selected aspects** for other domains. This API should be stable and backwards-compatible to prevent breaking other domains. Everything else is hidden behind this API and hence can be **changed easily**.

Every identified bounded context will have a file that exposes it's public API, this file is also called a Barrel.
A barrel, in Angular, is simply a module file which provides a centralized place for exporting components, interfaces, services etc. Then, in the main module (in our case it's a Shell module but usually it's the AppModule), we make all imports from the barrel file. 


### Feature libraries
Implement a use case with smart components. Smart components are use case specifics: search-user, order-product,etc.

Data-access will be designed following the reactive programming principles. It relies on facades to further decouple smart components from internal data stores and services.

### Onion architecture:
It's will be applied for each bounded context. It includes the usual layers: 
- Domain: entities of the domain.
- Application: facades and services that provide business logic.

- Infrastructure: underlying services that communicate with the BFF. Data coming from BFFs are view models tailored to the front-end application it supports.

### Push-based architecture-Reactive programming
- Optimized Data-Delivery
Long-lived streams allow us to deliver data at any future time. And with careful stream construction, we can optimize the delivery through each stream to only emit data when that specific data source has changed.
- Aggregate Data-Delivery
We can also dramatically simplify view layer complexity and re-rendering by aggregating our streams into a single output stream.
- Whenever any of the the individual streams (eg pagination$ users$, etc) emit values, the vm$ will re-emit an updated viewModel with current values.









## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.
