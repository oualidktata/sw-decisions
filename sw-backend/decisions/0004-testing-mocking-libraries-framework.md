# 4. Mocking framework

Date: 2022-04-01

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/04/01|S.Bhatti|
|Accepted|2022/05/06 |Synergy|

## Context

Mocking frameworks are used to generate replacement objects like Stubs and Mocks. Mocking framework complement unit testing frameworks by isolating dependencies. By isolating dependencies, they help unit testing process and help developers writing more focused and concise unit tests.
Mock objects have the same interface as the real objects they mimic allowing a client object to remain unaware of whether it is using real or mock object. An object under test may have dependencies on other complex objects. To isolate the behavior of the object you wanted to replace the other objects by mocks that simulate the behavior of the real objects. this is useful if the real objects are impractical to incorporate into the unit test.

Following are the main mocking frameworks for the .NET platform
- **Moq**
    - The most popular and friendly mocking library for .NET. It is the only mocking library for .NET developed from scratch to take full advantage of .NET Linq expression trees and lambda expressions, which makes it the most productive, type-safe and refactoring-friendly mocking library available. And it supports mocking interfaces as well as classes.
- **NMock**
    - NMock is a dynamic mock object library for .NET. Mock objects make it easier to test single components—often single classes—without relying on real implementations of all of the other components.
- **Nsubstitute**
    - NSubstitute is designed as a friendly substitute for .NET mocking libraries. NSubstitute is designed for Arrange-Act-Assert (AAA) testing, so you just need to arrange how it should work, then assert it received the calls you expected once you're done.

## Decision

Moq library has been chosen.

## Consequences

With the use of mocking library, it lets us define our behaviour very clearly, often inline with our tests, so the interaction is much clearer and more direct.
* It Greatly simplifies the creation of mock objects, objects that mimic the behavior of real objects in controlled ways
* It makes testing easier because it generates appropriate mocks/stubs, allowing developer to focus on testing the logic of code rather than on designing tests.
* It makes it easier to unit test more complicated objects without writing a lot of code.
* Creating mock object gives us the ability to control the behavior of those objects by setting their outcomes
* It greatly improves the speed of writing unit tests

## License
GNU General Public License

## References

- [Documentation](../documentation/Testing/Unit-Testing-library-selection-part-1.md)
