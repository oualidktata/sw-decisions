# 1. Code structure: Mono repos over multi repo for FE

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|02/08/2022|O.Ktata|
|Accepted|02/08/2022|Synergy|

## Context

Isolating code in multiple repos or developing a monolith app in a single repo are out-of-date workspace strategies. They might be still relevant for a very small team or project but they are no longer valid when it comes to large scale and enterprise applications.

In ERA, our vision for the Front-End development promotes team autonomy, not through isolation but rather through easy sharing and cross-team collaboration at the organizational level.

For decades, code was shared by publishing npm packages. Sharing dependencies  is one of the major limitations of polyrepos. In pursuit of autonomy, teams duplicate code in order to escape shared dependencies hell.
For large scale projects these limitations needs to be addressed in order to improve the DX and ensure the sustainability of our solutions. Safety, quality and consistency are among the main factors to look at for a better workspace organization. 

Monorepos provide a serious alternative by answering most of the limitations related to polyrepos. 

## Decision

Even though a monorepo for the whole organization provides a lot of value from day 1, it's wise to wait till we are better equipped and more mature to make this happen. We think that a progressive adoption of monorepos for large projects or product lines across teams and business units will greatly ease the transition to a corporate monorepo.

```
Quick reminder:
A large project (i.e.: Customer portal) is characterized by:
- large teams working on them;
- takes more than 6 months;
- maintenance is important because the software lifecycle is long in duration.
- Sound architecture, good software design, security concerns, modularity have tremendous impact of the sustainability of the solution.
A product line is a family of related application programs such as DPHM or PLM or customer service 
```

**Final decision**: We decided to adopt a mono repo strategy for large scale projects and for product lines in business units. It's recommended to have **One monorepo per business unit** for isolated small projects instead of polyrepos.

## Consequences
### Advantages

- **One place to store all configs and tests**: Since everything is located inside one repo, we can configure our CI/CD and bundler once and then just re-use configs to build all packages before publishing them to remote. Same goes for unit, e2e, and integration tests—Our CI will be able to launch all tests without having to deal with additional configuration.
- **Easily refactor global features with atomic commits**: Instead of doing a pull request for each repo, figuring out in which order to build our changes, we just need to make an atomic pull request which will contain all commits related to the feature that we are working against.
- **Easier dependency management**: Only one package.json. No need to re-install dependencies in each repo whenever we want to update our dependencies.
- **Flexibility**: It's easy to move projects from mono-repo to polyrepo when needed.

### Limitations:
- No way to restrict access only to some parts of the app: Unfortunately, we can’t share only a part of the monorepo—we need to give access to the whole codebase, which might lead to some security issues. But since we are planning to have a monorepo for a product line or one large scale app, this will not be an big issue. Governance will be established in a later step to address this.

- Higher build time. Because the whole source code will be in one place, it will take way more time for our CI to run everything in order to approve every PR. Tools greatly attenuate this limitation (build,test and lint only for affected projects).This should only be an issue if we change a very low level component that is used everywhere!
- Enforce Trunk-based branching and frequent commits along with feature flags: to work well monorepos work best with trunk-based branching strategy. For an optimal CI/CD pipelines, it's already recommended to adopt trunk-based branching over feature-branching or environment branching. So we are in the same improvement path with devOps.

## Related
Look at all other decisions related to code structure and their respective documentation.

## Resources
[1][Supporting documentation](../documentation/code%20structure-part-1-mono-repos-vs-poly-repo.md)

[2][Guide to Monorepos for Front-end Code](https://www.toptal.com/front-end/guide-to-monorepos)

[3][Free book on MFE by Manfred S.](https://www.angulararchitects.io/en/book/ )

[4][monorepo tools](https://monorepo.tools/)