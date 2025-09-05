# 11. Architecture: Onion architecture for back-end services
## Status
|Status|Date|Validated by|
|------|----|------------|
|Proposed|02/08/2022|O.Ktata|
|Accepted|02/08/2022|Synergy|

## Context

There are many opportunities to create libraries for our Angular applications. However, one of the difficulties is getting the configuration to these libraries. Angular applications have an environment context that provides configuration items targeting specific environments for the application. Angular libraries in the Workspace cannot access the environment context.Applications reference and use libraries — and Angular Libraries may reference and use other libraries. If libraries had access to the environment context it would cause a circular dependency.
One of the main tenets of developing reusable libraries is to keep them generic enough to be reused by many applications and libraries.
 Not all library projects need configuration, but when they do, they prefer it pushed.

## Decision
Applications will provide each library its required configuration using a **push-based** approach.
## Consequences

Provide Strongly-Typed Configuration to Angular Libraries
Here is what needs to happen to enable configuration for libraries.

- each library will define its own configuration schema or object type
- each library will define an interface for the structure of the specific configuration
each library will subscribe to publish events of configuration
- library configuration will be pushed to libraries
- ach library has the responsibility to validate the configuration provided
- each library has the responsibility to define default values for any required items.
- each application will retrieve the configuration
- a service will provide the mechanism to publish configuration to library subscribers.

Benefit:
- **Single responsibility principle applied**: The libraries should not pull or request their own configuration. It is not their responsibility to have such knowledge. Therefore, libraries react to published events of configuration when applications provide it.
- **inversion of control principle applied** A Configuration service, will act as a mediator between applications with configuration and the libraries that need that configuration. Libraries will not ask for configuration, it will be provided to them ().

# Resources
https://medium.com/angularlicious/use-rxjs-to-push-configuration-to-angular-libraries-1c47830cc394