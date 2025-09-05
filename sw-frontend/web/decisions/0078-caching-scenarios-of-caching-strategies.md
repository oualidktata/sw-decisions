# 78. Response caching strategies

Date: 2022-01-18

## Status

Accepted

## Context

Caching is a technique that improve performance of systems. The web has built-in support for caching. Multiple ways could be used to cache responses:
**Client-Side caching** :
Client-Side caching helps reduce network calls. It's the fastest way of reducing load on downstream services. The client is in charge of caching making it difficult to reuse in other consumers. Invalidating client-side caching is trickier and it's based on the downstream service providing with hints to when to perform a new request.
**Proxy-Side caching**:
A proxy is placed in between the FE and the BE services. Reverse proxies and CDNs are good examples.
**Server-Side caching**:

## Decision

When to use **client-Side** caching and How:

When to use **proxy-Side** caching and How:

When to use **server-Side** caching and How:
## Resources


## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.
