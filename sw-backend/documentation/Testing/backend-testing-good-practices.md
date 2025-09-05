# Good practices

Date: 2022-04-08


## Characteristics of A Good Unit Test
Following are the properties of a good unit test:
**Fast:** Unit tests should run quickly since a project can have thousands of unit tests. Slow running unit tests can frustrate testers and take a long while to execute. Also, unit tests are run repeatedly, so developers might skip running them and deliver buggy code if they are slow.
**Reliable:** Reliable unit tests only fail if there is a bug in the underlying code, which is pretty obvious. But at times, tests fail even if there are no bugs in the source code due to a design flaw. For instance, a test passes when run one by one, but it fails when executing the whole test class or on the CI server. Also, unit tests should be reusable and help avoid repetitive work.
**Isolated:** Unit tests are run in isolation without any interdependencies and external dependencies (file system, database, etc.) or external environment factors.
**Self-checking:** Unit tests should automatically determine if they are passed or failed without any human intervention.
**Timely:** If a unit test code takes longer to write than the time taken for writing the code being tested, consider a more viable design. A good unit test is easy to write and not tightly coupled.
**Truly unit, not integration:** Unit tests can easily turn into integration tests if tested together with multiple other components. Unit tests are standalone and should not be influenced by external factors.

## Unit Test recommendations

* Unit tests should be fast, independent, repeatable, self-validating.
* Write unit tests before production code (e.g. Test-Driven Development or TDD).
    - You may not write production codes until you have written a failing unit test.
    -  You may not write more of a unit test than is sufficient to fail, and not compiling is failing
    -  You may not write more production code than is sufficient to pass the currently failing test.
* Split the unit test in 3 parts:
    -   Arrange: Part of the test where you prepare the input and dependencies for the tested method.
    -   Act: Part of the test where you call the tested method and do the process.
    -   Assert: Part of the test where you assert the output.
* Don't use value defined in arrange part as expected value in the assert part. We want deterministic result. If the arrange value is changed later, we want the unit test to fail and make the one making this change to rethink about the new expected value.
* Don't use dynamic values, such as DateTime.Now, Guid.NewGuid() or any auto-generated values that could make test sometime pass and other times crash. We want deterministic result that always pass.
* Define only needed values to make the test pass. If new production code needs to pass more parameters or new dependencies, make a clear distinction between values related to this test and values that are there only for other use cases.
    > **note**: Patterns like Builder or Factory patterns are good to use to express clearly this intent.
*   In assert always define the expected value first then the result value second. Make a distinction between stub and mock values in the arrange part to make obvious what is used to simulate an input or dependency VS what is used to check the output expected as a result of the tested method. (note: both stub and mock can be named fake. So if not sure, use fake)
*   The input to be used in a unit test should be the simplest possible in order to verify the behavior that you are currently testing.
* Naming variables in unit tests is as important, if not more important, than naming variables in production code. Unit tests should not contain magic strings.
*   When writing your unit tests avoid manual string concatenation and logical conditions such as if, while, for, switch, etc. Tests should focus on the expected end result instead of the implementation details.
* Only the public API of the class should be tested, not the implementation details. The private methods should only be tested through the public methods.
*   Avoid coupling tests with implementation details.
*   Sometimes, tests that start as unit tests end up as integration tests and make it difficult to isolate issues that occur, calls for more resources to run, and significantly affect the pace of application delivery. Therefore, a unit test and the system under test must abstain from external factors.
* Ensure that every test has its own setup and teardown mechanism. A test should not depend upon any other test.

**Note: Integration Test should be in a separate project**
## Naming Unit Tests
*   Use domain-specific language or terminology.
*   Use meaningful names.
*   Use a shared naming convention across the team 
*   Use names that a non-programmer would understand
*   Separate words with underscores.
### Microsoft approach
Based on official Microsoft guideline of Naming your tests 
*   The name of your test should consist of three parts:
    -   The name of the method being tested.
    -   The scenario under which it's being tested.
    -   The expected behavior when the scenario is invoked.
    > public void [TestedMethod]_ [Scenario]_[ExpectedBehavior]

    > **Good** `PlanDelivery_WithPastDate_IsInvalid()`
    > **Bad** `PlanDelivery_WithInvalidDate_ThrowException()`

### Non-rigid Naming Policy

* Start by rewriting the test name in plain English
    > `Delivery_with_invalid_date_should_be_considered_invalid()`
*   Be more specific about the invalid date to reflect knowledge in the test's name
    >   `Delivery_with_past_date_should_be_considered_invalid()`
*   We can get rid of the word considered without any loss of meaning
    >  ` Delivery_with_past_date_should_be_invalid()`
*   The wording should be is another common anti-pattern. A test is a single, atomic fact about a unit of behaviour. There's no place for a wish or a desire when stating a fact. Name the test accordingly. Replace should be with is:
    >   `Delivery_with_past_date_is_invalid()`
