# Communication between micro-services

Date: 2022-07-22

In a distributed microservice architecture the communication mechanism between the services is of high importance. A microservices-based application is a distributed system running on multiple processes or services, usually even across multiple servers or hosts. Each service instance is typically a process. Therefore, services must interact using an inter-process communication protocol such as HTTP, AMQP, or a binary protocol like TCP, depending on the nature of each service.
The microservice community encourages a design that's as decoupled as possible between microservices, and as cohesive as possible within a single microservice.
# Choreography-based 



## Pros

## Cons

# Orchestration-based 



## Pros

## Cons

# Handling Transactions

# Hybrid approach



## Pros

## Cons

## Recommendations


## Resources
- [1](https://docs.microsoft.com/en-us/dotnet/architecture/microservices/architect-microservice-container-applications/communication-in-microservice-architecture)  by Microsoft
- [2](https://docs.microsoft.com/en-us/dotnet/architecture/microservices/multi-container-microservice-net-applications/integration-event-based-microservice-communications) by Microsoft
- [3](https://blog.logrocket.com/methods-for-microservice-communication/) 
- [4](https://dzone.com/articles/how-to-make-microservices-communicate)
