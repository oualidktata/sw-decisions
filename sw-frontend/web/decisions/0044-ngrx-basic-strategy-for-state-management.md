# 44. NgRx-basic strategy for state management

Date: 2022-01-26

## Status

Accepted

## Context



Unlike backend applications, which use databases for state management, frontend applications need some sort of mechanism for handling data. This data can range from server responses gotten from HTTP request, to form input data and user routes.

It’s a good practice to compose all your application state in a central store for easy management and data communication. So, basically, our state is a representation of our application that actually lives in the store.

**What is NgRx?**
NgRx is a group of Angular libraries for reactive extensions and state management. The NgRx Store is a Redux-inspired state management system that enables you to use observables to manage state in an Angular application. 

A complete state management system should enable you to model a state — e.g., create a simple representation of what the state should look like, update its value, monitor the state when the value changes, and retrieve the values of the state.

Libraries included in the NgRx package include:

- Store
- Effects
- Entity
- ComponentStore
- Router Store

![CDC Overview](../images/ngrx/redux-state-management-process.png)
## Decision

The change that we're proposing or have agreed to implement.

## Consequences

The primary advantage to using the NgRx Store is the ability to store all state in a single tree that is accessible from any part of the application. It makes Angular development easier by simplifying the application’s state in objects and enforcing unidirectional data flow.
### Advantages
- The store acts as single source of truth
- The store reduces the communication between components which is particularly helpful to scale our app without adding more complexity.
- The store on the client acts also as a local cache of data. The app can render items instantly if they already exist in the stored state.
- The app is more predictable and easier to understand because the Redux pattern prevents the mutation of state in multiple locations in the app. All components uses the same data flow. 
  
### Cons
## Resources
https://blog.logrocket.com/angular-state-management-made-simple-with-ngrx/