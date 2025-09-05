# dealing with Errors

1- Handling error in Angular
    1- Proper Error handling strategy (service)
        - service or Global **httpInterceptor**: retry,logError and rethrow
        - UI component: display a nice message
        - UI component: catchError to change expected data 
        - UI component: rethrow
    2- Gracefully handle error inside the app
    3- custom ErrorHandler
        
    3- Error logging to remote logging service (sentry.io)

2a- Logging: Log Errors using Sentry and monitor them in Sentry.io
    - Instrument with Sentry Library
      - Use sentry tags to customize the logs:
        - email,user
      - SentryErrorHandler that implements ErroHandler
        - Sentry.captureException(error.originalError)
      - Inside HttpInterceptor, import sentry
    - Proper configuration of sentry
2b- Monitor and alert with sentry.io
      - group by release,
      - Aggregate error with same stack
      - Breadcrumb
      - **deobfuscate** the stacktrace by uploading source maps since the original stacktrace will be minified.
3- Tracing: Add tracing with sentry and monitor them in Sentry.io
    - Integrations:
      - BrowserTracing:
        - routing origins //TODO to be test with MFE
        - routing instrumentation
        - 
    - traceSampleRate: //TODO: prod values/dev value(1.0)

4- Final recommended Sentry config and integrations (configured in environment):
    1- dsn:
    2- environment: local,dev,qa and prod from environment.
    3- browserTracing integration (tracing Origining and routing instrumentation)
    4- provide ErrorHandler with showDialog:false
    5- provide SentryTraceService with deps [router]

## Why sentry over open telemetry:
open telemetry has no proper collector  for angular. last one only supports A9
feature rich


# Error handling strategy

## Custom Global Error Handler

Custom Global handler: for uncaught errors. 
The base errorHandler handles it outside Angular zone. this will lead to undesired UI display of error message.Thus we need to inject NgZone to handle error inside Angular Zone. 

## Handle error silently:
use catch and replace strategy by using catchError from RxJs library.
inside the component:
returned to empty array or empty object.
The order is very important.

### Catch the error at the service level:
catchError: and rethrow the same or new error. this will allow the component to nicely display the error in a banner and catch it again and display No Items found. 

### Capture the error at the component level to:
1- **Show the error** first in the UI : using tap ()-> show a message to the user in a banner for example.
2- then, **catch the error**: using CatchError that return of([]). this will change the errored stream and replaced with a valid empty stream.  For instance, a 'no items available' message could be displayed instead of the list. 
This last step will swallow the error and the global error handler will not handle it.

The recommendation is:
If you need to change the stream to a default empty stream, catch it at the component level.
If you only need to display the error, let the Global handler handle it.

If it make sense to alter the result and still want the global handler to capture it, rethrow the error.
## HTTP Global handling using Interceptors

Use Http interceptors to add retry capability globally for example. You need to rethrow the error.

Register interceptor:
```
provider
```
N.B.: interceptor has to be multi.

Data flow


