# 09. Architecture: Push-based driven architecture
## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|02/08/2022|O.Ktata|
|Accepted|02/08/2022|Synergy|

## Context

Reactive programming is a type of declarative programming. It's a design paradigm that relies on asynchronous programming logic to handle real-time updates to otherwise static content. Reactive programming creates software that responds to events rather than solicits inputs from users[1].

In angular, reactive programming means heavy reliance on streams more specifically RxJS streams. This library provides all we need to manipulate data streams, from subscribing to streams to receive data and combining streams with high order functions[1] [2].

A Push-based approach means that data will be always available through streams. To consume it, components needs to subscribe to it.

## Decision

We decided to use a push-based approach powered by RxJS streams in order to provide components with the underlying data.

## Consequences
A push-based architecture allows for:
- More intuitive User experience because of the reaction to input changes.

- Reduction of imperative logic used in the view layer[1].
- Optimized Data-Delivery: Long-lived streams allow us to deliver data at any future time. And with careful stream construction, we can optimize the delivery through each stream to only emit data when that specific data source has changed [1] [2].

- Aggregate Data-Delivery: We can also dramatically simplify view layer complexity and re-rendering by aggregating our streams into a single output stream [1].

- Paradigm shift (counter-intuitive): Developers needs to understand the principles of reactive programming in order to design efficient and resilient applications.
## Related 
[ADR-0010](0010-arch-facade-pattern.md))
## Resources
[1] https://thomasburlesonia.medium.com/push-based-architectures-with-rxjs-81b327d7c32d

[2] https://nerd-corner.com/how-to-build-a-push-based-architecture-in-angular-facade-design-pattern/

[3] [Push-based architecture](../documentation/architecture-part-5-push-based-architecture.md)

[4] [Facade pattern](../documentation/architecture-part-6-facade-pattern.md)
