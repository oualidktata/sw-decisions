# Goal
Provide guidance on using the RxJS library on top of the architectural decisions involving data manipulation and data retrieval (facade pattern, state management, push-based architecture).
the structure of this document will be as follows:
- What is Reactive programming
- What are observables and their benefits
- High order operators
The intent is to feed the ADRs:
- 040-rxJs-usage of high order
- etc..

# RxJS benefits

# The need for High-order operator

## Why nested observables is an anti-pattern

Any time we use data emitted from an Observable to emit another Observable, we need to subscribe to both the source outer Observable and the emitted inner Observable. Instead of nested subscribes, we use higher-order mapping operators. Higher-order mapping operators map higher-order Observables and take care of subscribing and unsubscribing to the inner Observables so we don’t have to.
--- 
In the above code, we issue an Http get request to get a product’s data. This request returns our outer Observable. We subscribe to that Observable at the bottom of this code. These are marked in orange.

We process the product data within the outer Observable’s pipeline, defined with the pipe method. There, we use the `tap` operator and loop through each supplier id for the product, issuing an http get request to get the supplier data. This request returns an inner Observable for each supplier, which we subscribe to as shown in green.

This results in nested subscribes, which are problematic for several reasons. Looking at the above code, you can see how challenging it could be to unsubscribe from these Observables. It would be difficult to make this code more declarative. And how would this work with an async pipe?
---

## High order operators
This is where higher-order mapping operators can help.
High-order mapping operators transform higher-order Observables. They map each value from an outer Observable to a new inner Observable and automatically subscribe to, and unsubscribe from that inner Observable.

RxJS provides several higher-order mapping operators. You can recognize a higher-order mapping operator by its name, which ends in `map`, such as mergeMap and switchMap.

### concatMap
The concatMap higher-order mapping operator *waits* for each inner Observable to complete before processing the next one. It concatenates the results of the inner Observables in sequence.

### mergeMap
The mergeMap higher-order mapping operator processes each inner Observable in parallel. It merges the results of the inner Observables as they complete.

### switchMap
The switchMap higher-order mapping operator unsubscribes from any prior inner Observable and switches to any new inner Observable.