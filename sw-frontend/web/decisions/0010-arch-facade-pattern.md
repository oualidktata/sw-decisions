# 10. Architecture: Facade pattern in front of Smart component
## Status
|Status|Date|Validated by|
|------|----|------------|
|Proposed|02/08/2022|O.Ktata|
|Accepted|02/08/2022|Synergy|


## Context

With all the technologies and patterns that compose the application and infrastructure layer, it becomes essential to hide all that complexity to the smart components. This will enforce the Liskov substitution principle that allows for more flexible technological choices in the future.

The facade implementation that we propose has to be an Observable Based API.This means that the facade will fully support a push-based architecture based on RxJs.

## Decision

We will implement a push-based facade pattern with RxJs in front of our Smart components.

## Consequences
- When implementing the facade pattern, the code is much cleaner and the Liskov principle is very easy to implement in case we want to change the state management solution for instance.
  
- The facades will have observable properties and its methods will return observables. Using observables allows external consumers (eg view components) to get notifications whenever the state changes. This way consumers do not need to poll or guess if the state has changed.

## Related
[ADR-0009](0009-arch-push-based-architecture.md)


# Resources
[1](../documentation/architecture-part-6-facade-pattern.md)

[2](../documentation/architecture-part-1-high-level-architecture.md)

[3] https://thomasburlesonia.medium.com/push-based-architectures-with-rxjs-81b327d7c32d

[4] https://nerd-corner.com/how-to-build-a-push-based-architecture-in-angular-facade-design-pattern/
