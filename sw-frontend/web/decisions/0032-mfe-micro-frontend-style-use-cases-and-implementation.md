# 32. mfe-micro-frontend architectural style use cases and implementation

Date: 2022-01-25

## Status

Accepted

## Context
An architectual style where independently deliverable frontend applications are composed into a greater whole.
A micro-frontend project exists when an application is supported by more than one independent front-end project that has the following characteristics:

* Is **composed** with other micro frontends to make up a user experience
* Is dedicated to a **unique concern** of the user experience
* Can be built and deployed in **isolation**
There are multiple ways to support micro-frontend where depending on the specific situation, you would choose the proper method.
Where your code lives and how it is divided should be based on your organizational structure, not on what frameworks you use.

## Decision

The change that we're proposing or have agreed to implement.

## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.

## Resources
https://martinfowler.com/articles/micro-frontends.html
