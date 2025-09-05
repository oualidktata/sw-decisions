# 60. observability-sentry.io as default solution to error monitoring in FE

Date: 2022-01-26

## Status


|Status|Date|Validated by|
|------|----|------------|
|Proposed|02/02/2022|O.Ktata|
|Accepted|02/08/2022|Synergy|

## Context

Today, frontend applications are as complex as backend services. Part of observability is the ability to monitor performance and trace errors to the right user action that triggered them.Thus, every FE application require proper logging of errors and better insight on performance bottlenecks. 

Many front-end libraries and options are available to the development team. Logging libraries such as ngx-logger, custom service logging or even simply relying on console logs are some of the options to consider. However, for enterprise and large-scale apps with multiple and frequent releases, it's important to consider a much holistic approach that provides better visibility on **errors** and the application performance at run-time. 

We need to consider how we can improve the debugging experience, usually performed by support teams.

Errors should be logged with enough context in order to be efficient at fixing the issue at hand. Because not all errors could be known in advance and handled gracefully, a framework should be put in place to always provide default error handling aiming at providing the best user experience.

Currently, PWC have access to sentry.io and benefits from all the advantages of a best in-class error handling and monitoring platforms.

Sentry has an extensive Angular Library and a myriad of integrations with developer centric tools such as Jira or ADS.

Compared to the general purpose Opentelemtry based libraries, Sentry has a more tailored approach to error handling and fully maximise the debugging experience when configured and governed right.

This decision is about choosing the FE Error Handling library and platform that allows for customized error logging and managing them efficiently.


## Decision

Sentry angular Library and Sentry.io platform are chosen over general purpose logging libraries such ngx-logging or opentelemetry collectors.
Sentry has unmatched error management and alerting capabilities.

## Consequences
- Easy to setup in angular;
- Well documented
- Light-weight compared to ELK or other full-blow APMs (logging, tracing, metrics)
- Allow for UI tracing through Breadcrumb;
- Easy tracing instrumentation;
- Best in-class error management: 
  * Assign issues based on Suspect commit: the right user that committed the code responsible for the error.
  * Grouping events into issues.
- Provide Integrations with Jira,AzureDevOps, Git, Teams,Grafana,Twilio (SMS) and more, 
  * for issue tracking
  * for stackTrace link
  * for visualization 
  * for alerting
  * for incident management
  * for release management
  * for chatting
  * Web hooks
- Rate limiting
- Fingerprints:
  * Aggregate by events into issues by fingerprint:stack trace, error type and error message as fingerprint.
  * All events have fingerprint. Events with same fingerprint are grouped into an issue.
  * Ability to change and create custom fingerprints.
- Releases:
  * Ability to track errors by releases.A release in sentry is a version of our code deployed in prod.
- Data scrubbing:
  * Default Data Scrubbing: in server: Global sensitive fields
  * Advanced data scrubbing: Field Credit card, anonymise
-Alerting
  * Ability to manage alerts governed by teams in projects. a team can have multiple projects. Projects can be shared by multiple teams.
  * Advanced alert triggering rules: regression errors, etc
- Supports browser security features
  * Support for Content Security Policy(CSP), a security standard that prevents XSS.
  * Support for Certificate Transparency (CT), a security standard that helps track and identify valid certificate.
  * Support for HTTP Public Key Pinning, a security feature aiming at reducing the risk of Man in the middle (MITM) attacks with forged certificates.