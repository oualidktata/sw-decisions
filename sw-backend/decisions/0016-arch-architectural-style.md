# 16. Application Architecture

Date: 2022-04-21

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/04/21|S.Bhatti|
|Accepted|2022/07/26 |Synergy|

## Context

Good architecture is a key to building scalable, modular, maintainable applications. Different architectures may vary in their details, but they all have the same objectives which are Separation of concern. And they all try to achieve this Separation by dividing the application into layers.

Choosing the right architecture for the enterprise application keeping in mind the scalability, maintainability and modularity is the essential need. The software architecture should be intended to keep the code under control without all tidiness that spooks anyone from touching a code after the release.

## Decision

We decided to use clean architecture with domain driven desgin approach.

## Consequences
Using domain driven design we are able to clearly separate the business concepts into bounded contexts. That can lead to separate microservices, where each microservice becomes a separate unit providing the behavior and functionality of the domain. 

With the use of clean architecture the application is much decoupled. The primary focus is on the core and logic of the domain. This allows us to change the database without impacting the other layers of the application. The layers are more testable.  

If design principles are not followed it can result into a complex solution. If boundries of domain and subdomains are not defined properly that can lead to unnecessary complexity and coupling, which should be avoided.

- [Documentation](../documentation/arch-style/clean-arch.md)