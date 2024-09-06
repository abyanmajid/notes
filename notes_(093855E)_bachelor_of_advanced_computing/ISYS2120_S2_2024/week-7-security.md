# Week 7 Security (ISYS2120)

### Database Security

- Databases usually contain commercially valuable info (possibly personal info)
- There are many adversaries who could benefit from accessing info, or altering it
- The org. that owns the data should be willing to spend money to protect the data against inappropriate uses

### Data Security Goals

System and org. need to set things up to guarantee:

- **Confidentiality Properties:** Users shouldn't be able to see things they aren't supposed to see e.g., a student can't see another student's grades
- **Integrity Properties:** Users shouldn't be able to modify things they aren't supposed to modify e.g., instructors can grades.
- **Availability Properties:** Users should be able to see and modify things which they are allowed see and modify

### Policy and Mechanism

- A **security policy** indicates who _should be allowed_ to do which actions (this is typically set by senior management based on legal obligations, business value, risks, etc)
- A **security mechanism** is how the system controls who is _allowed_ to do which actions (this is typically controlled by DBA), possibly with detailed adjustments by data owner.

### Data Minimalism

The best protection against unauthorized access to data in your db is to consider VERY CAREFULLY WHAT YOU STORE in the first place!

A db should only store info that is ABSOLUTELY NECSESARY for the operation of your app.

### Data Privacy

Some info is specifically protected and requires specific standards and auditing procedures

In Australia, the Privacy Act 1988 govrns the protection rules regarding personal info i.e., info that identifies/could identify an individual

### Useful DBMS features

Capabilities of a DBMS that can be useful in security mechanisms, but can also be used for other purposes:

- Privileges
- Views
- Constraints
- Triggers
- Stored Procedures

### Database Access Control

