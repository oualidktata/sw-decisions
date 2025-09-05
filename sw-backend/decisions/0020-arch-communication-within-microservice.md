# 20. Communication within service 

Date: 2022-07-13

## Status

|Status|Date|Validated by|
|------|----|------------|
|Proposed|2022/07/18|S.Bhatti|
|Accepted|--- |Synergy|

## Context

In a distributed system following Domain Driven Architecture the service needs to trigger multiple functionality to fullfill one command. It can be easily understand following an example of a buyer submitting an order, if the buyer is new, a record should be created and then the order should be submitted. There could be different approaches to execute all the related functionalities, we need to determine which will work well in our architecture.  
## Decision

The change that we're proposing or have agreed to implement.

## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.

- [Documentation](../documentation/arch-style/communication-within-service.md)
