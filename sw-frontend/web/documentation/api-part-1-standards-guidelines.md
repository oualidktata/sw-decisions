
# Overview

Most modern web applications expose APIs that clients can use to interact with the application. They allow various clients including browser apps to communicate with a server via the REST API. Therefore, it’s very important to design REST APIs properly so that we won’t run into problems down the road. We have to take into account security, performance, and ease of use for API consumers. 

A well-designed web API should aim to support:

- Platform independence. Any client should be able to call the API, regardless of how the API is implemented internally. This requires using standard protocols, and having a mechanism whereby the client and the web service can agree on the format of the data to exchange.

- Service evolution. The web API should be able to evolve and add functionality independently from client applications. As the API evolves, existing client applications should continue to function without modification. All functionality should be discoverable so that client applications can fully use it.


# 1. Organize the API design around resources

Focus on the business entities that the web API exposes. For example, in an e-commerce system, the primary entities might be customers and orders. Creating an order can be achieved by sending an HTTP POST request that contains the order information. The HTTP response indicates whether the order was placed successfully or not. When possible, resource URIs should be based on nouns (the resource) and not verbs (the operations on the resource).

## Use nouns instead of verbs in endpoint paths
We shouldn’t use verbs in our endpoint paths. Instead, we should use the nouns which represent the entity that the endpoint that we’re retrieving or manipulating as the pathname. The action should be indicated by the HTTP request method that we’re making.

The HTTP protocol defines a number of methods that assign semantic meaning to a request. The common HTTP methods used by most RESTful web APIs are:

- **GET** retrieves a representation of the resource at the specified URI. The body of the response message contains the details of the requested resource.
- **POST** creates a new resource at the specified URI. The body of the request message provides the details of the new resource. Note that POST can also be used to trigger operations that don't actually create resources.
- **PUT** either creates or replaces the resource at the specified URI. The body of the request message specifies the resource to be created or updated.
- **PATCH** performs a partial update of a resource. The request body specifies the set of changes to apply to the resource.
- **DELETE** removes the resource at the specified URI.

The effect of a specific request should depend on whether the resource is a collection or an individual item. The following table summarizes the common conventions adopted by most RESTful implementations using the **troupon e-commerce** example. Not all of these requests might be implemented&mdash;it depends on the specific scenario.

| **Resource** | **POST** | **GET** | **PUT** | **DELETE** |
| --- | --- | --- | --- | --- |
| /customers |Create a new customer |Retrieve all customers |Bulk update of customers |Remove all customers |
| /customers/1 |Error |Retrieve the details for customer 1 |Update the details of customer 1 if it exists |Remove customer 1 |
| /customers/1/orders |Create a new order for customer 1 |Retrieve all orders for customer 1 |Bulk update of orders for customer 1 |Remove all orders for customer 1 |

###  Do's and Don'ts.

2 simple examples to better illustrate the table above

**Action:** Retrieve customer(s) **[GET]**
✅ **Do**: `/customers/` (for all customers), `/customers/1` (individual customer)
❌ **Don't**: `/customers/getAllCustomers`, `/customers/getCustomerById`, `/customer/findCustomer`, `/customer/retrieveCustomer`



**Action:** Create a new customer **[POST]**
✅ **Do**: `/customers/` (for all customers)
❌ **Don't**: `/customers/createNewConsumer`, `/customers/create`, `/customer/insertConsumer`, `/customer/new`


## Use Consistently Plural Nouns

Indeed, it’s a matter of taste, but the plural form is more common. Moreover, it’s more intuitive, especially when using GET on the collection URL (GET /employee returning multiple employees). But most important: avoid mixing plural and singular nouns, which is confusing and error-prone.

**Action:** Get employee [**GET**]
✅ **Do**: `/employees`, `/employees/21`
❌ **Don't**: `/employee`, `/employee/21`

## General overview on when to use POST, PUT, PATCH

- **POST** on the Resource Collection URL to Create a New Resource (e.g. **post on** `/customer/` should generate the resource for **get** `/customer/21` )
- **PUT** on the Single Resource URL for Updating a Resource or to do bulk updates. The client specifies the URI for the resource. The request body **should contain a complete representation of the resource** (full updates). Missing fields in PUT request should be treated as null values and empty the database fields or trigger validation errors.
- **PATCH** on Partial Updates of a Resource.  The client specifies the URI for the resource. The request body specifies a set of changes to apply to the resource. This can be more efficient than using PUT, because the client only sends the changes, not the entire representation of the resource.


###

# 2. Asynchronous operations
Sometimes a POST, PUT, PATCH, or DELETE operation might require processing that takes a while to complete. If you wait for completion before sending a response to the client, it may cause unacceptable latency. If so, consider making the operation asynchronous. Return HTTP status code 202 (Accepted) to indicate the request was accepted for processing but is not completed.

