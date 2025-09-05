# Overview

## Problem space

# Overview

|Type|Description|Example|Value||
|-|-|-|-|-|
|Server state|Data stored in the server (back-end) or BFF|List of items||
|Persistent state|Subset of server state stored in the client in memory|List of items frequently requested||
|The URL and router state||||
|Client state|not stored on the server but stored in the URL (like filters)|||
|Transient client state|State stored in the client but not stored in the URL|location in audio or video stream||
|Local UI state|State needed only at the component level (color of a button)|||

### Synchronization
The need for synchronization comes from the fact that the data shared between state types needs to be consistent.
- Persistent state and server state store the same data and they need to be consistent.
- Client State
# Solution Space
## What's Immutability?
Mutable state problems:
We need to fix the mutability problem first.
Implement immutability.
Change model to to be immutable

The whole application state is stored as an - **immutable data structure**. So every time a change happens, a new instance of the data-structure is constructed. Even though this seems limiting at first, this constraint results in many great properties. One of which is that it can make your Angular applications quite a bit faster[1].

- **Interaction = Action**
The only way to update the application state is to emit an action. As a result, most user interactions emit actions. And if you want to simulate an interaction, you just need to emit the right sequence of actions[1].
## Solution 1: Observalble powered facade pattern for simple cases
## Solution 2: State management framework for complex scenarios
Separate **state management** from Services and computation
### SHARI Principle
The SHARI principle helps us decide whether we need to manage state using a state management solution. 

- **S**hared: is your state accessed by a lot of components and services?
- **H**ydrated: is your state persisted and rehydrated from external storage?
- **A**vailable: do you need your state to be available when re–entering routes?
- **R**etrieved: does your state have to be retrieved with a side–effect?
- **I**mpacted: is your state impacted by actions from other sources?

If you answered “yes” to the questions above, consider using NgRx for your project.
### Routing
The user can always change the URL manually. It make more sense to rely on routes as a source of truth. As consequence, the route will call the reducer and not the opposite.




# Resources
Continue on this
[1] https://vsavkin.com/managing-state-in-angular-2-applications-caf78d123d02#.tnhbe6f16
[2] https://blog.nrwl.io/managing-state-in-angular-applications-22b75ef5625f
[3] https://massivepixel.io/blog/angular-state-management/#The_SHARI_Principles