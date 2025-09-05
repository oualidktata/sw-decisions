# 83. Forms:Template forms for simple cases

Date: 2022-01-24

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|23/06/2022|O.Ktata|
|Accepted||Synergy|

## Context

Reactive forms and template-driven forms process and manage form data differently. Each approach offers different advantages.

Reactive forms provide **direct, explicit access** to the underlying forms object model. Compared to template-driven forms, they are more robust: they're more **scalable**, **reusable**, and **testable**. If forms are a key part of your application, or you're already using reactive patterns for building your application, use reactive forms.

Template-driven forms rely on directives in the template to create and manipulate the underlying object model. They are useful for adding a **simple form** to an app, such as an email list signup form. They're straightforward to add to an app, but they don't scale as well as reactive forms. If you have **very basic form** requirements and logic that can be managed solely in the template, template-driven forms could be a good fit.

For more details: [Supporting doc.: forms-part-1-introduction](../documentation/forms-part-1-introduction.md)

## Decision

We will be using only reactive forms for simple and complex scenarios. the reason for that is because we will be building schematics and UI components on top of reactive forms leveraging reactive programming.  So instead of having two paths when building such capabilities, we will be only focusing on reactive forms. We also believe that Reactive Form is the future for forms(especially with Typed-Forms in version 14+). We also don't see any tangible drawbacks by using Reactive forms in simple scenarios.

## Consequences
- Front-End team focusing on Reactive forms path.
- Better scalability
- Better efficiency
- Better consistency & predictability
- Better testability
- Better DX (strongly-Typed reactive forms)
- Better Integration with reactive programming
- Better support for dynamic forms
- More effort to learn
## Resources
[Supporting doc.: forms-part-1-introduction](../documentation/forms-part-1-introduction.md)
[Official Doc. on Forms](https://angular.io/guide/forms-overview)
