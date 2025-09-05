# Agenda
Slide 1:
-Understand Monorepos
-Benefits 
-Tooling

# Message 1: Enterprise teams have different concerns
Slide 1:
Large enterprise projects (12-100) != small or standalone projects(1-12)
Concerns:
1-Consistency:
coding best practices
application structure
2-Safety
3-Sustainability:Growing without sacrificing clarity or performance.
4-Changing requirements: How to keep technical debt in control when requirements change.
Notes:
- **Consistency** — how do we make sure everyone in the organization (which may be thousands of people) follows the same best practices for structuring and writing code?
- **Safety** — how do we ensure that our code will not be subject to attacks or prone to errors?
- **Increased size and complexity** — how can we structure our code so that it can grow without sacrificing clarity or performance?
- **Changing requirements** — how can we keep up with the demands of the business to continually update the application without letting technical debt get out of control?

# Message 2: Poly repos are the current standard
-Current standard
-One per: team, application, project
-1 artefact, 1 build pipeline
Notes:
A polyrepo is the current standard way of developing applications: a repo for each **team**, **application**, or **project**. And it's common that each repo has a **single** build artifact, and simple build pipeline.

# Message 3: drawbacks of poly repos
Slide 3.1:
Main reason to move from poly-repo is each team:
**team autonomy**
Teams don't want to depend on other repos/libraries. They want to go fast as they wish.
!['Polyrepo depends on published artifacts'](../images/code-structure/poly-repo-overview.PNG)
Notes:
The industry has moved to the **polyrepo** way of doing things for one big reason: **team autonomy**. Teams want to make their own decisions about what libraries they'll use, when they'll deploy their apps or libraries, and who can contribute to or use their code.
-Slide 3.2:
Autonomy **achieved** Isolation
Isolation **harms** collaboration
Notes:
Those are all good things, so why should teams do anything differently? Because this **autonomy** is provided by **isolation**, and isolation **harms collaboration**. More specifically, these are common drawbacks to a polyrepo environment:
## Slide 3.3: main drawbacks of poly repos:
Notes:
**Cumbersome code sharing**
**Incompatible versions** 
**Significant code duplication**
**Costly cross-repo changes to shared libraries and consumers**
**Coordination effort**
**Polyrepo Inconsistent tooling**

Notes:
**Cumbersome code sharing**: To share code across repositories, you'd likely create a repository for the shared code. Now you have to set up the tooling and CI environment, add committers to the repo, and set up package publishing so other repos can depend on it. To this there will be extra effort on reconciling **Incompatible versions** of third party libraries across repositories.
  
- **Significant code duplication**: No one wants to go through the hassle of setting up a shared repo, so teams just write their own implementations of common services and components in each repo. This **wastes up-front time**, but also increases the **burden of maintenance, security, and quality control** as the components and services change.

- **Costly cross-repo changes to shared libraries and consumers**:Consider a critical bug or breaking change in a shared library: the developer needs to set up their environment to apply the changes across multiple repositories with **disconnected revision histories**. Not to speak about the **coordination effort** of versioning and releasing the packages.

- **Polyrepo Inconsistent tooling**: Each project uses its own set of commands for running tests, building, serving, linting, deploying, and so forth. Inconsistency creates **mental overhead** of remembering which commands to use from project to project.
  
# Message 1: So what's a mono-repo
## Slide 1: Monorepo
-Architectural Concept
-One repo instead of multiple repos
-Not a monolith!


![Difference between Mono-repo, monolith and multirepo](../images/code-structure/mono-vs-poly-repos.png)

notes: 
Put simply, a mono repo is a single repository containing multiple distinct projects, with well-defined relationships.
It's an architectural concept. Instead of managing multiple repositories, you keep all your isolated code parts inside one repository. Bare in mind that **monolithic repository** has nothing in common with **monolithic app**. You can keep many kinds of logical apps inside one repo;

## Slide 2: Impact of mono repo adoption for the organization
|Sharing based on packages|Sharing based on direct access and rules |
|--|--|
|![poly](../images/code-structure/poly-repo-overview.PNG)|![mono](../images/code-structure/mono-repo-overview.PNG)|

Mono repo is all about easier  dependencies sharing but not only that:
By adding consistency, lowering the friction in creating new projects and performing large scale refactorings, by facilitating code sharing and cross-team collaboration, it'll allow our organization to work more efficiently.

## Slide 3: Consequences:
Advantages:
- One place to store all configs and tests
- Easily refactor global features with atomic commits
- Re-use code with shared projects while still keeping them isolated
- No overhead to create new projects
- Atomic commits across projects
- One version of everything
- Easier dependency management
- Developer mobility

