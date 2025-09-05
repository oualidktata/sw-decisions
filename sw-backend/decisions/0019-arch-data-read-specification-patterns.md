# 19. Specification Pattern

Date: 2022-05-24

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/06/30|S.Bhatti|
|Accepted|--- |Synergy|

## Context

In enterprise applications there are lot of data reads or queries running to fetch data from the system for the frontend. In a previous ADR we have seen the use of repository pattern. Using repositories for fetching data from the data store emerged the need of many different functions depending upon the front-end requirements. Everytime there is a different dataset required by the application the repository will provide a new function encapsulating the filtering and grouping of the required data. Manytimes its the order of the data that is required to be changed.
While designing the system we need to think how easily we can deal with such requirements without modifying the repositories a lot, and without making fat repository classes.
**Specification pattern** is a pattern that allows us to encapsulate some piece of domain knowledge into a single unit called specification and reuse it in a different part of code base. These specifications can be recombined by chaining the specifications together to fullfill any complex requirement.

## Decision

We will not use specification pattern for queries. For business rule validation we will use validation inside the domain implementation.

## Consequences

By not using specification pattern we are relying on our queries to be specific to the task to execute. CQRS encourages to have separate models for reads and writes. Which contradicts with specification pattern, that focuses on having single model and DRY principle.

* It will be easy to understand the code flow and the implementation.
* Less number of files resulting lesser confusion in understanding the application flow
* The domain logic is at central place, its not distributed in number of files/classes.

By not using specification pattern, there is chance of violating DRY (don't repeat yourself) principle, since we may have same logic in query and same in some validation rule.  


 - [Documentation](../documentation/arch-style/Specification-pattern.md)