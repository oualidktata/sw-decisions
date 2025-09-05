# 34. mfe-testing strategies for micro-frontend

Date: 2022-01-26

## Status

Accepted

## Context

In general, whatever strategies you are using to test a monolithic frontend can be reproduced across each individual micro frontend. That is, each micro frontend should have its own comprehensive suite of automated tests that ensure the quality and correctness of the code.

Don't take things too far; functional tests should only cover aspects that cannot be tested at a lower level of the Test Pyramid. By that we mean, use unit tests to cover your low-level business logic and rendering logic, and then use functional tests just to validate that the page is assembled correctly. For example, you might load up the fully-integrated application at a particular URL, and assert that the hard-coded title of the relevant micro frontend is present on the page.

## Decision

- Strategy:
If there are user journeys that span across micro frontends, then you could use functional testing to cover those, but keep the functional tests focussed on validating the integration of the frontends, and not the internal business logic of each micro frontend, which should have already been covered by unit tests.
-Tools:
Cypress / K6
## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.
## Resources
https://martinfowler.com/articles/micro-frontends.html