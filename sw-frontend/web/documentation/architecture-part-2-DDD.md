This documentation supports this ADR
|ADR|Name|
|---|---|
|[ADR-0006](../decisions/0006-arch-strategic-ddd.md)|Strategic DDD to identify and isolate sub-domains|
# 1-Strategic DDD
In this section, we will be only introducing DDD principles, concepts and practices that are relevant to our front-end architecture.

In a nutshell, DDD is a software design approach that aims at modeling software based on inputs from domain experts. The main principle of DDD is to include the **ubiquitous language** of the domain in the software design and isolate software components based on domain boundaries.

DDD come with two phases: strategic design and tactical design.The later recommends concrete concepts and design patterns such as factories, repositories, and entities. In the other hand, strategic design deals with subdividing a huge system into smaller, decoupled, and less complex parts. The DDD approach provides the tools that will help define an architecture for a large scale systems that can evolve over time [1].

## 1.1-Identifying bounded contexts
We will use Strategic DDD to identify bounded context. In DDD the domain is the scope of the business problem that is trying to be solved through Software. A domain have multiple sub-domains. Everyone of these sub-domain has its own problems, language, and terminologies. A bounded context is merely a representation of a sub-domain in the solution's space. The main characteristic of sub-domain/bounded context is that they are loosely coupled. Identifying Sub-domains could be done using several heuristics: 

- **Organizational Structure**: different business units, different roles could indicate different sub-domains.
- **Vocabulary**: the ubiquitous language is one of the main tools used to identify sub-domains. When the language changes, it's more likely we are in another sub-domain.
- **Pivotal events**: Events are facts. A pivotal event is raised when the event indicates a completion of a given action or task.If the domain feels the need to notify this completion. It's more likely to notify other sub-domains that may continue the work on their end [2].

There are many methods and techniques that help with the strategic DDD. Event storming is one of the recommended techniques in this regard. These approaches are out of scope for now [2].

Strategic design recognize the need to communicate/collaborate between bounded contexts. Approaches like "**separate ways**" allow for redundancy in order to reduce coupling. It's paramount to evaluate correctly the need to go "separate ways".

```
Rule to enforce: Do not try to DRY always. Redundancy is tolerated in order to reduce coupling.
```

## 1.2-Exposing public API
Strategic design is all about identifying loosely-coupled sub-domains. But how loosely coupled domains do communicate with each other when needed?

Strategic design define a principle called “**Open Host Service**” that protects the level of isolation between bounded contexts by proposing an **API that exposes only selected aspects** for other domains. This API should be stable and backwards-compatible to prevent breaking other domains. Everything else is hidden behind this API and hence can be **changed easily** [1][2].

Every identified bounded context will have a file that exposes it's public API, this file is also called a Barrel.
A barrel, in Angular, is simply a module file which provides a centralized place for exporting components, interfaces, services etc. Then, in the main module (in our case it's a Shell module but usually it's the AppModule), we make all imports from the barrel file. 

When it comes to Systems Of Records or Legacy systems this API is called the anti-corruption layer.“**Anti-Corruption Layer**” creates an isolating layer that provide clients with functionality in terms of their own domain model; the layer talks to other systems through its existing interface, requiring little or no modification to those systems.
```
Rule to enforce: Allow access between domains only through a well defined API (open/host service in DDD)
```

# Resources
[1] Enterprise Angular, 4th edition, Manfred Steyer https://www.angulararchitects.io/en/book/
[2] https://pubs.opengroup.org/architecture/o-aa-standard/DDD-strategic-patterns.html
[3] https://martinfowler.com/bliki/DomainDrivenDesign.html
