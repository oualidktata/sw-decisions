https://docs.sentry.io/product/sentry-basics/key-terms/

Sentry covers parts of the observaility requirements and it covers them well:
- Automatic error handling
- Tracing errors: through breadcrumb
- Aggregate errors
- 

Sentry automatically captures errors, uncaught exceptions, and unhandled rejections, as well as other types of errors, depending on platform.

Sentry SDK:

sentry.io: allows visualization of errors and transactions. It allows the team to manage issues.

event: error or transaction

transaction - A transaction represents a single instance of a service being called to support an operation you want to measure or track, like a page load, page navigation, or asynchronous task. Transaction events are grouped by the transaction name.

issues - An issue is a grouping of similar error events. Every error event has a set of characteristics called its fingerprintThe set of characteristics that define an event., which is what Sentry uses to group them. For example, Sentry groups events together when they are triggered by the same part of your code. This grouping of events into issues allows you to see how frequently a problem is happening and how many users it's affecting.


data - Anything you send to Sentry. This includes, events (errors or transactions), attachments, and event metadata.

DSN - Data Source Name. A DSN tells the Sentry SDK where to send events so the events are associated with the correct project.

performance monitoring - Performance monitoring is the act of tracking application performance and measuring metrics such as how many transactions are being sent and the average response time for all occurrences of a given transaction. To do this, Sentry captures distributed traces consisting of transactions and spans to measure individual services, as well as operations within those services.

# Tracing with Sentry
Why Tracing?
Applications typically consist of interconnected components, which are also called services. As an example, let's look at a modern web application, composed of the following components, separated by network boundaries:

Frontend (Single-Page Application)
Backend (REST API)
Task Queue
Database Server
Cron Job Scheduler
Each of these components may be written in a different language on a different platform. Each can be instrumented individually using a Sentry SDK to capture error data or crash reports, but that instrumentation doesn't provide the full picture, as each piece is considered separately. Tracing allows you to tie all of the data together.

In our example web application, tracingThe process of logging the events that took place during a request, often across multiple services. means being able to follow a request from the frontend to the backend and back, pulling in data from any background tasks or notification jobs that request creates. Not only does this allow you to correlate Sentry error reports, to see how an error in one service may have propagated to another, but it also allows you to gain stronger insights into which services may be having a negative impact on your application's overall performance.

Before learning how to enable tracing in your application, it helps to understand a few key terms and how they relate to one another.

Traces, Transactions, and Spans
A trace represents the record of the entire operation you want to measure or track - like page load, an instance of a user completing some action in your application, or a cron job in your backend. When a trace includes work in multiple services, such as those listed above, it's called a distributed trace, because the trace is distributed across those services.

Each trace consists of one or more tree-like structures called transactions, the nodes of which are called spans. In most cases, each transaction represents a single instance of a service being called, and each span within that transaction represents that service performing a single unit of work, whether calling a function within that service or making a call to a different service. Here's an example trace, broken down into transactions and spans: