# 6. Mocking Server Library for Service Level Testing

Date: 2022-04-04

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/04/05|S.Bhatti|
|Accepted|2022/05/13 |Synergy|


## Context

Service level tests validate the API surface of a microservice. They are the black-box tests of service behavior, via APIs, providing standalone functional validation of services. Since in microservice environment one microservice could be dependent upon other microservice(s), to ensure the functionality of a microservice, it should be tested independently. To provide this independence we can use mocking framework that can mimic the behavior of the called microservice.
Service level test will ensure:
- The microservice sends the expected requests to the used HTTP API.
- The microservice is working as expected when it receives an expected response from the HTTP API.

The mocking libraries evaluated for this purpose are wiremock.net and mockoon.

- **WireMock.net**
    - WireMock.Net  is a tool which mimics the behaviour of an HTTP API. It captures the HTTP requests and sends it to WireMock.Net  HTTP server, which is started and as a result, allows users to setup expectations, call the service and then verify its behaviour.
- **mockoon**
    - Mockoon is the easiest and quickest way to design and run mock REST APIs. Mockoon offers tons of features that makes API mocking a breeze. Mockoon is built with Electron and can be used on Windows (exe), Linux (deb, rpm, Appimage and Snap) and MacOS (dmg or brew). For development purposes, Mockoon has a friendly GUI.
## Decision

We will use Wiremock.net library.

## Consequences

Using the mock server library in testing, team will be able to check or isolate external dependencies and check the integration. The stubbed response from the mock server will let the tester to concentrate to focus the code within the service.
- This will help team to get faster reviews and bugs without depending the downstream APIs
- The service level tests can be written to test microservice independently 
- The tests can be executed automatically during the CI pipeline
- The mock server can be used during the development of a service, when the other dependant service is not ready and is in development.

Wiremock is not GUI based, so it could be little tricky to use in developing service which is dependant upon other (not ready) services. In such cases a GUI based mock server will be easy to run as it will be running as a separate server. 

## License
Apache License 2.0

## References

- [Documentation](../documentation/Testing/Unit-Testing-library-selection-part-2.md)