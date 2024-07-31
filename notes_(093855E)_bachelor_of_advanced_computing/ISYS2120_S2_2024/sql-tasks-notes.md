# SQL Tasks Notes

**Strings:** Strings must be enclosed with single quotes ('). Double quotes (") mean something else in SQL

**Aggregate Functions:**

- **`COUNT():`** An aggregate function that counts the total number of rows in a column/table. `COUNT(*)` counts total number of rows in the table, including `NULL` values. However, `COUNT(columnName)` will only non-`NULL` values will be counted.

- **`MAX(expression):`** Max value of _expression_ across all inputs
- **`MIN(expression):`** Min value of _expression_ accross all inputs
- **`AVG(expression):`** Mean of input values
- **`SUM(expression):`** Sum of _expression_ across all inputs

**DML Commands:** `INSERT`, `DELETE`, `UPDATE`

- `INSERT`:

```sql
INSERT INTO <tablename>
     VALUES (...);
```

- `UPDATE`:

```sql
UPDATE <tablename>
   SET <expression>
 WHERE <condition>;
```

- `DELETE`

```sql
DELETE FROM <tablename>
      WHERE <condition>;
```

**DDL Commands:** 

- `CREATE TABLE`

```sql
CREATE TABLE <tablename> (
  <attr1> <TYPE1> <CONSTRAINTS, if any>,
  <attr2> <TYPE2> <CONSTRAINTS, if any>,
  ...
);
```

Attributes must have specific _domain type._ Most common ones include:

1. `SMALLINT`: 2 byte integer
2. `INTEGER`: 4 byte integer
3. `FLOAT`: 8 byte floating point
4. `CHAR(n)`: fixed-length string of `n` chars
5. `VARCHAR(n)`: variable-length string of `0` to `n` chars

Consistency Constraints:

1. `PRIMARY KEY`: declares attr as the unique ID for rows in the table
2. `NOT NULL`: enforce that every row MUST have a value for this attr
3. `DEFAULT <default_value>`: set a default value for an attr

Foreign Key Constraints:

A FOREIGN KEY constraint specifies that values stored for an attr (or set of attrs) in a table MUST MATCH values stored in a different table.

```sql
CREATE TABLE <tablename> (
  <attr1> ... REFERENCES <other_table>(<other_attr>),
  ...
);
```

- `DROP TABLE`

```
DROP TABLE <tablename>;
```

`CHECK` Constraint:

Can be used to specify a specific condition for an attribute

e.g., `regno` must be exactly 6 chars.

```
CREATE TABLE Car (
    regno VARCHAR(6) CHECK (LENGTH(regno) = 6)
);
```

**Query Types in SQL:**

1. Point queries: Search for individual database entries, typically specified with an equality (`=`) condition

```sql
SELECT *
  FROM Student
 WHERE studentId = 305422153;
```

2. Range queries: Select multiple rows in a defined value range

```sql
SELECT *
FROM Student
WHERE age < 25;
```

**Comparison Operators:**

- `=` : equal to
- `>` : greater than
- `>=` : greater than or equal to
- `<` : smaller than
- `<=` : smaller than or equal to
- `BETWEEN` : betweens start and end (INCLUSIVE)
- `IN` : set of accepted values

`BETWEEN` and lexicographic search: You can apply `BETWEEN` to strings. This will cause a lexicographic search between the start string and the end string

```sql
SELECT *
  FROM Enrolled
 WHERE grade BETWEEN 'CR' and 'D';
```

e.g., in the above example, SQL will include `CR`, `D` and anything that falls lexicographically between `CR` and `D` such as `CRA`, `CRB`, `CR1`, `CS`, `CT`, `CU`, etc

`IN`: You can alternatively use the `IN` operator to query based on a discrete set of values (essentially test for value-set membership)

```sql
SELECT *
  FROM Enrolled
 WHERE grade IN ('CR', 'D', 'HD');
```

**Inequality operators:** `<>`, `!=`, `NOT`

**Ordering:** `ORDER BY`

- `ASC` : ascending order
- `DESC` : descending order

You can do multi-attribute ordering

```sql
SELECT studentId, age, address
  FROM Student
 ORDER BY age DESC, address ASC;
```

**Duplicates:**

- `DISTINCT` : eliminates duplicates
- `ALL` : inlude duplicates

```sql
SELECT DISTINCT address
  FROM Student;
```

```sql
SELECT ALL address
  FROM Student
 WHERE age BETWEEN 18 and 25;
```

**Pattern matching: `LIKE`**

- `%` represents any sequence of zero or more characters

```sql
SELECT uosCode, uosName
  FROM UnitOfStudy
 WHERE uosName LIKE 'Database%';
```

The above query returns any uosName that STARTS with "Database"

```sql
SELECT uosCode, uosName
  FROM UnitOfStudy
 WHERE uosName LIKE '%Database%';
```

The above query returns any uosNAME that CONTAINS "Database"

- `_` represents exactly one character

```sql
SELECT uosCode, uosName
  FROM UnitOfStudy
 WHERE uosCode LIKE 'INFO1___';
```

The above query returns any uosCode that starts with "INFO1" followed by EXACTLY 3 characters.

**Case-insensitive matching with `LIKE`**

`LIKE` comparisons are case-sensitive by default. The following query returns `f` for `false`

```sql
SELECT 'USyd' LIKE 'usyd';
```

You need to lowercase/uppercase both operands to achieve case-insensitive matching. The following returns `t` for `true`

```sql
SELECT LOWER('USyd') LIKE 'usyd';
```

**Pattern matching with Regex in modern DBMSs:**

- PostgreSQL offers `SIMILAR TO`
- Oracle offers `regexp_like`

e.g., in PostgreSQL, the following query uses regex to match all subjects of which `title` starts with `'Advanced'` or `'Data'`

```sql
SELECT uosCode, uosName
  FROM UnitOfStudy
 WHERE uosName SIMILAR TO '(Advanced|Data)%';
```

e.g., the following query returns `uosCode` that starts with `COMP` followed by 4 digits

```sql
SELECT uosCode, uosName
  FROM UnitOfStudy
 WHERE uosCode SIMILAR TO 'COMP[[:digit:]]{4}';
```

**Checking for `NULL`:**

Comparing `NULL` with anything results in neither true nor false. It is instead unknown. Therefore, it's impossible to conclude whether something is NULL by using comparison operators such as `=` or `!=`.

SQL provides a special way to check for `NULL` by writing `IS NULL` or `IS NOT NULL`

**Making `NULL` visible:**

`NULL` is by default hidden in queries. Often this is inconvenient, so we like to show `NULL` nevertheless. This is how it's done in PostgreSQL:

```sql
\pset null '[NULL]'
SELECT * FROM Enrolled;
```

**Storing queries as views via `CREATE VIEW`:**

The `CREATE VIEW` DDL statement extends the current database schema with a new VIEW.

```sql
CREATE VIEW name AS <query>;
```

A view "stores" a query and makes it reusable by calling it AS IF it was a table. That's right, views are different from tables. Its contents are dynamically retrieved from the underlying tables each time it's referenced in a query.

Example:

```sql
CREATE VIEW CurrentStudents AS
  SELECT studentId, uosCode, semester
    FROM Enrolled
   WHERE year = 2016;
   
SELECT *
  FROM CurrentStudents;
```

Existing views can be removed via the `DROP VIEW` command

```sql
DROP VIEW <viewname>
```

**Join conditions:**

It is common to relate the foreign key attr(s) of one table to the corresponding primary key in the second table.

<img width="446" alt="image" src="https://github.com/user-attachments/assets/447e24c5-5394-40e7-a74c-03c88a83a0fc">

e.g., `Student.studentId = Enrolled.studentId` means that we want each enrollment record paired with its corresponding student, and NOT any other student. This approach is also called "Equi-Join" because it tests for equality.

```sql
SELECT Student.studentId, name
  FROM Student, Enrolled
 WHERE Student.studentId = Enrolled.studentId
       AND Enrolled.uosCode = 'INFO2120';
```

AMBIGUITY: Note that if the two keys are of the same name, then you must prefix each of them with the table name, otherwise you'll get an "Ambiguity" error.

This code returns an ambiguity error:

```sql
SELECT studentId
  FROM Student, Enrolled
 WHERE studentId = studentId;
```

Here's how to fix it by prefixing:

```sql
SELECT Student.studentId
  FROM Student, Enrolled
 WHERE Student.studentId = Enrolled.studentId;
```

**Three way join:**

```qsl
SELECT S.studentId, name
  FROM Student S, Enrolled E, UnitOfStudy U
 WHERE S.studentId = E.studentId
       AND U.uosCode = E.uosCode
       AND U.uosName = 'Database Systems I';
```

<img width="449" alt="image" src="https://github.com/user-attachments/assets/3bdb97d7-e72e-44f5-b429-1dbe733a65c9">


**Table Aliases:**

You can alias a table name like so (note: we typically choose short aliases such as `S` for `Student`):

```sql
SELECT S.studentId
  FROM Student S, Enrolled E
 WHERE S.studentId = E.studentId;
```

**Multiple Explicit Joins**

```sql
SELECT S.studentId, name
  FROM Student S, Enrolled E, UnitOfStudy U
 WHERE S.studentId = E.studentId
       AND U.uosCode = E.uosCode
       AND U.uosName = 'Database Systems I';
```

**Natural join with `NATURAL JOIN`:**

`NATURAL JOIN` combines all tuples whose values agree in all common attrs (which typically are the foreign-primary key pairs)

```sql
SELECT *
  FROM Student NATURAL JOIN Enrolled
 WHERE uosCode = 'INFO2120';
```

SIDE EFFECT: When using `NATURAL JOIN` on two tables with NO COMMON ATTRS, it will produce a CROSS JOIN, also called the CROSS PRODUCT of both tables (combining each TABLE_1 tuple with all TABLE_2 tuples). This is typically not what you want.

**Multi-way natural joins:**

We can also use the `NATURAL JOIN` keyword in a sequence of multiple consecutive joins.

```sql
SELECT studentId, name
  FROM (Student NATURAL JOIN Enrolled E)
                NATURAL JOIN UnitOfStudy
 WHERE uosName = 'Database Systems I';
```

**Inner join with `JOIN...ON` and `JOIN...USING`:**

You can use `JOIN...ON` to join 2 tables based ON A CONDITION (it doesn't necessarily have to be equality!):

```
r1 JOIN r2 ON ( condition )
```
```sql
SELECT year, name
  FROM AcademicStaff
       JOIN Lecture ON (id = lecturer)
 WHERE uosCode = 'COMP5138';
```

You can alternatively use `JOIN...USING` to join 2 tables whenever all specified FIELD(s) have the same value in both tuples. (Note: this assumes these attrs occur with the same name in both tables!)

```
r1 JOIN r2 USING ( field(s) )
```
```sql
SELECT name
  FROM Student
       INNER JOIN Enrolled USING (studentId)
 WHERE uosCode = 'INFO2120';
```

