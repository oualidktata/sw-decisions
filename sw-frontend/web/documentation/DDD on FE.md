



## Why business logic doesn't belong in the front-end
The real challenge of front-end development
Parallels between DDD concepts and how they apply to the front-end
Good examples of using DDD concepts in the front-end

## Business Logic
These are the categories of business logic ordered from lowest level policy to highest level policy.

6. Presentation logic: Logic that's concerned with how we present something to the user.
5. Data access / adapter logic: Logic concerned with access an infrastructure laywer concern like caches, databases, front-ends, etc.
4. Application layer logic / use case: Application specific logic. In an enterprise with several different applications (think Google's Docs, Sheets, Maps, etc), each application has it's own set of use cases and policy that governs those use cases.
3. Domain layer logic: Core business that doesn't quite fit within the confines of a single entity.
2. Validation logic: Logic that ensures that objects are valid.
1. Core business logic: Logic that can be confined to a single entity. Ex: in a blog, the fact that a `comment` entity is created with `approved: true` or `approved: false` should be central the creation of a `comment` domain object.
   
## Front-End Challenges 
The goal of every front-end framework is to simplify the way that we:
- Define data (data storage)
- Signal that data changes (change detection)
- React to data changes (data flow)

- Data storage: Redux/Ngrx store architecture, service-oriented architecture, etc
- Change detection: Angular Zones, Vue's `Object.defineProperty(), React reconcilliation, etc
- React to data changes: Observables, hooks, one-way data flow, etc


These early architectural decisions have a profound impact on the quality and ease of development for the remainder of the project's lifespan.


## Sharing code between the front-end

# Resources
https://khalilstemmler.com/articles/typescript-domain-driven-design/ddd-frontend/