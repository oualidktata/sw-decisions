# 37. RxJS-Passing data using (behavior)Subject torespond to an action

Date: 2022-01-26

## Status

Accepted

## Context

The issue motivating this decision, and any context that influences or constrains the decision.

## Decision

To respond to an action, use a Subject or BehaviorSubject.

``private categorySubject = new Subject<number>();
categorySelectedAction$ = this.categorySubject.asObservable();
products$ = this.categorySelectedAction$.pipe(
  switchMap((categoryId) =>
    this.http.get<Product[]>(`${this.url}?cat=${catId}`)
  ).pipe(
    tap((data) => console.log(data)),
    catchError(this.handleError)
  )
)``

- switchMap: stops the current operation and performs the new operation
- concatMap: performs each operation one at a time, in order
- mergeMap: performs each operation concurrently

## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.
## Resources
https://www.rockyourcode.com/notes-on-rxjs-patterns-in-angular/
https://www.youtube.com/watch?v=uv_sblwIJag