# 59. observability: error handling starategy

Date: 2022-01-26

## Status

Accepted

## Context

The issue motivating this decision, and any context that influences or constrains the decision.

## Decision

Handle errors globally
Handle Http errors using custom Http interceptor
Handle RxJs errors according to documentation

## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.

## Resources

[1] [strategy](../documentation/observability-part-1-logging-strategy-in-angular-apps.md)
[2] [default error handling library](../documentation/observability-part-2-sentry-as-default-library.md)
[3] [sentry ecosystem](../documentation/observability-part-2-sentry-ecosystem.md)
[4] [error handling in RxJs](../documentation/observability-part-4-handle-errors-RxJs.md)