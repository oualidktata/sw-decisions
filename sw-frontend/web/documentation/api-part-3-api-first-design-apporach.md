#Adopting an API-First Approach

- Sketch and Prototype
- 7 usability 
- Easy to understand
- Consistency and standard
- Error Prevention
- Flexibility and efficiency of use
- Visibility
  - ex.return 202 when long running
- Run PoC

![]()

# ADDR process
 It’s designed to get everyone on the same page to design and create scalable APIs
- **Align**: This step is where you make sure that every team understands one another and is **working towards** the **same goal**. The business and technical sides come together during the Align phase, agreeing on goals and intended outcomes. Once you know what you’re trying to do, it’s much easier to do it.
- **Define**: The next step is where you take all the different goals and begin to **translate** them into technical language.
- **Design**: Now you’re ready to begin creating your API. During the Design stage, you’ll take the goals you identified during the Define stage and start to **decide on intended solutions**. You’ll determine what **architecture style** will best serve different applications, like using REST or GraphQL for various components, for example.
- **Refine**: The final stage of ADDR allows for **testing**, taking in **user feedback**, and integrating it back into the design process.
## 7 Steps:
1- Identify digital capabilities.
2- Capture activity steps.
3- Identify API boundaries.
4- Model API profiles.
5- Perform high-level API design.
6- Refine the Design.
7- Document the API.
## intended goals of adopting ADDR for API design:

- Deliver an API design that emphasizes and solves the customer problems using a vocabulary they understand.
- Reduce the constant design churn common with informal design processes.
- Optimize the entire organization, not just developers, but for API design and delivery.
- Avoid unnecessary steps whenever possible to expedite delivery.
- Create a repeatable process that delivers an API design with a mixture of technical and non-technical roles, some of whom don’t fully understand the nuances of API design but can contribute their insights.
- Produce artifacts that may be referenced within the team and shared across the organization, rather than some scribbles on a whiteboard that fail to communicate reason and intent about the resulting API design.
## What are the net outcomes?

A fundamental tenet of the ADDR process is that API design is collaborative. This means including key stakeholders early and often, rather than thinking of the API purely as a technical concern left to developers. I have seen teams assuming they know the API design necessary to address the problem at hand, to reaching that moment when they realize that the design would have been wrong and they would have wasted hundreds of developer hours throwing away code that they were about to write. I’ve seen product owners realize that APIs are products that must be managed just like any other digital product. Finally, I’ve witnessed executives that realize the value of investing in APIs to create a portfolio of digital capabilities simply by getting hands-on during an ADDR session.


Participatory design

## 1. Brainstorm -
**APis**
- Identify key services and capabilities of the business. 
- Identify what services should be offered via APIs. 
- Identify potential use cases for the API.
**Endpoints**
- Identify potential endpoints based on those use cases.

## 2. Establish API stakeholders 
- Identify the stakeholders within the organization interested on those services either consumers or producers?
- Obtain stakeholders buy-in on the vision for the services and the API resources.
- Make sure that the APIs remains consistent across the organization.

## 3. Design an API contract 
- The contract establishes a set of standards and best practices for designing APIs.
- Describe and document all APIs. Ensure that all APIs work the same, from endpoint names and URLs to error codes and versioning. Consistency is key. Using OpenAPI as a standard will help creating consistent endpoints.
## 4. Create a style guide for API design 
- A comprehensive, cohesive style guide ensures consistency across the teams of an organization who are building services. API status codes, versioning, error handling, and more will be standardized ensuring that APIs are designed the same way. Use a tool like SwaggerHub to create a style guide for all APIs across your organization.
- 
Implement API governance - An API governance process can help enforce established standards and reinforce desired outcomes. We discuss API governance in an upcoming blog article. Conducting peer code reviews can also help ensure that API design standards are followed and that developers are producing quality code.
Automate processes - Use tools like SwaggerHub to automate processes like generating API documentation, style validation, API mocking, and versioning. Also, make APIs self-service so that developers can get started building apps with your APIs right away. Provide interactive documentation or a sandbox so that developers can try out API endpoints. 
Track and manage your API portfolio - Avoid duplicating code and building redundant APIs by tracking and managing your API portfolio. Implement a system that helps you track and manage your APIs. The larger your organization and platform becomes, the harder it gets to track APIs and their dependencies.
Create a portal for internal developers - Create a central place for internal developers, a place where everything for all your APIs is stored- API specification, documentation, contracts, etc. For example, PayPal has built a portal for its developers and it’s “one of the most visited internal apps in PayPal,” according to an InfoQ article. PayPal’s portal includes an inventory of all APIs, documentation, dashboards, and more.

# Resources
https://swagger.io/resources/articles/adopting-an-api-first-approach/
[] Practical API design https://youtu.be/272ZZ53HS_4

[] ADDR process https://nordicapis.com/exploring-the-align-define-design-refine-addr-process/