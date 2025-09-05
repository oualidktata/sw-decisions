# 17. BFF-authN strategy

Date: 2022-01-18

## Status

Accepted

## Context

This document describes how a JavaScript frontend can delegate access token acquisition to a backend component. In so doing, the frontend can access resource servers directly without taking on the burden of communicating with the authorization server, persisting tokens, and performing complex operations within the user agent that would require configuration, error management and reliance on authorization server capabilities (such as refresh token rotation) that aren't widely available today.


## Decision

The change that we're proposing or have agreed to implement.

## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.
## Resources
https://datatracker.ietf.org/doc/draft-bertocci-oauth2-tmi-bff/

https://www.ietf.org/archive/id/draft-bertocci-oauth2-tmi-bff-01.txt

Complete https://dev.to/damikun/web-app-security-understanding-the-meaning-of-the-bff-pattern-i85