Notes:
- **One place to store all configs and tests**. Since everything is located inside one repo, you can configure your CI/CD and bundler once and then just re-use configs to build all packages before publishing them to remote. Same goes for unit, e2e, and integration tests—your CI will be able to launch all tests without having to deal with additional configuration.
- **Easily refactor global features with atomic commits**. Instead of doing a pull request for each repo, figuring out in which order to build your changes, you just need to make an atomic pull request which will contain all commits related to the feature that you are working against.
- **Re-use code with shared projects while still keeping them isolated**: Monorepo allows you to reuse your packages from other packages while keeping them isolated from one another.
- **No overhead to create new projects**: Use the existing CI setup, and no need to publish versioned packages if all consumers are in the same repo.
- **Atomic commits across projects**: Everything works together at every commit. There's no such thing as a breaking change when you fix everything in the same commit.
- **One version of everything**: No need to worry about incompatibilities because of projects depending on conflicting versions of third party libraries.
- **Easier dependency management**: Only one **package.json**. No need to re-install dependencies in each repo whenever you want to update your dependencies.
- **Developer mobility**: Get a consistent way of building and testing applications written using different tools and technologies. Developers can confidently contribute to other teams’ applications and verify that their changes are safe.

## Slide 4: Monorepos:Who is using it why and how ?
Who: big companies: logos
Why to better share dependencies: problem they solved.

Notes: 
Engineering-led companies like Google, Facebook, and Uber

## Slide 5: The need for tooling: 
Transition: Idea icon sold!
Notes:
I hope I did sell the idea of switching to a monorepo architecture to structure, at least our FE code for our systems.

Transition: Grow -> Right tool:
 **fast**
 **understandable**
 **manageable**

Monorepos have a lot of advantages, but to make them work you need to have the right tools. As your workspace grows, the tools have to help you keep it **fast**, **understandable** and **manageable**.

let's see what features current monorepo tools are offering for these abilities:
## Slide 6.1 Fast
- Local computation caching
  ![Local computation caching](../images/code-structure/local)
- Local task orchestration
- Distributed computation caching
- Distributed task execution
- Transparent remote execution
- Detecting affected projects/packages
- **Local computation caching**: The ability to store and replay file and process output of tasks. On the same machine, you will never build or test the same thing twice.


- **Local task orchestration**: The ability to run tasks in the correct order and in parallel. All the listed tools can do it in about the same way, except Lerna, which is more limited.

![Local task orchestration](../images/code-structure/mono-local-task-orchestration.PNG)
- Distributed computation caching : The ability to share cache artifacts across different environments. This means that your whole organization, including CI agents, will never build or test the same thing twice.

![Distributed computation caching](../images/code-structure/mono-distribitued-computation-caching.PNG)
- Distributed task execution:The ability to distribute a command across many machines, while largely preserving the dev ergonomics or running it on a single machine.
![Distributed task execution](../images/code-structure/mono-distributed-task-execution.PNG)
- Transparent remote execution: The ability to execute any command on multiple machines while developing locally.
- Detecting affected projects/packages:Determine what might be affected by a change, to run only build/test affected projects.
![Detecting affected projects](../images/code-structure/mono-detecting-affected.PNG)

## Slide 6.2: Manageable
- Code sharing
- Consistent Tooling
- Code generation
![Code generation](../images/code-structure/mono-code-generation.PNG)
- Project constraints and visibility
![Constraints and visibility](../images/code-structure/mono-constraints-visibility.PNG)
Notes: Manageable
- **Code sharing**: Facilitates sharing of discrete pieces source code. Sharing could be done in different ways. For example, Nx allow any folder of files to be marked as a project and can be shared. Nx plugins help configure WebPack, Rollup, TypeScript and other tools to enable sharing without hurting dev ergonomics. In the other hand Lerna supports it only by sharing npm packages.

- **Consistent Tooling**:
The tool helps you get a consistent experience regardless of what you use to develop your projects: different JavaScript frameworks, Go, Rust, Java, etc.
In other words, the tool treats different technologies the same way.
- **Code generation**: Native support for generating code.
- **Project constraints and visibility**:
Supports definition of rules to constrain dependency relationships within the repo. For instance, developers can mark some projects as private to their team so no one else can depend on them. Developers can also mark projects based on the technology used (e.g., React or Nest.js) and make sure that backend projects don't import frontend ones.

  ## Slide 6.3: Understandable
- Workspace analysis
![Workspace analysis](../images/code-structure/mono-workspace-analysis.PNG)
- Dependency graph
![Workspace analysis](../images/code-structure/nx-dependency-graph-example.PNG)



### Slide X: Tools' comparison
![fast](../images/code-structure/mono-tools-fast-comparison.PNG)![fast](../images/code-structure/mono-tools-understandable-manageable-comparison.PNG)

## Slide 6: Not all Monorepos are created equal!
Transition 1:
Not all Monorepos are created equal!

