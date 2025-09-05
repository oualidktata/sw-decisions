## Summary
Support documentation for these ADRs:
|ADR|Name|
|---|---|
|[ADR-0026](../decisions/0026-forms-reactive-forms-to-support-dynamic-forms.md)|forms-reactive-forms-to-support-dynamic-forms|
|[ADR-0002](../decisions/0027-forms-template-forms-for-simple-cases.md)|code-struct-nrwl-cli-as-default-cli|
### 1.Reactive Forms vs Template Forms

Below are some of the keys differences:

|Form Template|Reactive Form|
|-|-|
|+ Easy to start with|Learning curve(Reactive Prog.)|
|asynchronous data flow| synchronous data flow (RxJs-based)|
|- Limited for complex Scenarios|+ Ideal for complex scenarios|
|Immutable data flow|Mutable data flow|
|Less TypeScript/More HTML|More TypeScript/Less HTML|
|validation & tracking of data in the template|Business Logic in the component|
|Validation based on directives (limited)|Validation based on functions|
|Not Unit Testable|Easy to test|
|AngularJS style code|Reactive Programming|
|use FormsModule|use ReactiveFormsModule |

Both types of forms is based on these objects:

- FormControl
- FormGroup
- FormArray  
- ControlValueAccessor

---
## Reactive forms benefits?

Angular reactive forms are considered extremely **scalable**, **reusable**, and **robust** due to their:

Key features:
1. Immutability
2. Better Scalability
3. Better testability
4. Predictability
5. Consistency & structured data flow
6. Dynamic forms
#### 1.Immutability

The change-tracking method plays a role in the efficiency of your application.

**Reactive forms** keep the data model pure by providing it as an **immutable data structure**. Each time a change is triggered on the data model, the FormControl instance returns a new data model rather than updating the existing data model. This gives you the ability to track unique changes to the data model through the control's observable. Change detection is more efficient because it only needs to update on unique changes. Because data updates follow reactive patterns, you can integrate with observable operators to transform data.

**Template-driven forms** rely on **mutability** with two-way data binding to update the data model in the component as changes are made in the template. Because there are no unique changes to track on the data model when using two-way data binding, change detection is less efficient at determining when updates are required.

#### 2.Better Scalability

If forms are a central part of your application, scalability is very important. Being able to reuse form models across components is critical.

**Reactive forms** are more scalable than template-driven forms. They provide direct access to the underlying form API, and use synchronous data flow between the view and the data model, which makes creating large-scale forms easier. Reactive forms require less setup for testing, and testing does not require deep understanding of change detection to properly test form updates and validation.

**Template-driven forms** focus on simple scenarios and are not as reusable. They abstract away the underlying form API, and use asynchronous data flow between the view and the data model. The abstraction of template-driven forms also affects testing. Tests are deeply reliant on manual change detection execution to run properly, and require more setup.
#### 2.Better testability

Testing is pretty straightforward with reactive forms and requires less setup. When it comes to large applications this is very beneficial. Here, you get a synchronous access to streams of input and the possibility to test the form and data models **without having to render UI**.

#### 3.Predictability

Reactive forms are built around observable streams which track every unique change in the form and allow you to **access input values synchronously** (thanks to the well-structured data flow). Which, in turn, makes reactive forms highly predictable.

#### 4.Consistency & structured data flow

The data flow in Angular reactive forms is well-structured because the form logic is led by the component class. This enables you to add validator functions directly to the FormControl instance in the component class. Whenever a change occurs, Angular calls these functions.
#### 6.Dynamic forms

The technique is particularly useful when you have a type of form whose content must change frequently to meet rapidly changing business and regulatory requirements. A typical use-case is a questionnaire. You might need to get input from users in different contexts. The format and style of the forms a user sees should remain constant, while the actual questions you need to ask vary with the context.

---


## Angular 14 Typed Forms...
More to come... still hot!

## Resources
[1] https://angular.io/guide/forms-overview
[2] Validation: https://www.infragistics.com/products/ignite-ui-angular/angular/components/angular-reactive-form-validation
[3] Dynamic Forms: https://angular.io/guide/dynamic-form