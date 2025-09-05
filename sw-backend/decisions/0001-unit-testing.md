

# 1. Unit Testing

Date: 2022-05-20

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|20/05/2022|Saif|
|Accepted||Synergy|

## Context

Unit testing is a type of testing in which one segregates the code into the smallest, testable units that can be logically isolated from the program. These units are then tested individually to check if each performs as expected. 
The ultimate purpose of unit testing in software engineering is to validate and compare the actual behavior with the expected behavior of the software components.
Unit test increases the quality of the code. Sometimes we face code hard to unit test, the unit test writer can test such code doing some hard coding just to pass the test but it does not meet the purpose of unit testing. We need some conventions to follow to make our tests more readable and more understandable within our team, and to provide consistent style of test writing.

## Decision

* We will use TDD practices. (Write test before writing the code).
* We will use use AAA (Arrange, Act, Assert) Pattern to arrange the test.
* We will write tests for passing and failing scenarios (where test should fail).
* We will use names of the tests representing (TestedMethod]_ [Scenario]_[ExpectedBehavior]).
* We will use the simplest possible input in order to verify the behavior in test.
* We will avoid magic strings in the test code.
* We will name the variables representing the purpose of their use in the test.
* we will avoid logical conditions in the tests.
* We will use helper method to setup and teardown code. This will be less confusing reading the test and sharing the state between tests. 
* We will not use multiple "ACT" in one test, instead we will use single "ACT" per test to ensure the test is focussed for a single case.
* We will focus public methods for test and will not write tests for private methods, considering its details and should be used through abstraction.
* We will ensure the tests are not interdependent.
* We will use bogus library for fake data generation for test writing.
* We will use Moq for mocking objects.
* We will use fluent assertions library for assert part.
## Consequences

By following the recommendations team will be able to have following benefits.
* Provides early, rapid and continous feedback in SDLC.
* Ensure quality standards and met before deploying the product
* It enables continuous testing in app modules without any hassles of dealing with external services or dependencies.
* Ensures developer code satisfaction and reliablity
* Consistency in unit test writing and easily understanding by the fellow team members

## Reference 
[Documentation](../documentation/testing/backend-testing-good-practices.md)