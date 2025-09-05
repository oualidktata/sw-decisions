# 36. RxJS-Declarative data Retrieving

Date: 2022-01-26

## Status

Accepted

## Context

Why use declarative?
To compose streams

## Decision

``products$ = this.http.get<Product[]>(this.productsUrl).pipe(
  tap((data) => console.log(JSON.stringify(data))),
  catchError(this.handleError)
)``

``products$ = this.productService.products$``
Use the async pipe in the template.

## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.
## Resources
https://www.rockyourcode.com/notes-on-rxjs-patterns-in-angular/
https://www.youtube.com/watch?v=uv_sblwIJag
Data composition With RxJS: https://www.youtube.com/watch?v=Z76QlSpYcck