# 5. Assertion Library

Date: 2022-04-11

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/04/11|S.Bhatti|
|Accepted|2022/05/06 |Synergy|


## Context

For writing unit tests, the **AAA** (Arrange-Act-Assert) pattern has become almost a standard across the industry. It suggests that you should divide your test method into three sections: arrange, act and assert. The last part of this pattern is Assert where developer would simply check whether the expectations were met, in other words this is the result part of the unit test.

The testing framework provides assertion support, the assertion provided by the testing framework is not much explanatory. To cover this gap, there are many libraries available that allow the code to be easily read and followed. This also provides independence of the unit test framework. to help in writing easy to understand makes it easier for other developers to understand and contribute to the code base.

- **Fluent Assertions**
    - A very extensive set of extension methods that allow you to more naturally specify the expected outcome of a TDD or BDD-style unit tests.
- **Shouldly**
    - Shouldly is an assertion framework which focuses on giving great error messages when the assertion fails while being simple. 


## Decision

We will use Fluent Assertions.

## Consequences

With the use of assertion library, the unit test code is much unifrom, symmetric and more easily understandable.
- It allowed to write concise, easy-to-read and self-explanatory assertions
- The unit tests will be more readable and less error-prone
- The failure message provides much information of the test itself, that provides better understanding without debugging the unit test.

## License
Apache License 2.0

## References

- [Documentation](../documentation/Testing/Unit-Testing-library-selection-part-2.md)