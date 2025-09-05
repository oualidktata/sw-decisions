# 2. Unit testing framework

Date: 2022-03-18

## Status


|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/03/10|M.Paquin|
|Accepted|2022/03/18|Synergy|


## Context

Unit testing is an automated software testing methodology using code to define a test. The goal is to test the smallest unit of code, typically a method inside a class. 

Unit testing has been around since year 2000 in the java world with the jUnit project and it has since expanded to many other platforms like .NET. Most professional software projects use unit tests to validate that a unit of code is doing what it is supposed to do and also make sure it continue to do so in the future when the code is modified (regression).

They are three main unit testing frameworks for the .NET platform:

- MSTest
    - Unit testing framework provided by Microsoft.
- NUnit
    - First popular unit testing framework for the .NET platform build by the community (open source).
- xUnit
    - Also open source, next generation of unit testing framework build by the main contributors of NUnit. Based on lessons learn from building and using NUnit.

Since xUnit is the most popular unit testing framework, it was chosen for a proof of concept (PoC) user story with the dev team for evaluation purposes. The results are quite positive. From the evaluation report:

> ## Critics about xUnit
>
> ### Pros
>
> * Well documented
> * Easy to use
> * All features needed to write different unit test scenarios
> * Exist since 2007 and still supported in 2022
>   * see [Announcing xUnit.net](https://jamesnewkirk.typepad.com/posts/2007/09/announcing-xuni.html)
>   * see [Why Did we Build xUnit 1.0?](https://xunit.net/docs/why-did-we-build-xunit-1.0)
> * Community use it more than any other unit testing framework
>   * xUnit [185.5M downloads / 103.1M current version - 2022-01-23](https://www.nuget.org/packages/xunit)
>   * NUnit [155.3M downloads / 8.5M current version - 2022-01-23](https://www.nuget.org/packages/NUnit/)
>   * MSTest.TestFramework [114.3M downloads / 546.7K current version - 2022-01-23](https://www.nuget.org/packages/MSTest.TestFramework/)
>
> ### Cons
>
> * xUnit use his own annotations that are different from the naming of other frameworks, such as NUnit or MsTest. (see this nice [annotation comparison](https://www.lambdatest.com/blog/nunit-vs-xunit-vs-mstest/#comparison)).
>
>   * Could be confusing at the beginning to understand how to setup/teardown a test if you come from other languages and don't know the IDisposable pattern from C#.
> 
>   * There is still a reason why xUnit don't use [Setup/TearDown] annotations. (see [xUnit - Lessons Learned](https://xunit.net/docs/why-did-we-build-xunit-1.0#lessons-learned))

For a more in-depth evaluation about xUnit, please see the [ERA xUnit evaluation report](https://dev.azure.com/PrattAndWhitneyCanada/DT%20LAB/_wiki/wikis/ERA%20Wiki/78/xunit-evaluation)

## Decision

We will use xUnit as the unit testing framework for .NET solutions.

## Consequences

By using xUnit:

- We are using the most active unit testing framework maintained and supported by a large community.
- We are using a framework that is built with extensibility at its core with the Theory attribute and the usage of the IComparer<T> interface for \*Equal\* and \*Range\* assertion methods.
- We can implement clearer tests since there are a lot fewer attributes required when using xUnit. For example

    - No need for an attribute to identify test class (TestFixture with NUnit, TestClass with MSTest)
    - There are no SetUp and Teardown methods, we use the C# language more naturally with the usage of constructors and IDispoable interface instead.

    Basically, there is less noise when using xUnit.
    
- Isolation is guaranteed because a new instance of the test class is instantiated for each test (Fact attribute).

## Resources

- [ERA xUnit evaluation report](https://dev.azure.com/PrattAndWhitneyCanada/DT%20LAB/_wiki/wikis/ERA%20Wiki/78/xunit-evaluation)
- [Announcing xUnit.net](https://jamesnewkirk.typepad.com/posts/2007/09/announcing-xuni.html)
- [Why Did we Build xUnit 1.0?](https://xunit.net/docs/why-did-we-build-xunit-1.0)
- [xUnit nuget stats: 185.5M downloads / 103.1M current version - 2022-01-23](https://www.nuget.org/packages/xunit)
- [NUnit nuget stats: 155.3M downloads / 8.5M current version - 2022-01-23](https://www.nuget.org/packages/NUnit/)
- [MSTest.TestFramework nuget stats: 114.3M downloads / 546.7K current version - 2022-01-23](https://www.nuget.org/packages/MSTest.TestFramework/)
- [annotation comparison](https://www.lambdatest.com/blog/nunit-vs-xunit-vs-mstest/#comparison)
- [xUnit - Lessons Learned](https://xunit.net/docs/why-did-we-build-xunit-1.0#lessons-learned)

