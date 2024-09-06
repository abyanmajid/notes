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

### Revoking privileges

When a privilege is revoked from user `X`, it is also revoked FROM ALL USERS who got it SOLELY from user `X`. But if a user has this privileges via several routes, it's still there until all granters have revoked it

```
REVOKE privilege_list ON table FROM user_list
```

### Authorization Mode `REFERENCES`

Foreign key constraint could be exploited to:

- **prevent some kinds of modification** e.g., prevent deletion of rows in some other table

```sql
CREATE TABLE DontDismissMe (
  id INTEGER,
  FOREGIN KEY (id) REFERENCES Student ON DELETE NO ACTION
)
```

- **reveal info** - successful insertion into `DontDismissMe` reveals that a row with particular value exists in another table `Student`

```sql
INSERT INTO DontDismissMe VALUES (11111111);
```

The existence of `REFERENCES` privilege also allows to limit these powers to certain users

- Most users (other than table owner) wont have REFERENCES privilege so can't use these tricks

```sql
GRANT REFERENCSE ON Student TO StuServices
```

### Role-based Authorization

In SQL-92, privileges are actually assigned to authorisation IDs, which can denote a single user or a group of users.

In SQL-1999, **privileges are assigned to roles.**

- Roles can be granted to users and other roles
- Roles are much more flexible and less error-prone especially on large schemas.

Use role-based authorization whenever possible!

Example:

```sql
CREATE ROLE manager
GRANT select,insert ON student TO manager
GRANT manager TO shari
-- now shari can select and insert on student
GRANT manager TO keiko
-- now keiko can select and insert on student
REVOKE manager FROM shari
-- now shari does not have manager privileges
```

### User Identity (Authentication)

A DBA has a lot of privileges, over objects of all the ordinary users. So, DBA identity must be carefully protected esp. NEVER LEAVE DEFAULT PASSWORD (as provided when system init)

### Content-based access control

`GRANT` works uniformly on a whole table or column. Policy often calls for access to be limite dto certain rows only, in a table

The decision about whether a row should be accessed by someone may depend on the contents of some fields in the row.

- e.g., John should be able to modify saliries, but only for tuples with Dept = "Accounts"
- e.g. Each student should be able to see their own grades, but not grades of other students

### Summary access

Policy may call for certain users to be able to see aggregates and summaries, without seeing all the separate data items that combine for that summary

- e.g., Jane is allowed to know the level of avg. salary in each faculity, without knowing salaries of individual staff

SQL DBMS achieves this by lettins us define a VIEW wiwth only the sumaries, and then GRANT access to that VIEW

### Relational views

A **view** is a _virtual_ relation, but we store a _definition_, rather than a set of tuples.

This provides a mechanism to release access to certain data, without allowing access to all of a genuine table

```sql
CREATE VIEW name AS <query expression>
```

where `<query expression>` is any legal query expression (can even combine multiple relations)

EXAMPLES:

- A view on students showing their age

```sql
CREATE VIEW ageStudents AS
SELECT sid, name, 
(extract(year from current_date) -
extract(year from birthdate)) AS age
FROM Student
```

- A view on the female students enrolled in 2024 SEM 2

```sql
CREATE VIEW FemaleStudents (name, grade)
AS SELECT S.name, E.grade
FROM Student S, Enrolled E
WHERE S.sid = E.sid AND
S.gender = ‘F’ AND E.semester = ‘2024sem2’
```

### View Benefits: Security

_Need-to-know:_ Users not granted access to base tables. Instead, they are granted access to the view of the database appropriate to their needs.

Views allow owner to provide others with `SELECT` access to a subset of columns and a subset of rows, or to provide access to summaries without the full data.

### Example of `GRANT` with `VIEW`

<img width="380" alt="image" src="https://github.com/user-attachments/assets/fbf788d8-0b54-40bf-812a-90029a4e9682">

<img width="376" alt="image" src="https://github.com/user-attachments/assets/fb24a516-c196-4db3-9903-4f0284203f90">

### Updating Views

Views can sometimes be updated, under certain limitations:

- `UPDATE` on the view can be performed - the system will change the underlying base table(s) to produce the requested change to the view


### Issues with Updating Views

**Projected out attributes**

```sql
INSERT INTO CsReg (StudId, CrsCode, Semester) VALUES (1111, 'CSE305', 'S2024')
```

**Q:** What value should be placed in attributes that have been projected out of the view e.g., Grade?

**A:** `NULL` (assuming nullable), or `DEFAULT`

**Newly inserted tuples will not be visible in the view**

```sql
INSERT INTO CsReg (StudId, CrsCode, Semester)
VALUES (1111, 'ECO105', 'S2020')
```

**SOLUTION:** Create view `WITH CHECK OPTION` ensures that the new rows satisfy the view-defining condition; other changes are rejected

**There's no unique way to change the base table(s) that results in the desired modification of the view**

```sql
CREATE VIEW ProfDept (PrName, DeName) AS
SELECT P.Name, D.Name
FROM Professor P, Department D
WHERE P.DeptId = D.DeptId
```

### Integrity Constraint (IC)

Condition that MUST be true for every instance of a database. A **_legal_** instance of a relation is one that satisfies all specified ICs.

- ICs are **SPECIFIED** in the database schema.
- ICs are **CHECKED** when the database is modified
- Possible **REACTIONS** if an IC is violated: Undoing of the modification, execution of "maintenance" operations to make db legal again, etc.

### Domain Constraints

The most elementary form of an integrity constraint is **DOMAIN CONSTRAINT**, which includes data types, check/input validations, nullability, etc.

**User-Defined Domains:** PostgreSQL lets you create a new domain from existing data domains

```sql
CREATE DOMAIN domain-name sql-data-type
```

e.g., `CREATE DOMAIN Dollars NUMERIC(12, 2)`, you can further restrict it with the `CHECK` clause e.g., `CREATE DOMAIN Grade CHAR CHECK(VALUE IN (‘F’,’P’,’C’,’D’,’H’))`

### Candidate key

A set of fields is a candidate key for a relation if:

1. **Uniqueness:** No 2 distinct tuples can have same values in all key attributes, and
2. **Minimality:** This is not true for any subset of the key







