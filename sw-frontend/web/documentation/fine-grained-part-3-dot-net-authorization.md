# In .Net API 7
# AuthN vs AuthZ [1]
Authentication is the process of determining a user's identity. Authorization is the process of determining whether a user has access to a resource. Both authentication and authorization scenarios share similar implementation semantics in ASP.NET Core. 

## AuthN concepts
- Authentication is handled by the authentication service, IAuthenticationService, which is used by authentication middleware. 
- The authentication service uses registered authentication handlers to complete authentication-related actions.
- Authentication schemes are names that are used to uniquely identify an authentication handler and its configuration options
- Authentication handlers are responsible for implementing the strategies for authentication and generating a user's claims given a particular authentication strategy, such as OAuth or OIDC.
- The configuration options are unique to the strategy as well and provide the handler with configuration that affects authentication behavior, such as redirect URIs.

oAuth
```
addAuthentication...
```

Need: 
1- authorize endpoint to obtain a code 
2- access_token endpoint to exchange code for a token
3- call-back after auth.
user information endpoint



## AuthZ
- Authorization is handled by the authorization service, IAuthorizationService, which is used by the authorization middleware.
Two **strategies** for determining user access to resources in the authorization layer:

1- **Role-based strategies** determine a user's access based on the role they are assigned, such as Administrator or User.
2- **Claim-based strategies** determine a user's access based on claims that are issued by a central authority.

- In ASP.NET Core, both strategies are captured into an **authorization requirement**.
- The authorization service leverages authorization handlers to determine whether or not a particular user meets the authorization requirements applied onto a resource.

### 1- Enable authN in minimal API
- To enable authentication, call AddAuthentication to register the required authentication services on the app's service provider.
- Typically, a specific authentication strategy is used. As example, the app is configured with support for JWT bearer-based authentication
```
builder.Services.AddAuthentication().AddJwtBearer();
builder.Services.AddAuthorization();
```
- By default, the minimal API automatically registers the authentication and authorization middlewares if certain authentication and authorization services are enabled.

### 2- Configure AuthN Strategy
Minimal app's support loading options from configuration for the following authentication strategies:

- JWT bearer-based
- OpenID Connection-based
- "Bearer" is the typical default scheme in JWT-bearer based enabled applications, but the default scheme can be overridden by setting the DefaultScheme property.
```
builder.Services.AddAuthentication()
  .AddJwtBearer()
  .AddJwtBearer("LocalAuthIssuer");
```
### 3- Configure authz policies
- Authentication is used to identify and **validate the identity** of users against an API. 
- Authorization is used to validate and **verify access to resources** in an API and is facilitated by the **IAuthorizationService** registered by the **AddAuthorization** extension method

#### Example: A /hello resource is added that requires a user to present an is_admin **claim** with a greetings_api **scope**.

- Configuring authorization requirements on a resource is a two-step process that requires:

1- **Configuring** the **authorization requirements** in a policy globally.
2- **Applying** individual policies to resources.




# Entrypoint: Api receiving a token
Options:
1- AuthZ at API gateway
2- Resource level (API)

## 2- Resource API level

1- ASPnet CORE Security context
All security info are encapsulated in the claimsPrincipal

- One principle (logged-in user) -> multiple identities (usually one)
- One identity -> multiple claims
- a claim is Key-value pair (name:"", birthday:"", roles:"") used for authZ

Every controller: TBD
base.User.Identity.IsAuthenticated
                  .Claims
if authenticated: primary identity will have the security context

# resources
[1] https://learn.microsoft.com/en-us/aspnet/core/fundamentals/minimal-apis/security?view=aspnetcore-7.0

OTHER REPOS for FGA:
TODO: https://github.com/topics/fine-grained-authorization?l=go
- https://github.com/Permify/permify