You should expose an endpoint that returns the status of an asynchronous request, so the client can monitor the status by polling the status endpoint. Include the URI of the status endpoint in the Location header of the 202 response. 

If the asynchronous operation creates a new resource, the status endpoint should return status code 303 (See Other) after the operation completes. In the 303 response, include a Location header that gives the URI of the new resource.


# 3. Filtering, sorting and pagination

GET requests over collection resources can potentially return a large number of items. You should design a web API to limit the amount of data returned by any single request. 

### Use query parameters

For filtering and sorting entities, a REST API can allow passing a filter in the query string of the URI, such as `/orders?minCost=n`. The web API is then responsible for parsing and handling the `minCost` parameter in the query string and returning the filtered results on the server side.

Also consider imposing an upper limit on the number of items returned, to help prevent Denial of Service attacks. To assist client applications, GET requests that return paginated data should also include some form of metadata that indicate the total number of resources available in the collection.

# 4. Handling errors with status codes

To eliminate confusion for API users when an error occurs, we should handle errors gracefully and return HTTP response codes that indicate what kind of error occurred. This gives maintainers of the API enough information to understand the problem that’s occurred. We don’t want errors to bring down our system, so we can leave them unhandled, which means that the API consumer has to handle them.

We should be throwing errors that correspond to the problem that our app has encountered. For example, if we want to reject the data from the request payload, then we should return a 400 (Bad Request) response

