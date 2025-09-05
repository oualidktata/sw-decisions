# 39. RxJS Retrieve related data pattern (one-to-one)

Date: 2022-01-26

## Status

Accepted

## Context

The issue motivating this decision, and any context that influences or constrains the decision.

## Decision

The change that we're proposing or have agreed to implement.
### One-to-One
``selectedProduct$ = this.productSelectedAction$.pipe(
  switchMap((categoryId) => this.http.get<Product>(`${this.url}?/${id}`)).pipe(
    tap((data) => console.log(data)),
    catchError(this.handleError)
  )
) ``


``productSupplier$ = this.selectedProduct$.pipe(
  switchMap((product) =>
    this.http.get<Supplier>(`${this.url}/${product.supplierId}`)
  )
)``

---
### One-to-Many
``productSuppliers$ = this.selectedProduct$.pipe(
  switchMap((product) =>
    forkJoin(
      product.supplierIds.map((supplierId) =>
        this.http.get<Supplier>(`${this.url}/${supplierId}`)
      )
    )
  )
)``
## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.
## Resources
https://www.rockyourcode.com/notes-on-rxjs-patterns-in-angular/
https://www.youtube.com/watch?v=uv_sblwIJag