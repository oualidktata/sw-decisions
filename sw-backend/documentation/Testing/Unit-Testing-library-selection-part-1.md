# Unit Testing

Date: 2022-04-08


## Fake Data Generation Libraries

### 1. AutoFixture
AutoFixture is an open source library for .NET designed to minimize the 'Arrange' phase of unit tests in order to maximize maintainability. Its primary goal is to allow developers to focus on what is being tested rather than how to setup the test scenario, by making it easier to create object graphs containing test data.

#### Key concepts
Constrained Non-Determinism Values are carefully generated to stay far away from any boundary conditions that may cause the SUT (System Under Test) to behave differently in each test run. Data stores may have constraints on the length of strings, so Constrained Non-Determinism dictates that you should pick the generating algorithm so that the string length always stays within (or exceeds, if that's what you want to test) the constraint. Guid.ToString always returns a string with the length of 36, which is fine for a large number of scenarios. A secondary benefit of Constrained Non-Determinism is that you don't have to pause to come up with values for Anonymous Variables when you are writing the test.

In a generic perspective, the AutoFixture library can be seen as a test tool that can be used to create test data for any type. With simple lines of code, you can create rich:

- Simple types
- Complex types
- Sequences
- Builders
- Data theories
- AutoMoq

#### Examples
 For primitive types like strings, numbers and booleans, AutoFixture has custom algorithms for value creation. Constrained Non-Determinism is used to create an anonymous string.
- **Strings:**

> `fixture.Create<string>(); //Output: GUID string`
- **Numbers:**
> //Note: all numeric types are supported
> fixture.Create<int>(); //Output: random number

The first numbers are generated within the range of [1, 255], as this is a set of values that is valid for all numeric data types. The smallest numeric data type in .NET is System.Byte, which fits in this range. When the first 255 integers have been used, numbers are subsequently picked from the range [256, 32767], which corresponds to the remaining positive numbers available for System.Int16. Thus, while numbers are still initially going to fall in the Equivalence set of small, positive integers they are no longer guaranteed to arrive in any order.

- **Complex objects:**
Taking into consideration the simple type data generation, AutoFixture has all it needs to return a properly initialized instance of a complex object.

> public record ComplexType(int Id, string Description, List<ComplexChildObj> Children);
> public record ComplexChildObj(string ChildDescription, double ChildNumber);
>
> fixture.Create<ComplexType>(); 
>
> //Output:
> //ComplexType: { Id = random number, Description = GUID string, Children = list with n ComplexChildObj instances }
> //ComplexChildObj: { ChildDescription = GUID string, ChildNumber = random number }

- **Interfaces:**
One can be interested in auto-generate interfaces based on specific or fake implementations. This can be achieved with AutoFixture by registering the interface type with the implementation type.

> public record ComplexTypeWithInterface(IInterface Interface)
>
> fixture.Register<IInterface>(() => new FakeInterface());
> fixture.Create<ComplexTypeWithInterface>();
This ability to create instances of almost arbitrarily complex types is a real time-saver. It also has the additional advantage that it hides all the irrelevant object creation code that the Test Fixture needs, but which isn't relevant for the test at hand.

- **Sequences:**
AutoFixture provides some convenient methods for creating and managing collections of anonymous data.

> fixture.CreateMany<string>() //Output: List of GUID strings
> fixture.CreateMany<ComplexType>() //Output: List of ComplexType instances with properties set to autofixture generated values
- Builders:
> fixture.Build<ComplexType>()
>    .With(c => c.Id, specificIdValue)
>    .Create();

> //Output: ComplexType with Id property set to specificIdValue and all the other properties set to  autofixture generated values 
By default, AutoFixture assigns anonymous values to all writable properties, but since they are writable, you can always explicitly give them different values if you care. The With() method lets you specify an expression that identifies a property, as well as the value that should be assigned to that property. When you do that, AutoFixture will never attempt to assign an anonymous value to that property, but will instead use the value you specified. You can also use the method Without() to specify a property that should not be assigned an anonymous value.

- **Data theories:**
AutoFixture provides a way to facilitate data injection in a unit test by using InlineAutoData and Data Theories (xUnit). With that functionality, you can create multiple sets of data to be used in the same unit test, facilitating development. To use the data injection feature in AutoFixture, it's necessary to use a specific library according to the test framework you're using. For xUnit, it's necessary to install the NuGet package AutoFixture.xUnit*. For tests using NUnit, install AutoFixture.NUnit*. The examples below will show the integration with xUnit.

One might want to have a specific type of data to be injected, but without hard constraints in its content. The AutoData attribute will inject a specific type of data, but with its content being completely generated by AutoFixture in the same fashion described in the previous examples.

> [Theory, AutoData]
> public void TestWithAutoData(string s, int number, ComplexType obj)
> {
>    /*
>        s = guid string
>        number = random number
>        obj = ComplexType with properties set to AutoFixture generated values
 >   */
>}
One can also use the InlineAutoData attribute to inject a specific type of data, but with its content being specified by the user. It's also possible to use InlineAutoData with specific data to be tested together alongside with auto generated data of auto-fixture.

> [Theory] // Autofixture will generate anonymous data for the parameters not specified in the inline.
> [InlineAutoData("test")]
>    public void DataTheory_WithInlineAutoData_ShouldExecuteWithAnonymousValues(
>        string inlineText, // data set in the attribute InlineAutoData, in this case, the value "test"
>        string generatedText // data generated by AutoFixture, in this case, a random GUID string
>    {
>        ...
>    }

- **AutoMoq:**
One of the interesting features of AutoFixture is the ability to extend it to become an auto-mocking container. Although AutoFixture has a great integration with one of the most popular mock libraries in dotnet Moq, auto-mocking with AutoFixture does not have to use Moq necessarily. It is possible to write an auto-mocking extension for a different dynamic mock library.

The example described in this topic will be focused on the AutoMoq extension integrated with Moq. In order to use the AutoMoq extension, you need to install the NuGet package AutoFixture.AutoMoq*.

Example of how to mock an interface (IInterface):

> [Fact]
> public void Create_WithComplexTypeWithInterface_ShouldCreateWithAutoMoq()
> {
>    // Arrange
>    var fixture = new Fixture();
>    // Set Auto-Mocking Container and automatically configure all the generated Test Doubles (Mocks)
>    // so that their members return values generated by AutoFixture.
>    fixture.Customize(new AutoMoqCustomization { ConfigureMembers = true });
>    // Automatically freeze the auto-mocked instance
>   var mapMock = fixture.Freeze<Mock<IInterface>>(); 
>    // Create object with the injection of a mock implementation of IInterface 
>    var sut = fixture.Create<ComplexTypeWithInterface>();
>   // Act
>   var result = sut.ExecuteInterface();
>    // Assert
>    result.Should().BeTrue();
>    mapMock.Verify(x => x.Execute());
> }

#### Critics
The AutoFixture library is very flexible and can be used in a wide range of scenarios. The data generation functionality can become a time saver in a day-to-day test development workflow and the integration with the big players of dotnet testing world (xUnit and Moq) it's a huge plus. Here is my personal opinion in the pros/cons of the AutoFixture library:

##### Pros:

*   It's a very flexible library. It's easy to extend it to support other frameworks and libraries.
*   Facilitates the development of unit tests, specially the Arrange part.
*   It's a great tool to generate data for unit tests.
*   The code is a lot cleaner and easier to read with it.
*   It's compatible with popular testing frameworks and libraries.

##### Cons
*   Most of the documentation content comes from articles published (many years ago) on the creator's personal blog.
*   Looking at the frequency history of the library code on github, it is possible to see that since 2019 the library has not been much worked on.
*   As for the day of this writing, the library has 33 issues + 16 pull requests opened on github. This leads me to think that there aren't many people currently looking at and taking care of the library assiduously.
*   The Constrained non-deterministic nature of the library is polemic and could become an anti-pattern if not implemented carefully, since it violates in a way one of the biggest concepts of unit tests, the Determinism of the tests.

### 2. Bogus
Bogus is a simple fake data generator for .NET languages like C#, F# and VB.NET . Bogus is fundamentally a C# port of faker.js and inspired by FluentValidation's syntax sugar. This library will help you load databases, UI and apps with fake data for your testing needs.

Several instructional scenarios were developed for Bogus. They can be found in the ARAI POC repo, under the project Bogus.PoC at the solution UnitTest.PoC.

Bogus offers a variety of datasets to generate more authentic data related to the real world, such as:

- Address Data (zipcode, city, street address, etc.)
- Commerce Data (Product, product categories, department, EAN, etc.)
- Company Data (company name, company suffix, etc.)
- Date Data (Past, Future, Between, Recent, Month, etc.)
- Finance Data (Account, Transaction type, currency, credit card number, BTC address, etc.)
- Images Data (DataUri, LoremPixelUrl, placeholder, tec)
- Internet Data (Avatar, email, domain name, ip, etc.)
- System Data (FileName, DirectoryPath, FilePath, FileExt, etc.)
- Random Data (String, numbers, array element, random locale, etc.)
- Locale Data (English, Spanish, French, etc.)
- More about their API support in their official github page 

This library also comes with interesting features such as:

- Preloaded classes (e.g. Person)
- Randomizers with formatted strings
- Implicit and Explicit Type Conversion
- Bulk Rules
- Global and local Determinism (control of generated data through a data seed)
####    Examples:

- Simple Types:
> var faker = new Faker();
> int number = faker.Random.Number(1, 100); // Generates random number between 1 and 100
> string randomString = faker.Random.String(); // Generates random string
> string randomZipCode = faker.Address.ZipCode(); // Generates random zip code from bogus dataset.  
- Complex Types:
There a are two main ways to model a test object for a class using Bogus. One way is to use Bogus as the data provider for the class. In this approach, the object is created normally, but the values are dynamically generated using Bogus.

> // Example showing on how to populate a object with values from bogus datasets
> var complexType = new ComplexType()
> {
>    Name = faker.Person.FullName,
>    Age = faker.Random.Number(1, 100),
>    Address = faker.Address.StreetAddress(),
>    City = faker.Address.City(),
>    State = faker.Address.State()
>}
The other approach is to model a Faker<T> class and set the values definition in advance.

> public class ComplexTypeWithSeveralPropsFaker: Faker<ComplexTypeWithSeveralProps>
> {
>    public ComplexTypeWithSeveralPropsFaker()
>    {
>        RuleFor(c => c.Name, faker => faker.Person.FullName);
>        RuleFor(c => c.Age, faker => faker.Random.Number(1, 100));
>        RuleFor(c => c.Address, faker => faker.Address.StreetAddress());
>        RuleFor(c => c.City, faker => faker.Address.City());
>        RuleFor(c => c.State, faker => faker.Address.State());
>    }
> }
    
> var faker = new ComplexTypeWithSeveralPropsFaker();
> var complexType = faker.Generate(); // Generates a complex type with values from the faker

- **Sequences:**
As AutoFixture, it's also possible to create sequences in a very easy way using Bogus. Let's see the example on how to generate a numeric sequence within a specific range:

> // Generate sequence of 10 elements of random ints between 1 and 100
> var intSequence = Enumerable.Range(1, 10)
>            .Select(_ => faker.Random.Number(1, 100))
>            .ToList();           
The example above can be modified to generate any type of sequence, inside or outside of Bogus datasets.

It's also possible to create sequences of a complex object following a given model. Let's define a test model for a specific object and then generate a sequence of objects:

> var faker = new ComplexTypeWithSeveralPropsFaker()
>            .RuleFor(x => x.Name, f => f.Person.FullName)
>            .RuleFor(x => x.Age, f => f.Random.Number(1, 100))
>            
> var objList = faker.Generate(10) // Generates a list of 10 complex objects with the defined rules for name and age       

- **Randomizers:**
Bogus provides very interesting features to generate random data following a given format.

> //CharMap: # => number, ? => letter, * => random number or letter
> var formattedStringWithNumbers = new Randomizer().Replace("###-###-###"); // Output: 432-854-965
> var formattedStringWithLettersAndNumbers = new Randomizer().Replace("### ??? ###"); // Output: 433 AXC 865
> var stringWithRandomNumbersAndLetters = new Randomizer().Replace("***-****"); // Output: 4A3-854Y

####    Critics
Bogus is a very robust library for generating data, being it has either random data or well defined data following real world formats included in their datasets. Below is the list of pros and cons of Bogus:

##### Pros:

* Easy to use, understand and extend
* Multilanguage support
* Very flexible
* Great built-in datasets for real world data generation (e.g. Bogus.DataSets.Person)
* Great support for custom data generation
* Can be deterministic
* Fluent validation like syntax to define rules
* There are a number of helper methods to support cleaner and more understandable code

##### Cons:
* Determinism rules can be tricky to implement
* Doesn't have integration with AutoMoq
* Doesn't have data theories

#####   Bogus vs AutoFixture


| |Bogus|	AutoFixture|
|--|--|--|
|License	|GNU General Public	|MIT License|
|Multilanguage support	|✅	|❌|
|Built-in datasets with real world data|	✅	|❌|
|Determinism is achievable	|✅	|❌|
|Supports custom data generation	|✅|	✅|
|Supports integration with Moq	|✅	|✅|
|Supports interface injection	|❌	|✅ |
|Supports data theories	|❌|	✅|
### References
- [github autofixture repo](https://github.com/AutoFixture/AutoFixture)
- [github bogus repo](https://github.com/bchavez/Bogus#bogus-api-support)
- [autofixture cheatsheet](https://github.com/AutoFixture/AutoFixture/wiki/Cheat-Sheet )
- [Builder pattern in Tests](http://www.natpryce.com/articles/000714.html)
- [SUT Factory good practice](https://blog.ploeh.dk/2009/02/13/SUTFactory/)
- [builder pattern with bogus](https://seankilleen.com/2020/12/utilizing-the-builder-pattern-and-bogus-for-better-supporting-test-objects/)
- [using bogus with Moq](https://www.c-sharpcorner.com/article/writing-efficient-unit-test-cases-with-moq-and-bogus/)
-------------------------------------------------------------------------------
### Mocking Libraries
 
 Mocking framework complement unit testing frameworks by isolating dependencies. By isolating dependencies, they help unit testing process and help developers writing more focused and concise unit tests.

There are three main mocking frameworks for the .NET platform
### Moq
The most popular and friendly mocking library for .NET. It is the only mocking library for .NET developed from scratch to take full advantage of .NET Linq expression trees and lambda expressions, which makes it the most productive, type-safe and refactoring-friendly mocking library available. And it supports mocking interfaces as well as classes.

#### Pros:
* The community seems to be more active.
* Well documented with good set of examples
* Analysers available to help using better mocking syntax
* Mocks both interfaces and classes
* Intercepts and raise events on mocks

#### Cons:
* The syntax is really verbose, so it makes our test less readable for Arrange section of the test.
* A learning curve for the new test writer.

### NMock
NMock is a dynamic mock object library for .NET. Mock objects make it easier to test single components (often single classes) without relying on real implementations of all of the other components.

#### Pros:
Could be interesting for solution based at .NET Framework 4.7 and less.

#### Cons:
* NMock is not up to date to be used for applications based upon new versions of .net
* Documentation is not easy to understand and is not current.
* The site for the relatively newer version of NMock is down.

### Nsubstitute
NSubstitute is designed as a friendly substitute for .NET mocking libraries. NSubstitute is designed for Arrange-Act-Assert (AAA) testing, so you just need to arrange how it should work, then assert that it received the calls you expected once you're done.

#### Pros:
* In general setup mock is cleaner than Moq
* It has simpler interface to setup the returns of the methods mocked
* The syntax is very straight forward. For a new developer using NSubtitute, the Arrange part could be easier to ramp up.
* Well documentated with detailed examples
* Analysers available to help using better mocking syntax

#### Cons:
* Default string return value is "" and not null.
* The syntax about events in general is not very clear.
*  Throwing exception is not intuitive, since we have to return a lambda expression throwing an exception.
* The syntax to validate if calls have been done, is not very clear.
* When we have to validate specific calls scenario, it's harder to do.

**Moq and NSubstitute** are both very popular and resourceful libraries. Moq has a good advantage over NSubstitute due to:
- It is easier to get the arguments values before returning the mocked value and process them as needed.
- It uses a lot more built-in options for matching arguemnts.
- It is easier to recognize that the function will throw an exception.
- It has more options to test how many times the method was executed.

#### Capability comparison

We decided to compare Moq, NMock and NSubstitute with .net core 5+.

There is comparison for Mocking scenarios with:

* Methods
* Properties
* Events
* Invocation check

NMock is not being evaluated for these capabilities due to not having support for .NET 5 +

**Method Capabilities**
|Features|	Moq	|NSubstitute|
|--|--|--|
|Method return|	✔	|✔|
|Method return "stack"|	✔|✔|
|Method dynamic return|	✔	|	✔|
|Method async return	|✔	|	✔|
|Method dynamic async return|	✔	|	✔|
|Method throw exception|	✔	|	✔|
|Method argument matching|	✔	|	✔|
|Method argument matching overlapping|	✔	|	✔|
|Method argument matching with ref|	✔	|	✔|
|Method argument lazy matching|	✔	|	✔|
|Method argument range matching|	✔|	❌ |
|Method argument regex matching	|✔	|	❌ |
|Method argument any|	✔	|	✔|
|Method invoking argument|	✔	|	✔|
|Method set "out" argument|	✔	|	✔|
|Method callback|	✔	|	✔|
|Method callback args|	✔	|	✔|
|Method callback "stack"|	✔|	✔|
|Method callback ref/out args|	✔ |	✔ |

**Property Capabilities**
|Features|	Moq	|NSubstitute|
|--|--|--|
|Property return|	✔	|✔|
|Property return "stack"|	✔	|✔|
|Property dynamic return|	✔	|✔|
|Property throw exception|	✔	|✔|
|Property hierarchy return|	✔	|✔|
|Property value storing|	✔	|✔|
|All Properties value storing|	✔	|✔|

**Event Capabilities**
|Features|	Moq	|NSubstitute|
|--|--|--|
|Raise event on mock|	✔	|✔ |
|Raise event in hierarchy|	✔	|✔|
|Event raised on method called|	✔	|✔|

**Invocation check (call verification) Capabilities**
|Features|	Moq	|NSubstitute|
|--|--|--|
|Method invocation exact match|	✔	|✔ |
|Method invoked any|	✔	|✔ |
|Property getter invoked|	✔	|✔ |
|Property setter invoked|	✔	|✔ |
|Property setter invoked exact match|	✔	|✔ |
|Property setter invoked range match|	✔	|✔ |
|Event attached invoked|	✔	|✔ |
|Event detached invoked|	✔	|✔ |
|Error message customization|	✔	|❌ |
|Invoked never|	✔	|✔ |
|Invoked at least once|	✔	|✔ |
|Invoked exactly N times|	✔	|✔ |
|Invoked in exact order|	✔	|✔ |

#### References

- [github NSubstitute repo](https://nsubstitute.github.io/help/getting-started/)
- [github Moq repo](https://github.com/moq/moq4)
- [NMock ](http://the.earth.li/~mgm/nmock2/index.html)
- [NMock version3](https://nmock3.codeplex.com/)
- [mocking benefits](https://methodpoet.com/unit-testing-with-moq/)
- [NSubstitute and Moq](https://itenium.be/blog/dotnet/nsubstitute-vs-moq/)
