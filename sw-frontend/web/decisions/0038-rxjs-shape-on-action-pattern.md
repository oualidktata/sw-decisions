# 38. RxJS-Shape on action pattern

Date: 2022-01-26

## Status

Accepted

## Context

The issue motivating this decision, and any context that influences or constrains the decision.

## Decision

Shape on Action Pattern
``products$ = this.categorySelectedAction$.pipe(
  switchMap((categoryId) =>
    this.http.get<Product[]>(`${this.url}?cat=${catId}`)
  ).pipe(
    tap((data) => console.log(data)),
    catchError(this.handleError)
  ))``

``private categorySubject = new Subject<number>();
categorySelectedAction$ = this.categorySubject.asObservable();``
combineLatest: emits a combined value when any of the Observables emits; won’t emit until all Observables have emitted at least once
merge: emits one value when any of the Observables emit
forkJoin: when all Observables complete, emit the last value from each Observable into an array

``selectedProducts$ = combineLatest([
  this.products$,
  this.productSelectedAction$,
]).pipe(
  map((products, selectedProductId) =>
    products.find((product) => product.id === selectedProdudctId)
  )
)``

## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.
## Resources
https://www.rockyourcode.com/notes-on-rxjs-patterns-in-angular/
https://www.youtube.com/watch?v=uv_sblwIJag