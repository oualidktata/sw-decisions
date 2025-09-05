# 35. mfe Cross-application communication strategies

Date: 2022-01-26

## Status

Accepted

## Context

One of the most common questions regarding micro frontends is how to let them talk to each other. In general, we recommend having them communicate as little as possible, as it often reintroduces the sort of inappropriate coupling that we're seeking to avoid in the first place.

That said, some level of cross-app communication is often needed. Custom events allow micro frontends to communicate indirectly, which is a good way to minimise direct coupling, though it does make it harder to determine and enforce the contract that exists between micro frontends. 

Alternatively, the React model of passing callbacks and data downwards (in this case downwards from the container application to the micro frontends) is also a good solution that makes the contract more explicit. A third alternative is to use the address bar as a communication mechanism
Whatever approach we choose, we want our micro frontends to communicate by sending messages or events to each other, and avoid having any shared state. Just like sharing a database across microservices, as soon as we share our data structures and domain models, we create massive amounts of coupling, and it becomes extremely difficult to make changes.

As with styling, there are several different approaches that can work well here. The most important thing is to think long and hard about what sort of coupling you're introducing, and how you'll maintain that contract over time. Just as with integration between microservices, you won't be able to make breaking changes to your integrations without having a coordinated upgrade process across different applications and teams.

You should also think about how you'll automatically verify that the integration does not break. Functional testing is one approach [0034-mfe-testing strategies](./0034-mfe-testing-strategies-for-micro-frontend.md), but we prefer to limit the number of functional tests we write due to the cost of implementing and maintaining them. Alternatively you could implement some form of **consumer-driven contracts**, so that each micro frontend can specify what it requires of other micro frontends, without needing to actually integrate and run them all in a browser together.
## Decision

The change that we're proposing or have agreed to implement.

## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.
## Resources
https://martinfowler.com/articles/micro-frontends.html