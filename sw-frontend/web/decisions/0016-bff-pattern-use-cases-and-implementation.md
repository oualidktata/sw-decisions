# 16. bff pattern use cases and implementation

Date: 2022-01-19

## Status

Accepted

## Context

BFF stands for Back-End for Front-End. The overall purpose of having a BFF (mobile,web,etc.) is to provide the client with a focused interface to connect with. 
It reduces network chattiness which improves performance. BFFs are variants of the API gateway pattern which is similar to the facade pattern. It simplifies FE development for specific UI by simplifying interactions with the back-End. A lot of features could be implemented at the BFF layer.

Like many other patterns, using the BFF in your application depends on the context and the architecture you plan to follow. For example, if your application is a simple monolithic app, a BFF is unnecessary. It will add little to no value.

However, if your application depends on microservices and consumes many external APIs and other services, it is better to use a BFF to streamline the data flow and introduce a lot of efficiency to your application. Different frontends may require slightly different message formats, message structures, headers, etc.

Further, if your application needs to develop an optimized backend for a specific frontend interface or your clients need to consume data that require a significant amount of aggregation on the backend, BFF is a suitable option.
The BFF will do the following.
- Call the relevant microservices APIs and obtain the needed data
- Format the data based on the frontend representation
- Send the formatted data to the frontend
As a result, there will be minimal logic on the frontend. Therefore, a BFF helps to streamline data representation and takes up the responsibility of providing a well-focused interface for the frontend.

## Decision

We decided to implement the BFF pattern in our ERA. The features that will be integrated at the BFF layer will strongly depend from the use case requirements and the expected benefits. Mulitple decision record will be dedicated to each feature/benefit. All BFF related decisions will be prefixed by 'bff' for grouping purposes.

Moreover, instead of a single BFF service (for each frontend type) that interacts with *all* backend services, we will
create separate BFF services per subdomain: 
- **BFF for User** and account management (one version for each frontend type)
- **BFF for Catalog** and browsing services available (one version for each frontend type)
- **BFF for Order**, including checkout and order processing (one version for each frontend type) 
- **BFF for Deal management**, including store and campaign management (one version for each frontend type) 

## Consequences

When implemented correctly for the right use case, the BFF pattern has tremendous benefits on the long run:
- Separation of concerns — Frontend requirements will be separated from the backend concerns. This is easier for maintenance.
- Easier to maintain and modify APIs — The client application will know less about the APIs’ structure, which will make it more resilient to changes in those APIs.
- Better error handling in the frontend — Server errors are meaningless to the frontend user most of the time. Instead of directly returning the error sent by the server, the BFF can map out errors that need to be shown to the user. This will improve the user experience.
- Multiple device types can call the backend in parallel — While the browser is making a request to the browser BFF, the mobile devices can do the same. It will help obtain responses from the services faster.
- Better security — Certain sensitive information can be hidden, and unnecessary data to the frontend can be omitted when sending back a response to the frontend. The abstraction will make it harder for attackers to target the application. By Centralizing security concerns in the BFF, it's possible to mitigate the IDOR (Insecure Direct Object Reference). IDOR occurs when an application exposes a reference to an internal implementation object.(See decision [0014-bffauthz-strategy](0014-bff-authz-strategy.md))
Shared team ownership of components — Different parts of the application can be handled by different teams very easily. Frontend teams get to enjoy ownership of both their client application and its underlying resource consumption layer; leading to high development velocities. The below diagram shows an example of such a team separation along with BFFs. More on this in decision [0031-bff-which-team-is-responsble of the BFF](0031-bff-which-team-is-responsable-for-the-bff.md)
  ![Teams' topology around BFF](../images/bff/bff-team-topology.png)
- Improve health check
- Frontend apps will call BFFs and frontend devs need to discuss with backend devs the BFF contracts (endpoints, message formats, etc.). 
- New server-side functionality should be exposed via BFF endpoints. 
- In case of Micro-Frontend applications that compose a FrontEnd UI, every micro-FrontEnd will talk to its own BFF:
![Mapping MicroFE to BFF](../images/bff/microfrontend-bff.png)


## Resources
https://blog.bitsrc.io/bff-pattern-backend-for-frontend-an-introduction-e4fa965128bf
https://medium.com/mobilepeople/backend-for-frontend-pattern-why-you-need-to-know-it-46f94ce420b0
