<img width="247" alt="image" src="https://github.com/user-attachments/assets/3754b2e1-18c6-4e99-b253-65c3917b0c5f"># Week 1 (SOFT2412)

**Why software engineering?**

There is great need to build high-quality software systems under resource constraints:

1. Social - functional so as to serve user needs, reliable so as to not break, and trustworthy so as to be suitable to continuously be used.
2. Economical - reduces cost and opens up new opportunities. Average cost of IT dev is ~2.3m, ~1.3m, and ~434k for large, medium, and small companies respectively
3. Time to market - we want to deliver software on-time

**Ariane 5 Disaster (Software Failure)**

A european large rocket, developed in 10 years with ~$7 billion budget, exploded 37 seconds after lift-off. The fault was identified to be an unhandled software exception that resulted from the conversion from 64-bit floating point to a 16-bit signed integer. We know this because the backup processor failed straight after using the same software.

_The Underlying Cause_: Design error, incorrect analysis of changing requirements, inadequate validation and verification, testing and reviews, ineffective development processes and management

**Difference between SW Developers and SW Engineers**

Software engineering is "an engineering discipline concerned with ALL aspects of software production from the early stages of system specs through maintaining it after it's gone into use."

It is:

- theories, methods, and tools for cost-effective software production
- technical process, project management, and development of tools, methods to support software production
- system engineering (hardware & software) - software often dominates costs

**The Software Process**

There are many software development processes, but all include common activities:

- Specification (software/system requirements)
- Design and implementation
- Validation (testing)
- Evolution

Software processes are complex and, rely on people making decisions and judgements

**Software Development Models**

- Software Development Lifecycle (SDLC)

**Representative Software Process Models**

- _Waterfall Model_: Development process activities as process phases
- _Spiral Model_: Incremental development risk-driven
- _Agile Model_: Iterative incremental process for rapid software development
- _Rational Unified Process (RUP or UP)_: Bring together elements of different process models.

**Waterfall model - Heavy-Weight Model**

<img width="440" alt="image" src="https://github.com/user-attachments/assets/de86aba9-a65b-4a72-912f-3ed07cff93cc">

Phases:

1. Requirement's analysis and definition
2. System and software design
3. Implementation and unit testing
4. Integration and system testing
5. Operation and maintentance

Advantages:

1. Easy to understand and implement
2. Identified delivrables and milestones

Disadvantages:

1.  Intensive documenting and planning
2.  Discovering issues in later phases should lead to returning to earlier phase!

<img width="423" alt="image" src="https://github.com/user-attachments/assets/e9c16948-26fc-4922-ae09-f81a0847aca3">

**Software Evolution**

Software is inherently flexible and can change. As requirements change through changing business circumstances, the software that supports the business must also evolve and change. And business software must respond rapidly to changing market (Time-to-market)!

Plan-driven software development processes aren't suitable for certain types of SW systems

**Rational Unified Process (RUP or UP)**

Software development process utilizing iterative and risk-driven approach to develop OO software systems.

- Iterative incremental dev
- Iterative evolutionary dev

<img width="247" alt="image" src="https://github.com/user-attachments/assets/659c86e6-d705-4443-acd9-8c870d490181">

<img width="371" alt="image" src="https://github.com/user-attachments/assets/3e404815-9bd8-4c8f-9139-b76ed18748ed">

**Agile Development Model**

One of the PRIMARY causes of PROJECT FAILURE was extended period of time it took to develop the system. This is a huge trigger for Agility.

Other triggers for agility include escalated costs and changing requirements

Agile methods intend to: Develop systems more quickly with limited time spent on analysis and design

Agile values or goals:

1. _Individuals and interactions_ over processes and tools
2. _Working software_ over comprehensive documentation
3. _Customer collaboration_ over contact negotiation
4. _Responding to change_ over following a plan 

While there is value in the items on the right, we value the items on the LEFT MORE.

Agile advocates believe:

- Current SW dev processes are too heavy-weight or cumbersome
- Current software development is too rigid (i.e., incomplete or changing requirements)
- We need active customer involvement!

**Agile principles**

<img width="416" alt="image" src="https://github.com/user-attachments/assets/5c9fca48-b5c2-4721-ae26-f18890f9715c">

**Softwarae (Development) Process Models**

<img width="430" alt="image" src="https://github.com/user-attachments/assets/5e8f4aba-774d-474f-bfd3-953306486745">

**Agile - Requirements Process**

There's no "standard way" to do requirements in Agile dev. It could be a normal "software requirements document", but we generally want:

1. lightweight i.e., create enough docs to support production and faciliate comms without becoming a burden
2. user stories is king: we want to give what the user REALLY NEEDS.
3. In each iteration, work on small set of functional requirements that are of highest priority
4. For some key requirements, create some acceptace tests the same time as you write the requirements.

**Agile ONLY WORKS with the best developers**

- Every project needs at least one experienced and competent lead person (Critical Success Factor)
- Each experienced and competent person on the team permits the presence of 4-5 "average" or learning people
- With that skill mix, agile techniques have been shown to work many times.

**Don't do Agile, BE Agile**

Just doing "development in iterations" is NOT enough.

Agile is about:

1. Keeping the process lightweight (fast! working! not much emphasis on docs!)
2. Making real progress in each iteration
3. Communicating - face-to-face when possible
4. Actively gathering customer input - early and often
5. Willing to make minor changes to your process