*   And finally, there's no need to avoid basic English grammar. Articles help the test read flawlessly. Add the article a to the test's name:
    >  ` Delivery_with_a_past_date_is_invalid()`

**Note:** We will be following microsoft way of naming the unit tests

## Unit test scenarios
There are some typical use cases. We will try to cover all of them and give examples.

In our example we will use:

*   input: the income data
*   dependencies: oftenly injected with DI, but we will consider the internal state as if they are internal dependencies.
*   input dependencies: dependencies that act as an input
*   output: the outcome data
*   tested unit: oftenly a method, but can be a class as well.
> note: in all unit testing scenarios, keep in mind that in the unit test, we want to control all incoming input or dependencies and assert outcome. Make sure that production code is wrapped in the unit test in a way that it can be deterministic.

### Simple method
There are examples of simple methods that could be unit tested.
*   Utility/Utils/Helper/Extension method : string.Capitalize(this string value)
*   Rate conversion method : CurrencyConverter.ConvertToUsd(cad)

### Simple method without dependency usage
This kind of test is the simplest to test. The method is called with input, a process is done without using any other dependencies and return output.

![](../../images/testing/simple-method-without-dependency.PNG)

*   input is used by the tested method
*   method don't use any dependency
*   method return output
**Production code:**
```
 public static class StringExtension
 {
    public static string Capitalize(this string value)
    {
        // logic to respect business rules
        // ...
        return output;
    }
 }
```
**Unit test:**

```
 [Trait("Category", "simple-method")]
 [Fact]
 public void First_letter_of_each_words_is_a_capital_letter()
 {
    // Arrange
    string text = "my test should capitalize";

    // Act
    var resultText = text.Capitalize();

    // Assert
    string expectedText = "My Test Should Capitalize";
    Assert.Equal(expectedText, resultText);
 }
```
```
 [Trait("Category", "simple-method")]
 [Theory]
 [InlineData(null, null)]
 [InlineData("", "")]
 public void An_empty_text_do_not_throw_an_error(string text, string expectedText)
 {
    // Arrange

   // Act
    var resultText = text.Capitalize();

   // Assert
    Assert.Equal(expectedText, resultText);
 }
 ```
In this case, the unit test should only test possible combinations of inputs and assert expected output values.

### Simple method with dependency usage
This kind of test is still simple to test if dependencies are abstract (and stubbable). The method is called with input, a process is done using dependencies and return the output.

![](../../images/testing/simple-method-dependency.PNG)

*   input is used by the tested method
*   method use any dependency that modifies the method behaviour
*   method returns output

**Production code:**
```
   public class CurrencyConverter
   {
    public CurrencyConverter(ICurrencyConversionRateProvider currencyConversionRateProvider)
    {
        CurrencyConversionRateProvider = currencyConversionRateProvider;
    }

    public ICurrencyConversionRateProvider CurrencyConversionRateProvider { get; }

    public double ConvertTo(string sourceCurrency, double value, string destinationCurrency)
    {
        return value * CurrencyConversionRateProvider.GetConversionRate(sourceCurrency, destinationCurrency);
    }
 }
```
**Unit test:**
```
 public class CurrencyConverterTests
 {
    public CurrencyConverterTests()
    {
        var currencyConversionRates = new List<CurrencyConversionRate>
        {
            new ("usd", "cad", 2),
            new ("cad", "usd", 0.5),
        };

        var currencyConversionRateProvider = new CurrencyConversionRateProvider(currencyConversionRates);

        CurrencyConverter = new CurrencyConverter(currencyConversionRateProvider);
    }

    public CurrencyConverter CurrencyConverter { get; private set; }

    [Trait("Category", "simple-method")]
    [Fact(DisplayName = "Converting 1 U.S. dollar to Canadian dollar with a conversion rate of 2, should be 2 Canadian dollar")]
    public void Converting_1_usd_to_cad_with_a_conversion_rate_of_2_should_be_2_cad()
    {
        // Arrange
        double usd = 1;

        // Act
        double cad = CurrencyConverter.ConvertTo("usd", usd, "cad");

       // Assert
        double expectedCad = 2;
        Assert.Equal(expectedCad, cad);
    }

    [Trait("Category", "simple-method")]
    [Fact]
    public void Converting_2_cad_to_usd_with_a_conversion_rate_of_dot_5_should_be_1_usd()
    {
        // Arrange
        double cad = 2;

        // Act
        double usd = CurrencyConverter.ConvertTo("cad", cad, "usd");

        // Assert
        double expectedUsd = 1;
        Assert.Equal(expectedUsd, usd);
    }

    [Trait("Category", "simple-method")]
    [Fact]
    public void Converting_a_currency_to_an_undefined_currency_should_raise_a_currency_not_found_exception()
    {
        // Arrange
        double cad = 2;

        // Act
        Action error = () => CurrencyConverter.ConvertTo("cad", cad, "undefined");

        // Assert
        Assert.Throws<CurrencyNotFoundException>(error);
    }
 }
 ```
