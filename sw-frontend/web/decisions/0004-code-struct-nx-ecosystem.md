# 04. Code structure: Nx Ecosystem supporting tools

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|02/08/2022|O.Ktata|
|Accepted|02/08/2022|Synergy|

## Context

Nx lives in a broader ecosystem where it integrates with numerous other well-established tools and extensions.

For testing and linting, it relies on:
- Cypress: e2e testing
- Storybook: Building UI components in isolation
- Jest: unit testing framework
- ESLint: Linting code

Interesting 3rd party plugins:
- @angular-architects/ddd: support for DDD arch. from Manfred Steyer
- nx-dotnet: Support integration with .Net.
- @nx-clean/plugin-core: Support clean architecture
- @Ignite/UI: support integration with Ignite Grid.

VsCode extension: 
- Nx Console greatly simplifies workspace management
(In progress) Lerna: extend Nx workspace with package centric monorepos.
## Decision

1. We will be using the recommended testing and linting tools supported by Nx:
  - Cypress: e2e testing
  - Storybook: Building UI components in isolation
  - Jest: unit testing framework
  - ESLint: Linting code
The migration of these tools will be smoother when the NX workspace is migrated to a newer version.

2. We will not adopt 3rd party plugins **officially** on our workspace. Instead, we will be developing our own plugins inspired by 3rd party's good practices and tailored to our architecture (main sources: DDD plugin and nx-clean).

3. For UI components, we will compose our schematics with the official Ignite generators when compatible.

## Consequences

By relying on Nrwl Nx official plugin, testing and linting tools, we will benefit from:
- Best-in class tools in the FE industry.
- Applying recommended best practices in current FE development.
- A smoother and more stable upgrades provided by Nx when migrating.
  
By getting inspired by 3rd party plugin:
- We will be more autonomous on growing our own tailored generators using our own technology stack.
- We will not be constrained by 3rd party deployment cycles when Nx upgrade since there is always a delay from 3rd party maintainers to upgrade. We also, reduce the risk due to loosing interest by maintainers.

For official-vendor-specific plugin, such ignite UI, we benefit from:
- Stable generators from the creators of the UI lib.
- Less work for us to create schematics.
N.B.: We need to pay attention to the compatibility with these schematics to ensure consistency and stability with Nx tooling since these schematics are created by the angular devKit and meant for a traditional angular workspace. This might not be that problematic since angular devKit is compatible with Nx-devKit. It simply may require more work to decide where files will be located in our workspace.

## References
[1] [code structure-part-1-mono-repos-vs-poly-repo](../documentation/code%20structure-part-1-mono-repos-vs-poly-repo.md)

[2] [code-structure-part-2-mono-repos-with-nx](../documentation/code-structure-part-2-mono-repos-with-nx.md)