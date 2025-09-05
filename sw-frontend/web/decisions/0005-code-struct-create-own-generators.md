# 05. Code structure: Create our own plugin generators

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|02/08/2022|O.Ktata|
|Accepted|02/08/2022|Synergy|

## Context

The ultimate goal of creating our own schematics is to be more productive and focus on what is really important and not wasting time in boilerplate code that provide less value. The business logic and specific use cases should be the main focus of any developer or business in general.Infrastructure code should be supported by tooling as much as we can.

Custom schematics becomes even more important when architecting large scale applications. It helps architects create more opinionated architectures that guides the developer at every step of their work.

## Decision

We will be developing our own plugins tailored to our own architecture:
Examples:

**Setup Workspace**

- ng add @pwc/material-theme : Should install our **'rotorized-material'** package and place or update files accordingly.
- ng add @pwc/ddd: Should make DDD generators available in the terminal and the nx-console

**Generate Components: (UI-components)**

- ng generate @pwc/page:simple --name=add-user --lib=xyz --module=xyz --domain=user 
- ng generate @pwc/page:master-detail --name=manage-user --lib=xyz --module=xyz --domain=user
- ng generate @pwc/page:list name=list --lib=xyz --module=xyz --domain=user
- ng generate @pwc/page:dashboard --name=dashboard --lib=xyz --module=xyz --domain=user
   
**DDD components (access components)**
- ng generate @pwc/ddd:domain --name=user --lib=
- ng generate @pwc/ddd:facade --name=service1 --lib
- ng generate @pwc/ddd:service --name=service1 --lib

# Consequences
Having all developers sharing and using the same mindset when developing software has tremendous advantages:
- The learning curve is far less steep when the generated boilerplate code guides the developer on how to confidently add functionalities.
- Resources can switch projects more easily when they are familiar with the opinionated architecture.
- Having architectural decisions implemented in the code increases the adoption of good practices and standards when enforced at the code level. Decisions enforced at the documentation level are far less efficient.
- By enforcing decisions at the code level, architects can make sure that performance and security requirements are implemented up-front.
- For the company, using generators for boilerplate code and components makes estimation of user stories easier and more predictive.
# Resources
[1][code-structure-part-3-working-with-Nx-Schematics](../documentation/code-structure-part-3-working-with-Nx-Schematics.md)
