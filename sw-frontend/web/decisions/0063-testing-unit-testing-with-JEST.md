# 63. testing: unit testing with JEST

Date: 2022-01-26

## Status

Accepted

## Context

Why Unit test?
Jest is a testing platform, widely adapted by many large companies and swiftly adopted by the React community.
It sits on top of Jasmine, so the API is nearly identical.

## Decision

The change that we're proposing or have agreed to implement.

## Consequences

- Focuses on Developer Experience in terms of speed and ease of use.
- Provides meaningful error messages.
- Runs on Continuous Integration servers without extra tooling (abstracting the DOM with jsdom library.)
- Provides code coverage out of the box.
- Integrates with Babel and TypeScript seamlessly.