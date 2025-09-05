At Angular’s core lies the ability to test all application parts in an automated way. How do we take advantage of Angular’s testabilit



## Testing services
- testing public methods: we test whether methods returns the expected data.
- In case the service stores data (internal state), we can get or set data for specific scenarios. we test whether the data changed correctly. We test the state change by calling public methods, since we cannot access the state directly.
- In case the service interacts with other services or dependencies (loggerService or HttpClient), these services will be mocked and canned responses will be returned instead.

### Process
First, we need to identify:
- What the service does?
- What needs to be tested?
- How to test it?
Here is an example with a service with internal state:
```
describe('CounterService', () => {
  it('returns the count', () => { /* … */ });
  it('increments the count', () => { /* … */ });
  it('decrements the count', () => { /* … */ });
  it('resets the count', () => { /* … */ });
});
```

# Resources
https://testing-angular.com/