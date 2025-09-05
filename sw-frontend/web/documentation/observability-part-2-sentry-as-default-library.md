Error tracking and monitoring are an worthy investment that can provide us a lot of value. It is most perceivable in the long term when our application grows, introducing more features (and consequentially more bugs) and starting to bring more users along.

Sentry is one of the many tools we can use to aid us on monitoring our applications and trying to capture errors before our users do, along with providing more information on them.

## ErrorHandling in Angular [5]
Implementing ErrorHandler in angular is the way
Automatically Send Errors with ErrorHandler

1- Use A global Error Handler to handle all exceptions.
2- Do not swallow the exception, rethrow in order to let global error handling do his job.
3- Do not use try catch
4- Follow error handling best practices for RxJs (documentation: Error Handling for RxJs)


# Sentry features with Angular [3]
Sentry's SDKs enable automatic reporting of errors and exceptions:

- Provide context : user that triggered the error and what let to it.
- Breadcrumbs allows to follow the user's actions leading to the error.
- Enrich the information by providing more context to the configured scope: SetUser


## Best practices using Sentry Instrumentation
  ```
  Sentry.configureScope((scope) => {
  scope.setUser({
    'id': 'my-user-id',
    'username': 'my-user-username',
    'email': 'my-user-email@email.com'
    });
  });
  ```
  Sending users to Sentry will unlock a number of features, primarily the ability to drill down into the number of users affecting an issue, as well to get a broader sense about the quality of the application.

- Adding tags to the logging scope makes grouping logs much easier later on. Tags could include: hostname, os platform or user's language
- Custom information: It's possible to create your own key/value pair of custom data. It's recommended to add a lot of information to the payload for performance reasons.
- Relate issues to releases: this helps identify errors related to a specific version. Supporting releases requires a change in the initialization of the sentry lib:

```
import { version } from '../../package.json';
Sentry.init({
  dsn: <YOUR DSN, WHICH SENTRY GENERATES FOR YOU>,
  environment: environment.production ? 'prod' : 'dev',
  release: 'my-app-name@' + version,
  integrations: [
    new RewriteFrames()
  ]
});
```

By doing so, every release will have its own logs grouped together. Please note that the release value has to be unique in the organization.

- SourceMaps:Providing Sentry with our source map is extremely useful for tracking errors. Without the source map, we are looking at the final generated.
To achieve this we need to upload the source maps to Sentry. this could be done using the sentry-cli.


## More Sentry packages:
Besides the high-level SDKs, the official sentry:

- @sentry/tracing: Provides Integrations and extensions for Performance Monitoring / Tracing
- @sentry/hub: Global state management of SDKs
- @sentry/core: The base for all JavaScript SDKs with interfaces, type definitions and base classes.
- @sentry/utils: A set of helpers and utility functions useful for various SDKs.
- @sentry/types: Types used in all packages.

The most important one is the Tracing capability.

### tracing [5] [6]
Distributed tracing **enable performance monitoring to augment your existing error data**, tracingThe process of logging the events that took place during a request, often across multiple services. interactions from the frontend to the backend. With tracing, Sentry tracks your software performance, measures metrics like throughput and latency, and displays the impact of errors across multiple systems. **Tracing makes Sentry a more complete monitoring solution**, helping you diagnose problems and measure your application's overall health more quickly. Tracing in Sentry provides insights such as:

- What occurred for a specific error event or issue
- The conditions that cause bottlenecks or latency issues in your application
- The endpoints or operations that consume the most time

@sentry/angular exports a Trace Service, Directive and Decorators that leverage the @sentry/tracing Tracing integration to add Angular related spans to transactions. If the Tracing integration is not enabled, this functionality will not work. The service itself **tracks route changes and durations**, where directive and decorators are tracking components initializations. after initializing the Tracing in AppModule or APP_INITIALIZER, it can be used like this:
1. using a the directive trace:
```
<app-header trace="header"></app-header>
<articles-list trace="articles-list"></articles-list>
<app-footer trace="footer"></app-footer>
```
2. Class decorator:

```
import { TraceClassDecorator } from '@sentry/angular';

@Component({
  selector: 'layout-header',
  templateUrl: './header.component.html',
})
@TraceClassDecorator()
export class HeaderComponent {
  // ...
}
```
3. Method decorator
```
export class FooterComponent implements OnInit {
  @TraceMethodDecorator()
  ngOnInit() {}
}
```
4. GetActiveTransaction allows you to expand the current active tracing and add custom tracing.

## distributed tracing:
https://opsmatters.com/videos/distributed-tracing-sentry-how-find-root-cause-errors-across-applications
## Benefits:
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


## Governance on What and how to log errors?
1- What to feature to enable
2- What to whitelist or blacklist
3- How to trace errors

# Resources
[1] 
[2] https://www.codemag.com/article/1711021/Logging-in-Angular-Applications
[3] https://medium.com/loftbr/angular-sentry-application-monitoring-with-releases-source-maps-d73e72e873c8
[4] https://www.npmjs.com/package/@sentry/angular
[5] https://docs.sentry.io/platforms/javascript/guides/angular/
[6] https://docs.sentry.io/product/sentry-basics/tracing/distributed-tracing/