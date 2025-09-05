It's important, before moving forward, to clearly define Business Logic in its entirety:

## Business Logic
These are the categories of business logic ordered from lowest level policy to highest level policy[1]. In other words, from less stable to the most stable.

1. **Presentation logic**: Logic that's concerned with how we present something to the user.
2. **Data access / adapter logic**: Logic concerned with access an infrastructure layer concern like caches, databases, front-ends, etc.
3. **Application layer logic / use case**: Application specific logic. In an enterprise with several different applications (think Google's Docs, Sheets, Maps, etc), each application has it's own set of use cases and policy that governs those use cases.
4. **Domain layer logic**: Core business that doesn't quite fit within the confines of a single entity.
5. **Validation logic**: Logic that ensures that objects are valid.
6. **Core business logic**: Logic that can be confined to a single entity. Ex: in a blog, the fact that a `comment` entity is created with `approved: true` or `approved: false` should be central to the creation of a `comment` domain object.