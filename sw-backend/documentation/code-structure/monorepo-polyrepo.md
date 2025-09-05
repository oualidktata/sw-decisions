# Repository Structuring

Date: 2022-04-18

# Concerns of Enterprise Teams
Developing applications on a **large enterprise** team is different than developing alone or on a small team. While small groups might be able to get away with ad hoc decisions on **application structure** or **coding best practices**, the same cannot be said when you’re working with dozens or perhaps hundreds of other people. In addition, enterprise teams need to assume that their code will stick around for many years to come. This means they’ll need to do as much work as possible at the beginning of an application’s development to minimize the cost of maintenance down the road.

We can summarize the **concerns of enterprise teams** like this:

- **Consistency** — how do we make sure everyone in the organization (which may be thousands of people) follows the same best practices for structuring and writing code?
- **Safety** — how do we ensure that our code will not be subject to attacks or prone to errors?
- **Increased size and complexity** — how can we structure our code so that it can grow without sacrificing clarity or performance?
- **Changing requirements** — how can we keep up with the demands of the business to continually update the application without letting technical debt get out of control?

## Monorepo
A Monorepository is an architectural concept, which basically contains all the meaning in its title. Instead of managing multiple repositories, you keep all your isolated code parts inside one repository. Keep in mind the word **isolated** —it means that monorepo has nothing in common with monolithic apps. You can keep many kinds of logical apps inside one repo; for example, a website and its iOS app.

![Difference between Mono-repo, monolith and multirepo](../../images/code-struct/mono-vs-poly.png)

A monorepo changes your organization. It is more than code & tools. A monorepo changes your organization & the way you think about code. By adding consistency, lowering the friction in creating new projects and performing large scale refactorings, by facilitating code sharing and cross-team collaboration, it'll allow your organization to work more efficiently.

## Benefits of Monorepo
- **One place to store all configs and tests**. Since everything is located inside one repo, you can configure your CI/CD and bundler once and then just re-use configs to build all packages before publishing them to remote. Same goes for unit, e2e, and integration tests—your CI will be able to launch all tests without having to deal with additional configuration.
- **Easily refactor global features with atomic commits**. Instead of doing a pull request for each repo, figuring out in which order to build your changes, you just need to make an atomic pull request which will contain all commits related to the feature that you are working against.

- **Re-use code with shared projects while still keeping them isolated**: Monorepo allows you to reuse your packages from other packages while keeping them isolated from one another.
- **Atomic commits across projects**: Everything works together at every commit. There's no such thing as a breaking change when you fix everything in the same commit.
- **One version of everything**: No need to worry about incompatibilities because of projects depending on conflicting versions of third party libraries.
- **Easier dependency management**: Only one **package.json**. No need to re-install dependencies in each repo whenever you want to update your dependencies.
- **Developer mobility**: Get a consistent way of building and testing applications written using different tools and technologies. Developers can confidently contribute to other teams’ applications and verify that their changes are safe.

## Drawbacks of Monorepo

Projects are not created equal and monorepos are not a silver bullet. Depending on your specific requirements, the maturity of your company and the ecosystem that your apps/libraries will live in, there will be a different approach to code source control. 
- **No way to restrict access only to some parts of the app.** Unfortunately, you can’t share only the part of your monorepo—you will have to give access to the whole codebase, which might lead to some security issues.
- **Poor Git performance when working on large-scale projects.** This issue starts to appear only on huge applications with more than a million commits and hundreds of devs doing their work simultaneously every day over the same repo.
- **Higher build time.** Because you will have a lot of source code in one place, it will take way more time for your CI to run everything in order to approve every PR
- **Source conflicts during merge** Changing a common code can impact many application components, during the merging process it sometimes becomes difficult to resolve the conflicts.
- **Deployment process** The deployment process in mono-repo can be more challenging and may need to scale the source control management system. Monorepo increased complexity of the CI/CD pipeline.
- **Coupling between the services** Separate repositories provide strong isolation between the services, but once they coexist in a single repo, there’s not much in the way of coupling, by sharing code and possibly in-process code invocations over time. This trend could lead to a strong coupling between services or eventually even to an accidental monolithic architecture.

## Polyrepo

Polyrepo is a nickname that means "using multiple repositories for the source code management version control system"
* A polyrepo architecture means using multiple repositories, rather than one repository.
* Polyrepo is also known as many-repo or multi-repo.

A polyrepo is the current standard way of developing applications: a repo for each team, application, or project. And it's common that each repo has a single build artifact, and simple build pipeline.

The industry has moved to the polyrepo way of doing things for one big reason: team autonomy. Teams want to make their own decisions about what libraries they'll use, when they'll deploy their apps or libraries, and who can contribute to or use their code.

## Benefits of polyrepo
There are number of companies adopting polyrepo due to its benefits as listed here.
*   Each service and library have its own versioning
*   Code check-outs and pulls are small and separate, thus there are no performance issues even if the project size grows
*   Teams can work independently and would not need to have access to the entire codebase
*   Faster development and flexibility
*   Each service can be released separately and have its own deployment cycle, thus making CI and CD easier to implement
*   Better access control – all teams need not have full access to all the libraries – but can get read access if they need

There are number of drawbacks of polyrepo environments.
## Drawbacks of polyrepo
Polyrepo encourages isolation, separately each repository, this decreases the team collaboration, here are few other drawbacks of using polyrepo.
* **Regular Sync** The dependencies and libraries used across services and projects have to be regularly synced to get the latest version
* **Isolated Team** Encourages a siloed culture at some point, leading to duplicate code and individual teams trying to resolve the same problem
* **Different set of best practices** Each team may follow a different set of best practices for their code causing difficulties in following common best practices
* **Polyrepo Inconsistent tooling** Each project uses its own set of commands for running tests, building, serving, linting, deploying, and so forth. Inconsistency creates mental overhead of remembering which commands to use from project to project.

## Recommendation for Repository Management

Each approach has its strengths and weaknesses, Mono-repo favors consistency, whereas multi-repo focuses on decoupling. While in a mono-repo, the entire team can see changes done by one person, multi-repo creates a separate repo for each team, who have access to only the required services. We need to determine which approach is better in our context.

Looking the nature of distributed system, poly-repo is a natural choice for microservice architecture. Normally each service is maintained by a different team that encourages the team independency, manytimes the technology stack is also different from service to service.

- Use polyrepo approach when the project teams are independent and are serving to each service.
- Use shared code libraries be distributed through nuget packages on regular basis
- Before any release take the latest nuget package that are being used in the solution and check the release notes
- Pay attention to the integration tests, if there is any issue due to other services that has been released
- The repository should be based upon a bounded context and all the related projects (API, SDK, Domain, Application, Infrastructure) should be into the same solution. One visual studio solution will comprehend one sub-domain.
- Each team should follow the same best practices that are shared by the team
- If there is a fix that needs to be done in separate repos for the same feature then the checkin description should have some linking that can be traced later.


## Resources
[1] https://geekflare.com/code-repository-strategies/
[2] https://kinsta.com/blog/monorepo-vs-multi-repo/
[3] https://circleci.com/blog/monorepo-dev-practices/
[4] https://github.com/joelparkerhenderson/monorepo-vs-polyrepo#:~:text=A%20monorepo%20architecture%20means%20using,%2Drepo%20or%20uni%2Drepo.
[5] https://semaphoreci.com/blog/what-is-monorepo
[6] https://danoncoding.com/monorepos-for-microservices-part-1-do-or-do-not-a7a9c90ad50e 
[7] https://medium.com/taxfix/scaling-microservices-architecture-using-monorepo-domain-driven-design-ced48351a36d