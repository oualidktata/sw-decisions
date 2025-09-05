# 40. RxJS-Usage of high order observables

Date: 2022-01-26

## Status

Accepted

## Context

The issue motivating this decision, and any context that influences or constrains the decision.

Use case and how to properly use High-order observables with join operators (switchAll,mergeAll,concatAll)
What *is* a higher-order Observable?
What are inner and outer Observables?
And what is the purpose of a higher-order mapping operator, such as switchMap?

A higher-order Observable is an Observable that emits other Observables.
High-order mapping operators transform higher-order Observables. They map each value from an outer Observable to a new inner Observable and automatically subscribe to, and unsubscribe from that inner Observable.
## Decision
concatMap: The concatMap higher-order mapping operator *waits* for each inner Observable to complete before processing the next one. It concatenates the results of the inner Observables in sequence.

switchMap: stops the current operation and performs the new operation
concatMap: performs each operation one at a time, in order
mergeMap: performs each operation concurrently


## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.

# Resources
https://blogs.msmvps.com/deborahk/higher-order-observable/
