# 62. Observability: Governance: What to enable in Sentry.io

Date: 2022-01-26

## Status

Accepted

## Context

Logs, metrics, and traces serve their own unique purpose and are complementary. In unison, they provide maximum visibility into the behavior of distributed systems. 

## Decision

Instrument the angular App to support the following:
- Handle errors globally by  implementing a SentryErrorHandler
- Save sentry configuration securely
- Aggregate errors by release
- Enable tracing with sample rate of 0.2 in production
- Init user scope (user.name) to sentry as soon as user authenticates.
- 

For the details on how to setup sentry in your angular app please refer to the guidance in the supporting documentation and the developer cookbooks.

## Consequences

Provide maximum debugging experience for developer and support team

## Resources

[](../documentation/observability-part-1-logging-strategy-in-angular-apps.md)
[](../documentation/observability-part-2-sentry-as-default-library.md)
[](../documentation/observability-part-2-sentry-ecosystem.md)
