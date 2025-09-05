# 12. Architecture: SCAMs

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|05/08/2022|O.Ktata|
|Accepted|05/08/2022|Synergy|

## Context


## Decision

Standalone components are introduced in Angular 14.x to replace the SCAM pattern. We will be recommending SCAM for projects created prior to Angular 14. Newer version should make use of the standalone feature.
## Consequences

- Testing components is easier with SCAMs;
- Identifying unused imports is easier with SCAMs;
- Using SCAMs, we only have to consider a single component template to check whether we have unused imported Angular modules.

- Code-splitting on the component level
## Resources
![architecture-part-8-SCAMs-Standalone](../documentation/architecture-part-8-SCAMs-Standalone.md)