In this case, the unit test is similar to one without dependency usage. The dependency should be deterministic (stubbed) and the unit tests should consider dependency in the possible combinations of inputs and assert expected output values.

### Command-like methods
There are examples of Command-like methods that could be unit tested.


*   Process method : order.PlaceOrder()
*   State change method : builder.SetTitle(input)

**Command-like method with no input & no output**

This kind of test is used when there is no input nor output. The method is only calling an internal dependency.

![](../../images/testing/command-method-no-input-no-output.PNG)

*   tested method is called
*   in the method, an internal dependency is called
*   no output returned

**Production code:**
```
 public class Order
 {
    public Order(IEmailNotifier emailNotifier, string email, double price, string currency)
    {
        EmailNotifier = emailNotifier;
        Email = email;
        Price = price;
        Currency = currency;
    }

    public IEmailNotifier EmailNotifier { get; }
    public string Email { get; }
    public double Price { get; }
    public string Currency { get; }

    public void PlaceOrder()
    {
        EmailNotifier.SendNotification(Email);
    }
}
```
**Unit test:**
```
 [Trait("Category", "command-like-method")]
 [Fact]
 // Note: In a microservice architechture, using a MessageQueue, this kind of action won't be done that way.
 // This is only an example
 public void Placed_order_send_an_email_notification_to_client()
 {
    // Arrange
    var mockEmailNotifier = new FakeEmailNotifier();
    var order = new Order(mockEmailNotifier, "client@email.com", 10, "usd");

    // Act
    order.PlaceOrder();

    // Assert
    string expectedNotificationEmail = "client@email.com";
    Assert.Equal(expectedNotificationEmail, mockEmailNotifier.SendNotificationEmail);
 }

 // Stubbing class to help assert the test
 public class FakeEmailNotifier : IEmailNotifier
 {
    public string SendNotificationEmail { get; private set; }

    public void SendNotification(string email)
    {
        SendNotificationEmail = email;
    }
 }
```
 In this case, the unit test should mock the Dependency and verify that this dependency was called with expected values.

note: It is possible in that case that some dependency act as input and some dependencies are called as a result. In that case we should think about possible combinations as if dependencies are inputs.

**Command-like method with no output**

This kind of test is used when there is input but no output. The method result is only calling an internal dependency.

![](../../images/testing/command-method-no-output.PNG)

*   input is used by the tested method
*   in the method, an internal dependency is called
*   no output returned

**Production code:**
```
 public class ReportBuilder
 {
    public string Title { get; private set; }

    public void SetTitle(string title)
    {
        Title = title;
    }

    public Report Build()
    {
        return new Report(Title);
    }
 }
```
**Unit test:**
```
 [Trait("Category", "command-like-method")]
 [Fact]
 public void Build_a_report_should_have_the_same_title_as_defined()
 {
    // Arrange
    string title = "report title";
    var builder = new ReportBuilder();

    // Act
    builder.SetTitle(title);

    // Assert
    string expectedTitle = "report title";
    Assert.Equal(expectedTitle, builder.Title);
 }
 ```
In this case, the unit test should mock the Dependency and verify that this dependency was called with expected values.

note: It is possible in that case that some dependency act as input and some dependencies are called as a result. In that case we should think about possible combinations as if dependencies are inputs.

**Query-like methods**
There are examples of Query-like methods that could be unit tested.

* Get a list of my activities : Calendar.GetMyActivities()
* Query with filters : PrimeNumberGenerator.GetPrimeNumbers(maxCount)

 **Query-like method with no input**
This kind of test is used when there is no input but there is an output. The method returning result from query.
![](../../images/testing/query-method-no-input.PNG)
*   no input is used by the tested method
*   in the method, an internal dependency is called to build the result
*   output return the result

