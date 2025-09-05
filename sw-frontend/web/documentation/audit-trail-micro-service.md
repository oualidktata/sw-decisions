# What's an audit trail
An audit trail, also known as an audit log, is a chronological set of records that provides documentary evidence. The purpose of an audit trail can be used to trace a specific event, operation, or procedure.

An Audit Trail (or Audit Log) is an account of the operations that someone has performed, in a chronological order. Each audit record captures at least this basic information:

1- Operation that was performed;
2- Identity of the user who performed the operation;
3- Resource on which the operation was performed;
4- Time at which the operation was performed.

It aims at answering who did what, and when. 
Auditing helps in:

Regulatory compliance, as it’s a kind of documentary evidence that can be used to track changes.
Detecting security violations.
Debugging issues.


it’s a common functionality required by many microservices. 

Audit Service
This microservice is primarily responsible for:

1- Storing audits.
2- Providing query & filter capabilities on audits.
3- Exporting audits.
4- Deleting audits beyond the retention period.
5- Enforcing access control on audits.

## Some of the salient features of this service are:

- All the APIs are access controlled to ensure only authorized users can read audits.
- There is a background job which runs inside this service to ensure audits beyond retention period are deleted periodically.
- Works with any database

- How to integrate with consumers

The goal of every microservice or monolith app is to capture the operations being executed inside them as an audit trail.

Registering the audit is easy: just call the API of the auditing service. However, the most important technical consideration on the client side is how to capture the operation as an audit record in the first place.

Let’s look at few options:

The service could be called in different ways:

- **Embed Audit Code In the Service Business Logic**: Each service method can create an audit record and save it with the auditing service. In this approach, audit log code and business logic gets mixed up, which makes it unmaintainable. Also, developers can forget to write audit logging code. This makes this approach error-prone.
- Aspect-Oriented Programming (AOP): Use Aspect-Oriented framework like Spring to intercept method calls and save audits. However, the AOP framework only has access to method name and arguments, so it’s difficult to determine the object on which the operation is being performed, and generate an enriched business-oriented audit record.
- Change Data Capture: Find out operations that happened via transaction log maintained by databases, and generate an audit record from them. This approach has a high coupling to the underlying DB technology. Frameworks like Debezium simplify change data capture by abstracting out DB-specific implementations. But this approach still has high operational and maintenance (code to translate DB row level changes to high level business-oriented audit record) overhead, something we would like to avoid. 

-For legacy systems we can embed the calls to the audit trail just before saving the data in the Data Access Layer.
- For modern and Domain driven designed systems, we would recommend capturing audits across microservices through raised Domain Events. Domain events are agnostic of the technology stack in use.

# Advantages of This Approach
**Low Maintenance**: Domain Events are part of the domain. They are captured at the business layer. Hence, It’s very easy to translate them to Audit records. Service layer code is not polluted with audit logging code.
**No Need for Middleware**: Domain Events are persisted in the service’s data store first, which acts as a persistent queue. An event would continue to be dispatched to all the listeners for processing until all of them have processed the event successfully. Hence, even if the auditing service is not available for some duration, it's not an issue. The event would continue to be retried until the audit is successfully registered!
This approach implements the Transactional Outbox Pattern.(https://microservices.io/patterns/data/transactional-outbox.html).


# Structure of the audit trail



# Resources
[1] https://harness.io/blog/audit-trails-technical