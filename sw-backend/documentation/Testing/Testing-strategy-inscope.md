# Testing

Date: 2022-04-08


## Testing Strategies

Since there are multiple layers and components in microservice architecture, we will have several test types. Here is a modified test pyramid for microservices. 
![](../../images/testing/testing-complex-pyramid.PNG)

## Pre-Deployment Tests
These tests should be written inside the project of the service (i.e. under the test package of the service) and for each service CI/CD pipeline we should run them before the deployment phase.
* Unit Tests
* Integration Tests
* Component/Service Test
* Contract Test

In the pipeline, they can run in the below order.

![](../../images/testing/order-test.PNG)

### Unit Tests
A unit test focuses on a single “unit of code” to isolate each part of the program and show that the individual parts are correct. Generally, developers are writing unit tests by using unit testing libraries such as JUnit, mockito, etc. They are directly calling the implementation methods in unit tests. 

![](../../images/testing/unit.PNG)
### Integration Tests
They verify the communication paths and interactions between components to detect interface defects. Such as data store connections. For integration tests, we also do not need to start the service locally. We can call any implemented method for the required test but this time we need to check the integration with the external systems such as a DB connection or other service connection. In our test scope, there should be an external system integration.

![](../../images/testing/IT.PNG)
### Service/Component Tests
In a microservice architecture, the components are the services themselves. Here we need to isolate each component (service) from its peers or collaborators and writing tests at this granularity. We can use tools like WireMock to mock the external system or other services. Also, we can use in-memory databases to mock DBs but this will create a bit more complexity. Ideally, we should mock all the external dependencies and test the service in isolation. 

![](../../images/testing/service.PNG)
### Contract Tests (Consumer-Driven Contract Tests)
Contracts are a series of agreements between the service provider and the consumer. The providers can test their service against these contracts to make sure they are not breaking any consumers thereby helping to keep the service backward compatible.

![](../../images/testing/cdc-simplified-view.PNG)

## Post-Deployment Tests
### System Integration Tests (E2E Tests)
System Integration tests (SIT) ensure that we are building the right system and how the application behaves. We can test the flow of an application right from start to finish is behaving as expected. We should not use any mocks/stubs for system integration tests. All system components should be integrated with each other. In this way, we can ensure that system-level integration is working as expected. These tests take more time than others. Therefore, we need to test the critical business flows at the SIT level.
**Recommended approach**
- Backlog prioritization.
- Gathering high-level business rules. (specs/tests)
- Elaborating those business rules and creating the steps of them. (steps)
- Gathering required test data, endpoints, and expected results. (data & assertions)
- Starting to write test scenarios based on the above inputs. (coding)
- After exploration and discovery, scenarios formalized and specs (tests) will be formed as shown below. You can also cucumber to add a Gherkin flavor to your tests or you can create your own step classes to hide the details inside step classes’ methods. Then, tests will look more readable as shown below.

![Gherkins](../../images/testing/testing-acceptance-testing-gherkins.PNG)

### Performance Tests
After deployment to the test or your stage environment (we are doing PT in the stage environment and SIT for the test environment), you can start to run your service level performance testing. In microservices, I suggest testing the service performance in several ways. First, better to mock all dependencies as much as possible and hit the service endpoint directly to measure standalone service performance testing. This test will give you an isolated service performance which means you focus on the service’s performance.

### Exploratory tests
Exploratory testing is a style of testing that emphasizes a rapid cycle of learning, test design, and test execution. Rather than trying to verify that the software conforms to a pre-written test script, exploratory testing explores the characteristics of the software, raising discoveries that will then be classified as reasonable behavior or failures[3].

The exploratory testing mindset is a contrast to that of scripted testing. In scripted testing, test designers create a script of tests, where each manipulation of the software is written down, together with the expected behavior of the software. These scripts are executed separately, usually many times, and usually by different actors than those who wrote them. If any test demonstrates behavior that doesn't match the expected behavior designed by the test, then we consider this a failure[3].

## Pre-Release Testing Approach
Before releasing your services to your customers which means the production environment, we should do some checks. We can de-attach one of the servers from the load-balancer and do critical regression testing which covers most business-critical scenarios and main user journeys on this server.

It is also better to get UAT approval before this phase. If the service pipeline is green, SIT tests passed, PT tests passed, UAT is approved, the final checks on production passed then we are OK to proceed further. When the new version of the service is consumed in production, we should always monitor it with several tools such as APM, monitoring, and logging tools.


## Resources
[1] https://www.swtestacademy.com/microservices-testing-strategies/
[3] https://martinfowler.com/bliki/ExploratoryTesting.html
https://martinfowler.com/articles/microservice-testing/#testing-progress-3



