# 64. testing-Improve integration testing using Consumer Driven Contracts using Pact

Date: 2022-01-28

## Status

Accepted

## Context
Contract testing is a technique for testing an integration point by checking each application in isolation to ensure the messages it sends or receives conform to a shared understanding that is documented in a "contract".

For applications that communicate via HTTP, these "messages" would be the HTTP request and response, and for an application that used queues, this would be the message that goes on the queue.

![CDC Overview](../images/testing/cdc-overview.png)
**When would I use contract testing?**
Contract testing is immediately applicable anywhere where you have two services that need to communicate - such as an API client and a web front-end. Although a single client and a single service is a common use case, contract testing really shines in an environment with many services (as is common for a microservice architecture). Having well-formed contract tests makes it easy for developers to avoid version hell. Contract testing is the killer app for microservice development and deployment.

![integration endpoints](../images/testing/cdc-integration-endpoints.png)

**Tools**
Pact is a code-first consumer-driven contract testing tool, and is generally used by developers and testers who code. The contract is generated during the execution of the automated consumer tests. A major advantage of this pattern is that only parts of the communication that are actually used by the consumer(s) get tested. This in turn means that any provider behavior not used by current consumers is free to change without breaking tests.

Unlike a schema or specification (eg. OAS), which is a static artefact that describes all possible states of a resource, a Pact contract is enforced by executing a collection of test cases, each of which describes a single concrete request/response pair - Pact is, in effect, "contract by example". Read more on the difference between schema testing and contract testing.

## Decision
For the frontend, we decided to use Contract testing between the BFF and the Backend services.

A similar decision is recommended for the backend service between consumers and producers.

## Consequences
- This helps fulfill the partnership pattern from DDD by improving the collaboration between the backend's team and the frontend's team.
- Contract tests save development time by:
    - providing very fast feedback to developers and testers, and fast feedback loops speed up software delivery.
    - clearly identifying where the problem is when they fail
enabling test failures to be debugged locally on a developer's machine rather than having to rely on system logs.
    - reducing the amount of time spent on test failures caused by environmental issues rather than integration bugs
- Contract tests save compute time and resources by:
    - reducing the number of, or even eliminating, tests that need to run in a deployed environment
    - executing faster than the integration tests they replace
- Consumer driven contract tests save development time by:
    - ensuring that only the parts of the API that will actually be used get developed
Try keeping track of how long your team currently spends on:

- Building and maintaining your test environments
- Writing and executing integration tests
- Debugging integration tests failures
- Fixing flakey integration tests

## Resources
https://docs.pact.io/
## Related
point the decision to integration testing for the Backend