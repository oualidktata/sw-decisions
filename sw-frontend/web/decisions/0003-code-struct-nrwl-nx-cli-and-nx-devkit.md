# 3. Code structure: Nrwl Nx CLI and Nx DevKit as default CLI and dev Kit.
## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|02/08/2022|O.Ktata|
|Accepted|02/08/2022|Synergy|

## Context

Most angular developers are used to rely on the default angular CLI to help them create the app's internal components. Unfortunately, the default CLI has limitations when it comes to support large enterprise front-ends in a monorepo workspace.
Nx has an alternative CLI built on top of the angular CLI. It's more suited for monorepos and large scale MFE development. It's more powerful and provide a much better DX.

The Nx devKit has helper functions that simplifies the creation of new custom schematics. It's still possible to use the default angular dev-kit if needed (not recommended).

The decision to take is whether we will go with the default angular CLI and its default devKit or use the new Nx CLI and the most advanced nx devKit from Nrwl.

## Decision
We will use Nx CLI and the Nx devKit as default tools to execute commands and generate schematics for our apps and libs instead of the angular devKit.

## Consequences

- Simpler APIs with Nx CLI and Nx Devkit: The Nx Devkit is much simpler and easier to use. It can be used in conjunction with Angular Devkit.

- Still possible to use the default angular dev-kit if required.
- Easier upgrades when Nx migrates to a newer version.
## Resources
[Nx is Modern Angular](https://blog.nrwl.io/nx-is-modern-angular-bda6cf10746d)
https://stuarttottle.medium.com/is-a-monorepo-a-good-idea-e3cbe41a84fb


