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

- **Access control (for authorization)**: A mechanism provided by DBMS for controlling which users perform various operations on various parts of the database. It's called **"discretionary" access control**, because the decision about what is permitted or not, is set by appropriate people as the system operates. (Unlike **mandatory access control** where the decisions are built in to the system and unchangable)

- Creator of a table in SQL automatically gets all privileges on it.

### The `GRANT` Command

The generic syntax looks like:

```
GRANT <privilegelist> ON <tablelist> TO <userlist> [WITH GRANT OPTION]
```

where `<privilegelist>` could comprise of any of:

- `SELECT`: (allows to read all columns of any tables in `<tablelist>`, including columns added later via `ALTER TABLE`
- `INSERT`: allows to insert extra tuples in any of the listed tables
- `UPDATE`: allows to modify the values in any tuples of the tables
- `REFERENCES`: can define foreign keys (in other tables) that refer to this table

If a user has a privilege with the `GRANT OPTION`, they can themselves pass privilege on to other users by executing a `GRANT` command.

Anyone who gets privileges from a command `WITH GRANT OPTION` has the capacity to pass those privileges on to others.

`WITH GRANT OPTION` is very powerful and it should be given rarely, and only to the trusted.

Only owner of a table (or superuser) can execute `ALTER` and `DROP`. Owners can actually execute an external pipeline 

## Access Control in SQL (Examples)

Allow Jason to select any tuples in the `Enrolled` table

`GRANT SELECT ON Enrolled TO jason`

Allow `jason` to modify any tuples in the `Enrolled` table

`GRANT UPDATE ON Enrolled TO jason`

Allow `jason` to delete tuples that are in the `Student` table and also allow him to authorize others to do so by executing `GRANT`

`GRANT DELETE ON Student TO jason WITH GRANT OPTION`

It is common for security policy to want different access rights on different columns in a single table e.g., Fred can read `Student` sid, name, phone, but not disability-status, nationality, or others.

Most DBMSs support variation of command `GRANT privilege(column) ON table`

- e.g., `GRANT SELECT (sid, name, phone) ON Student TO Fred`
- e.g., `GRANT UPDATE (phone) ON Student TO Jane`




