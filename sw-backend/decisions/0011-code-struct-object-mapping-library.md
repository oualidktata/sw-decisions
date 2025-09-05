# 11. Object mapper library ( autoMapper, mapster, agileMapper)

Date: 2022-04-13

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/04/18|S.Bhatti|
|Accepted|2022/08/04 |Synergy|

## Context

In an enterprise application mapping from one object to another object can occur in many palces, but mostly in the boundaries between layers, such as between UI/Domain layers or service/domain layers. Concerns of one layer often conflits with concerns in another, so object-object mapping leads to segregated models, where concerns of each layer can affect only types in that layer.
There are libraries available to do the mapping. 

## Decision

We decided to use mapster as a mapping library.

## Consequences

Solving the object to object mapping problem with a mapping library will make the life of a developer easier. Here are some direct benefits that are being achieved by using the chosen library:

* Not writing repetitive boring code
* Smaller, cleaner codebase
* Consistent naming of properties across codebase
* It is a strategy which is well adopted by developers

## License
MIT License (MIT)

## References

- [Documentation](../documentation/Code-structure/object-mapper-library.md)