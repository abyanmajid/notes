# Social coding

## The social coding principle

Social coding is the DevOps solution to improving a suboptimal feature by enforcing the open-source contribution follow to internal projects. It goes something like this:

1. Each product is in its own repository with an owner who has complete control over all changes made to it.
2. As an outsider, you discuss your proposition with the repo owner
3. If both of you agree, then you start by opening an issue and assign it to yourself (so everyone knows you're working on it)
4. Fork the code and make your changes
5. Issue a pull request and the repo owner has to review and can decide whether it should be merged.

This is a much more efficient workflow as supposed to reinventing the entire wheel.

## Pair programming

An aspect of social programming taken from Extreme Programming (XP):

- Two programmers on one workstation
- The driver is typing
- The navigator is reviewing
- Every 20 minutes they switch

You may think that pair programming is using twice the resources to get the same result, but no, you don't "exactly" get the same results. You get:

- Higher code quality
- Defects found ealier
- Lower maintenance costs
- Skills transfer
- Two set of eyes on every line of code
- Broader undestanding of codebase

## Git repository guidelines

1. Create a separate git repository for every component (eg. for each microservice or whatever unique thing you're building)
2. Create a new branch for every issue (there should be a `main` branch and a lot of feature branches)
3. Use pull requests to merge your code back to `main`
4. Never merge your own pull request! Every pull request is an opportunity for code review!

## Working in small batches

You should work in small batches (eg., using the single piece flow) so that you get a much quicker feedback loop which helps you identify any problems before you'd get too deep and waste time and resources.

## Minimal viable product (MVP)

1. MVP isn't "Phase 1" of a project, it's the minimal thing (an experiment) to test your value hypothesis and learn
2. MVP is focused on sharpening the axe, not the delivery. We wan't to learn a lot so we understand well how to go about implementing the actual project
3. At the end of each MVP, you decide whether to pivot or to continue with the original idea. We want to build exactly what the customer wants and we want to do it well!

## Test-driven development (TDD) and Behavior-driven development (BDD)

- **BDD ensures that you're building the RIGHT THING!**

BDD describes the behavior of the system from the outside. It uses a syntax both developers and stakeholders can easily understand.

- **TDD ensures that you're building the THING RIGHT!**

TDD means test cases drive the design and development of code. It allows you to develop faster and with more confidence. It is likely to save you time because any future changes you made is sure to not break the code (because it would pass the testcases if it does) and you save yourself from the debugging hell!

### TDD workflow

Here is the TDD workflow with Red-Green-Refactor:

1. Make a failing test case,
2. Write code just enough to pass the test case (it doesn't have to be pretty),
3. Refactor the code and repeat

![image](https://github.com/abyanmajid/notes/assets/108279046/f0a74d82-8c51-414f-b04a-b86adc20d5f8)

### BDD workflow

1. Explore the problem domain and describe the behavior
2. Document the behavior using Gherkin syntax
4. Use BDD tools to run those scenarios

#### Gherkin syntax

Feature metadata:

- As a (stakeholder)
- I need (what the stakeholder wants)
- So that (what they get out of it)

For scenarios:

- Given (some context)
- When (some event happens)
- Then (some testable outcome)
- And (more context, events, or outcomes)

Example from a retail store:
![image](https://github.com/abyanmajid/notes/assets/108279046/e4e886e3-df1e-4efd-a7d0-6d263f6d411f)

### Cloud-native architecture

- The cloud-native architecture is a collection of independently deployable microservices.
- Stateless microservices each maintain their own state in a separate database or persistent object store
- Microservices are loosely coupled services, designed for scalability and communication with APIs

### Designing for failure

- Failures are inevitable! so we need to embrace failures as they will happen!
- We need to learn how to avoid failures, but also what to do when they do happen!
- Plan to be throttled!
- Plan to retry! (with exponential backoff)
- Cache when appropriate

#### The retry pattern

You retry and it fails, and you wait a second and try again but still fails. Then you wait 2 seconds, then 4 seconds, then 8 seconds. In essence, you backoff in an exponential manner!

#### Circuit breaker pattern

The circuit breaker pattern aims to solve the cascading problem i.e., pivot when a microservice is not available and their unavailability causes a cascade of other services to go down. This is how it works:

1. **Closed state (normal operation):** Initially the circuit is "closed", meaning all requests to the service are allowed
2. **Failure detection:** If a service starts to fail (e.g., it's too slow or returning errors) the circuit breaker counts these failures. WHen the number of failures reaches a certain threshold, the circuit breaker trips and open the circuit
3. **Open state:** When the circuit is open, requests to the failing service are blocked or redirected to a fallback method, like an alternate response or an error message, while allowing some time for the failing service to recover.
4. **Half-open state (recovery):** After a certain period, the circuit breaker allows a few requests to see if the service has recovered. If these requests succeed, then the circuit is closed again and the normal operation resumes.

#### Bulkhead pattern

This pattern aims to isolate different parts of a system to prevent a failure in one part from affecting the entire system. Here's how it works:

1. **Isolation:** The system is divided into isolated services, each running in its own environment (e.g., have each service ran by a separate docker container)
2. **Resource allocation:** Each isolated component has its own dedicated resources (e.g., threads, memory, connections). This ensures that if one component fails, it wont consume resources needed by other services.
3. **Containment of failures:** If a failure does occur in one service, the failure is contained within that service and the rest of the system continues to function normally preventing a cascading failure.

#### Chaos engineering (also known as monkey testing)

This is simply when you deliberately kill services - because you don't know how something will respond to failure until it actually fails!