We have a dedicated section for detailing status codes in this documentation that can be found on [1.2.1.2. Response Codes](https://tfs18.utcapp.com/CustomerService/ApplicationReferecenArchitectureInitiave/_wiki/wikis/ApplicationReferecenArchitectureInitiave.wiki?wikiVersion=GBwikiMaster&pagePath=%2F1.%20Back%252DEnd%2F1.2.Coding%20standards%2C%20styles%2C%20patterns%20and%20libraries%2F1.2.1%20REST%20API%20design%2F1.2.1.2.%20Response%20Codes) page.


# 5. Provide Useful Error Messages
In order for apis clients to handle errors in a consistent and simple way, it is useful to adopt a generic error message pattern, such as the [ProblemDetails for HTTP APIs](https://tools.ietf.org/html/rfc7807) developed by the [Internet Engineering Task Force (IETF)](https://tools.ietf.org/)

As proposed by them:

> Problem Details is a way to carry machine-readable details of errors in a HTTP response to avoid the need to define new error response formats for HTTP APIs

On the dotnet platform we can benefit from the existing `ProblemDetails` and `ValidationProblemDetails` classes out of the box.

# 6. Media types
In Rest APIs, clients and servers exchange representations of resources. For example, in a POST request, the request body contains a representation of the resource to create. In a GET request, the response body contains a representation of the fetched resource.

In the HTTP protocol, formats of representations of resources are specified through the use of media types, also called MIME types. For non-binary data, most web APIs support **JSON (media type = application/json)** and possibly **XML (media type = application/xml).**

**[XML](https://www.w3.org/XML/)** is a data tree-like format as well an **extensible Markup Language (XML)** which allows users to define their own customized markup languages, especially in order to display documents on the internet. It is a format for structured documents that are using ordered trees to represent these documents.

**[JSON (JavaScript Object Notation)](https://www.json.org/json-en.html)**  is a lightweight data-interchange format. It is easy for humans to read and write. It is easy for machines to parse and generate. It is based on a subset of the JavaScript Programming Language Standard ECMA-262 3rd Edition - December 1999. JSON is a text format that is completely language independent but uses conventions that are familiar to programmers of the C-family of languages, including C, C++, C#, Java, JavaScript, Perl, Python, and many others. These properties make JSON an ideal data-interchange language.

Almost every networked technology can use it: JavaScript has built-in methods to encode and decode JSON either through the Fetch API or another HTTP client. Server-side technologies have libraries that can decode JSON without doing much work.

JSON is a much more natural fit for developers to exchange structured data due to some advantages such as being less verbose, light-weight size and approximation with javascript. It doesn't require the rather inconvenient “data binding” and “data serialization” steps that were notoriously difficult when using XML-based APIs.

Taking into account that REST APIs depend on easy, reliable and fast data exchanges, **JSON was taken by the industry as the current standard for transferring non-binary data.**

Unless it's necessary to use XML for some specific requirement or client/server limitation, the industry standard recommendation at the time of writing this document is to have Rest APIs based on JSON (both for request and response).

# 7.  Use API conventions (dotnet)

ASP.NET Core 3.0 and later includes a way to extract common API documentation and apply it to multiple actions, controllers, or all controllers within an assembly. Web API conventions are a substitute for decorating individual actions with `[ProducesResponseType]`.

A convention allows you to:

- Define the most common return types and status codes returned from a specific type of action.
- Identify actions that deviate from the defined standard.

❌ **Don't:**

```[ApiController]
public class CategoriesController{	
	[ProducesResponseType(StatusCodes.Status200OK)]
	[ProducesResponseType(StatusCodes.Status404NotFound)]	
	[ProducesResponseType(typeof(ProblemDetails), StatusCodes.Status500InternalServerError)]
	[SwaggerOperation(Description = "Get category")]
	[HttpGet]
	public Task<IEnumerable<TopCategoryDto>> Get() {...}	
}
```
_CategoriesController.cs_


✅ **Do:** 
```
//CategoriesController.cs
[ApiController]
[ApiConventionType(typeof(YourConvention))]
public class CategoriesController{	
	[SwaggerOperation(Description = "Get category")]
	[HttpGet]
	public Task<IEnumerable<TopCategoryDto>> Get(int id) {...}	
}


// YourConvention.cs
 public static class YourConvention{
	[ApiConventionNameMatch(ApiConventionNameMatchBehavior.Prefix)]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(typeof(ProblemDetails), StatusCodes.Status500InternalServerError)]
    public static void Get(
    [ApiConventionNameMatch(ApiConventionNameMatchBehavior.Suffix)]
    int id)
	{ }	
 }
```


As seen, the example Do shows the addition of the decorator `[ApiConventionType(typeof(YourConvention))]` at the beginning of the controller.

All `[ProducesResponseType]` decorators were previously declared in the `YourConvention` class, which makes it explicit that all methods with the Get prefix will inherit the attributes defined there.

This approach makes the controller code much cleaner and less verbose, as well as centralizing the convention logic for the defined endpoints (by the suffix or prefix of the action name)



# 8. Good security practices

Most communication between client and server should be private since we often send and receive private information. Therefore, using SSL/TLS for security is a must.

People shouldn’t be able to access more information that they requested. For example, a normal user shouldn’t be able to access information of another user. They also shouldn’t be able to access data of admins.

To enforce the principle of least privilege, we need to add role checks either for a single role, or have more granular roles for each user.

If we choose to group users into a few roles, then the roles should have the permissions that cover all they need and no more. If we have more granular permissions for each feature that users have access to, then we have to make sure that admins can add and remove those features from each user accordingly. Also, we need to add some preset roles that can be applied to a group users so that we don’t have to do that for every user manually.


# 9. API Versioning
It is highly unlikely that a web API will remain static. As business requirements change new collections of resources may be added, the relationships between resources might change, and the structure of the data in resources might be amended. While updating a web API to handle new or differing requirements is a relatively straightforward process, you must consider the effects that such changes will have on client applications consuming the web API. The issue is that although the developer designing and implementing a web API has full control over that API, the developer does not have the same degree of control over client applications, which may be built by third-party organizations operating remotely. The primary imperative is to enable existing client applications to continue functioning unchanged while allowing new client applications to take advantage of new features and resources.

Versioning enables a web API to indicate the features and resources that it exposes, and a client application can submit requests that are directed to a specific version of a feature or resource. Versioning is usually done with /v1/, /v2/, etc. added at the start of the API path, e.g. `/v1/customers/`, `/v2/customers/`


# 10. OpenAPI
The [Open API Initiative](https://www.openapis.org/) was created by an industry consortium to standardize REST API descriptions across vendors. As part of this initiative, the Swagger 2.0 specification was renamed the OpenAPI Specification (OAS) and brought under the Open API Initiative.

You may want to adopt OpenAPI for your web APIs. Some points to consider:

- The OpenAPI Specification comes with a set of opinionated guidelines on how a REST API should be designed. That has advantages for interoperability, but requires more care when designing your API to conform to the specification.

- OpenAPI promotes a contract-first approach, rather than an implementation-first approach. Contract-first means you design the API contract (the interface) first and then write code that implements the contract.

- Tools like Swagger can generate client libraries or documentation from API contracts.








# Reference Links
https://docs.microsoft.com/en-us/azure/architecture/best-practices/api-design
https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/
https://swagger.io/resources/articles/best-practices-in-api-design/
https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md
https://mathieu.fenniak.net/the-api-checklist/
https://restfulapi.net/json-vs-xml/
https://www.w3.org/XML/
https://www.json.org/json-en.html
https://blog.axway.com/apis/why-json-won-over-xml
https://blog.cloud-elements.com/using-json-over-xml
https://www.openapis.org/
https://phauer.com/2015/restful-api-design-best-practices/
https://tools.ietf.org/html/rfc7807
https://docs.microsoft.com/en-us/aspnet/core/web-api/advanced/conventions?view=aspnetcore-5.0
https://kumarashwinhubert.com/problem-details-the-right-way-to-specify-errors-in-web-api-responses