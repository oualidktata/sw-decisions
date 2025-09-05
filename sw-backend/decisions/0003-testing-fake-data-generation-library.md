# 3. Fake data generation library

Date: 2022-03-31

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/03/31|S.Bhatti|
|Accepted|2022/05/06 |Synergy|

## Context

Unit tests has been accepted a good approach to test the functionality of the software systems. The unit tests are becoming bigger and complex with the complxity of the systems and the functions which are being tested. There are lot of challenges in preparing the right data for the unit test.
Its a good practice to prepare a unit test in 3 sections.
- **Arrange**:
    prepare the data for the test
- **Act:**
    Perform the unit test
- **Assert:**
    Verify the results with the expectations

There are different libraries available to help in preparing the data for the unit tests focusing the arrange part. Following are the two libraries that are being used widely by the .net community.

- **AutoFixture**
    - AutoFixture is an open source library for .NET, designed to minimize the 'Arrange' phase of unit tests in order to maximize maintainability. Its primary goal is to allow developers to focus on what is being tested rather than how to setup the test scenario, by making it easier to create object graphs containing test data.
- **Bogus**
    - Bogus is a library used to generate fake data in .NET. It uses fluent API to write rules for generating fake data. It has a lot of datasets available that we can reuse to generate test data.

## Decision

Bogus library will be used in unit tests.

## Consequences

With the use of Bogus the writing of Arrange part of unit test will become much easier. It will helps developer to create data of many types that can be used with the chosen framework Xunit and Moq library. This enables us to:
- Much reduced code for the arrange part of unit test
- Reduced amount of boiler plate test code for simple and complex types
- A cleaner unit test, separating the data creation part through the robust library

## License
The library will be used on build server, Bogus supports GNU General public license. 

## Reference 
[Documentation](../documentation/testing/unit-testing-library-selection-part-1.md)

