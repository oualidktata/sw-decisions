# 7. Choose code coverage framework

Date: 2022-04-01

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/04/01|S.Bhatti|
|Accepted|2022/05/13 |Synergy|

## Context
The term coverage relates to code coverage and it normally applied to unit tests. Code coverage is a software testing metric that measures the degree to which the source code of a program is tested by a particular test suite.
With the adaption of unit test as an essential instrument and continuous delivery becoming the de facto standard, testing is changing fundamentally. In this situation code coverage tells which line of code does not have unit tests. If the code does not have unit test, it will not gain the benefits of unit testing and automated test execution will only be able to report based upon some parts of code. A program with high test coverage has more of its source code executed during testing, which suggests it has a lower chance of containing undetected software bugs compared to a program with low test coverage.

The usage of test coverage tools in the dotnet platform, by comparing the following libraries:
- **Coverlet**
    -  Coverlet is a cross platform code coverage framework for .NET, with support for line, branch and method coverage. It works with .NET Framework on Windows and .NET Core on all supported platforms. Coverlet is the default coverage tool for every .NET Core and >= .NET 5 applications.
- **OpenCover**
    -   Open cover is a code coverage tool for .NET 2 and above (WINDOWS OS only), support for 32 and 64 processes with both branch and sequence points. The author mentioned that he is putting OpenCover into archive mode, so its not being considered in race further.
- **AltCover**
    -   AltCover is a cross-platform coverage gathering and processing tool set for .net/.net core and Mono. As the name suggests, it's an alternative coverage approach.

## Decision

we will use coverlet for .net solutions.

## Consequences

By using the code coverage tool, team will get the benefits:

- Represents what parts of the codebase is covered by tests and what is not 
- Provides code coverage metrics
- Gives teams confidence in their tests, and increases the quality of your code
- Measures the effectiveness of tests
- Increases the chances of finding bugs
- Could lead to code refactoring and to have more cohesive code, that can be tested
- Aim for 100% code coverage could be difficult, team needs to assess the costs and benefits.
 
 This library is recommended for by default, but if the project wants to buy any paid tool, that can provide more details at development time, project team can use the chosen tool.
 

## Reference links

- [Documentation](../documentation/Testing/Unit-Testing-library-selection-part-2.md)