**Production code:**
```
 public class Calendar
 {
    public Calendar(ICalendarRepo calendarRepo, string userId)
    {
        CalendarRepo = calendarRepo;
        UserId = userId;
    }

    private ICalendarRepo CalendarRepo { get; }
    public string UserId { get; }

    public IEnumerable<CalendarActivity> GetMyActivities()
    {
        return CalendarRepo.GetAllActivitiesFromUser(UserId);
    }
 }
```
**Unit test:**
```
 [Trait("Category", "query-like-method")]
 [Fact]
 public void Get_my_activities_do_not_include_other_users_activities()
 {
    // Arrange
    var calendarActivities = new CalendarActivity[]
    {
        new ("abc", DateTime.Parse("2022-01-21"), TimeSpan.Parse("09:58")),
        new ("abc", DateTime.Parse("2022-01-22"), TimeSpan.Parse("10:59")),
        new ("def", DateTime.Parse("2022-01-23"), TimeSpan.Parse("11:00")),
        new ("def", DateTime.Parse("2022-01-24"), TimeSpan.Parse("12:01")),
        new ("ghi", DateTime.Parse("2022-01-25"), TimeSpan.Parse("13:02")),
        new ("ghi", DateTime.Parse("2022-01-26"), TimeSpan.Parse("14:03")),
    };

    var currentUserId = "abc";
    var fakeRepo = new FakeCalendarRepo(calendarActivities);
    var calendar = new Calendar(fakeRepo, currentUserId);

    // Act
    var myActivitiesResult = calendar.GetMyActivities();

    // Assert
    var expectedActivities = new CalendarActivity[]
    {
        new ("abc", DateTime.Parse("2022-01-21"), TimeSpan.Parse("09:58")),
        new ("abc", DateTime.Parse("2022-01-22"), TimeSpan.Parse("10:59")),
    };
    Assert.Equal(expectedActivities, myActivitiesResult);
 }

 // FakeCalendarRepo to stub the dependency
 public class FakeCalendarRepo : ICalendarRepo
 {
    public FakeCalendarRepo(IEnumerable<CalendarActivity> calendarActivities)
    {
        CalendarActivities = calendarActivities;
    }

    private IEnumerable<CalendarActivity> CalendarActivities { get; }

    public IEnumerable<CalendarActivity> GetAllActivitiesFromUser(string userId)
    {
        return CalendarActivities.Where(a => a.UserId == userId).ToArray();
    }
 }
```
In this case, the unit test should stub the Dependency and assert that the output return expected values.

**Query-like method with filter-like inputs**
This kind of test is used when there is no input but there is an output. The method returning result from query.

![](../../images/testing/query-method-filter-output.PNG)
*   no input is used by the tested method
*   in the method, an internal dependency is called to build the result
*   output return the result

**Production code:**
```
 public class PrimeNumberGenerator
 {
    public int[] GetPrimeNumbers(int maxCount)
    {
        // logic here to compute prime numbers until maxCount
        return primeNumbers;
    }
 }
```
**Unit test:**
```
 [Trait("Category", "query-like-method")]
 [Fact]
 public void First_10_prime_numbers_should_be_2_3_5_7_11_13_17_19_23_29()
 {
   // Arrange
    var primeNumberGenerator = new PrimeNumberGenerator();

    // Act
    var primeNumbers = primeNumberGenerator.GetPrimeNumbers(maxCount: 10);>
    // Assert
    var expectedNumbers = new[] { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 };
    Assert.Equal(expectedNumbers, primeNumbers);
 }
```
In this case, the unit test should stub the Dependency and assert that the output return expected values.

>   note: In that scenario, if the inputs are not used as filter for the query, it is a possible code smell. If the inputs are used as a flag to choose a different path or change behaviour, the method should probably be written another way. e.g. use strategy pattern with inheritance or bring the branching at application level (process level) in a command-like method or class such as a facade.

## Developer Checklist
Please ensure the you have considered all the recommendations while writing unit tests.
|No.|Recommendations||
|--|--|--|
|1|Did you apply TDD practices? (Write test before writing the code)|✅|
|2|Did you write tests for failing scenarios (where test should fail)?|✅|
|3|Are the names of your tests following KEBAB case?|✅|
|4|Are the names of your tests representing (TestedMethod]_ [Scenario]_[ExpectedBehavior])?|✅|
|5|Did you arrange your test in 3 actions (Arrange, Act, Assert)?|✅|
|6|Did you use the simplest possible input in order to verify the behavior in test?|✅|
|7|Did you avoid magic strings in your test code?|✅|
|8|Did you name the variables representing the purpose of their use in your test?|✅|
|9|Did you avoid logical conditions in your test?|✅|
|10|Did you use helper method to setup and teardown code?|✅|
|11|Did you use single "ACT" per test to ensure the test is focussed for a single case?|✅|
|12|Are you focussing public methods for test and avoiding to write tests for private methods?|✅|
|13|Did you ensure the tests are not interdependent?|✅|
|14|Are you using bogus library for fake data generation for test?|✅|
|15|Are you using Moq for mocking objects?|✅|
|16|Are you using fluent assertions library for asserting?|✅|

## References
[1]https://www.simform.com/blog/unit-testing-best-practices/#unittesting
[2]https://docs.microsoft.com/en-us/dotnet/core/testing/unit-testing-best-practices
[3] https://www.partech.nl/nl/publicaties/2020/03/10-unit-testing-best-practices
[4] https://www.toptal.com/qa/how-to-write-testable-code-and-why-it-matters
[5]https://www.educative.io/blog/unit-testing-best-practices-overview