# Week 2 (SQL BASICS)

**SELECT:** The SELECT statement is used for queries on single or multiple tables. Clauses of the SELECT statement:

- SELECT: Lists the columns (and expressions) that should be returned from the query
- FROM: Indicate the table(s) from which data will be obtained
- WHERE: Indicate the conditions to include a tuple in the result
- GROUP BY: Indicatae the categorization of tuples
- HAVING: Indicate the conditions to include a category
- ORDER BY: Sorts the result according to specified criteria

Example: list names of all Australian students.

```sql
SELECT name FROM Student WHERE country = 'AUS'
```

Notes on Syntax: 

- SQL does NOT permit the '-' "dash" char in identifiers e.g., table or column names
- SQL identifiers/keywords are CASE INSENSITIVE i.e., you can use upper-case or lower-case letters

**Orders (ORDER BY)**

Example (ORDER BY): list all students' names from Australia in alphabetical order

```sql
SELECT name
FROM student
WHERE country = 'AUS'
ORDER BY name
```

Ordering (ASC/DESC):

- ASC (ascending order/default)
- DESC (descending order)

**Duplicates (DISTINCT)**

SQL allows duplicates in tables as well as in query results. So, if you need to force elimination of duplicates when querying, then insert "DISTINCT" after "SELECT"

Example: List the countries where students come from

```sql
SELECT DISTINCT country
FROM Student
```

Alternatively, the "ALL" keyword specifies that duplicates not be removed (this is anyways default)

```sql
SELECT ALL country
FROM Student
```

**ALL:**

An asterisk after "SELECT" denotes "all attributes"

```sql
SELECT *
FROM Student
```

**Select by arithmetic expressions (+, -, \*, /)**

The SELECT clause can obtain arithmetic expressions involving the operations +, -, *, and /

The following query:

```sql
SELECT uos_code, title, credit_points * 2, lecturer
FROM UnitOfStudy
```

would return a relation which is the same as the _UnitofStudy_ relation except that the credit-point-values are twice as much.

**Renaming relations and attributes (AS)**

SQL allows renaming relations and attributes using the "AS" clause.

```sql
old_name AS new_name
```

**Logical expressions (WHERE)**

The WHERE clause is a logical expression which specifies a condition that rows must satisfy to be part of the result.

Comparison operators in SQL: =, >, >=, <, <=, != , <>

Comparison results can be combined using the logical connectives: AND, OR, NOT

e.g.,

```sql
SELECT uos_code
FROM UnitOfStudy
WHERE lecturer = 1011 AND credit_points > 4
```

**BETWEEN in WHERE clause**

SQL incldues BETWEEN comparison operator called "range queries"

- Ranges are inclusive of its ends.
- Range-ends must be from a data type with an order

e.g., Find all students, by SID, who gained marks in the credit range (i.e., 65 to 74)

```sql
SELECT sid
FROM Assessment
WHERE uos_code = 'COMP5138' AND mark BETWEEN 65 AND 74
```

**Comments**

-- : one line comment
/* till */ : can go over several lines

**String operations (LIKE) and wildcards (%, _)**

- LIKE: used for string matching
- Percent (%): match any substring
- Underscore (_): match any character
- Concatenation (||): concatenate 2 strings

e.g., List the titles of all "COMP" unit of studies

```sql
SELECT title FROM UnitOfStudy WHERE uos_code LIKE 'COMP%'
```

**Regular Expression (Regex)**

A regular expression (regex) is a pattern consisting of _character literals_ and/or _metacharacters_

It's typically implemented as a sql function such as `regexp_like(...)`

Metacharacters specify how to process a regex

- (): grouping: ()
- alternative: |
- character list: []
- matches any character: .
- repeat preceeding pattern zero, one, or more times: *
- repeat preceeding apttern one or more times: +
- start of a line: ^
- end of line: $

e.g.,

```sql
SELECT title
FROM UnitOfStudy
WHERE regexp_like(uos_code, '^COMP[:digit:]{4}')
```

**Date and Time in SQL**

<img width="380" alt="image" src="https://github.com/user-attachments/assets/064f166e-4b5a-4593-8eb5-d2d7c2519f8e">

You can do comparisons with time with your typical operators: >, <, <=, >=, =

Constants:

- CURRENT_DATE: db system's current date
- CURRENT_TIME: db system's current timestamp

e.g.,

```sql
SELECT name
FROM Student
WHERE enroldate < CURRENT_DATE
```

Other main operations:

- EXTRACT(compomnent FROM date) e.g., EXTRACT(year FROM enroldate)
- DATE string e.g., DATE '2012-03-01'
- +/- INTERVAL e.g., '2012-04-01' + INTERVAL '36 HOUR'

The **FROM** clause lists the relations involved in the query

**Cartesian Product:** All pairs, one from each table e.g., _Student x UnitOfStudy_

```sql
SELECT * FROM Student, UnitOfStudy
```

**Aliases**

Aliases can be given the relation name in the FROM clause. Alises follow the relation name, e.g.,

```sql
SELECT S.sid, S.name, S.gender
FROM Student S, Enrolled
WHERE S.sid = Enrolled.sid AND
uos_code = 'ISYS2120'
```

example 2: For each academic, retrieve the academic's name, 
and the name of his or her immediate supervisor

```sql
SELECT A.name, M.name
FROM Academic A, Academic M
WHERE A.manager = M.empid
```

A represents lecturers in role of supervisees and M represents lecturers in role of supervisors.

**JOINS:**

- JOIN: causes >= 2 tables to be combined into a single table or view
- EQUI-JOIN: join based on equality between values in the common-named columns; matched columns appear redundantly in the result table.
- NATURAL JOIN: like an equi-join, but only one of the duplicate-named columns is kept in the result table

```sql
R natural join S
```

- OUTER JOIN: a join in which rows that do not have any matching values in the common columns are nonetheless included in the result table (as opposed to inner join, in which rows must have mtatching values in order to appear in the result table)

```sql
R inner join S on <conditions>
R inner join S using <list. of attr)
```

- UNION JOIN: includes all cols from each table and an instance for each row of each table.

**Mathematical operators and functions:**

Basic operators: `+`, `-`, `*`, `/`

Functions:

- `mod(a, b)` : remainder of `a / b`
- `round(n, d)` : rounds `n` to `d` decimal places
- `trunc(n, d)` : truncates `n` to `d` decimal places
- `ceil(n)` : computes the smallest integer value not less than `n`
- `floor(n)` : computes the largest integer value not greater than `n`
- `abs(n)` : computes the absolute value of `n`

**Floating point data:**

- `NaN` : not-a-number
- `infinity` : infinity, larger than any number
- `-infinity` : negative infinity (smaller than any number)

All of these MUST BE GIVEN AS A STRING IN SQL e.g., `'NaN'` or `'infinity'` when addressing a `FLOAT` attr.

```
CREATE TABLE Test ( val FLOAT );
INSERT INTO  Test VALUES (0), ('NaN'), (NULL);

\pset null '[NULL]'
SELECT * FROM Test;
SELECT * FROM Test WHERE val IS NULL;
```

`NaN` is NOT equal to any numeric value (including `NaN`). However, PostgreSQL treats `NaN` values as equal, and greater than all non-`NaN` values

**`SERIAL` type:**

`SERIAL` type is not a real type, but a syntax convenience to specify an attr that monotonically increases for each new entry.

`SERIAL` can be treated as an `INTEGER`.

```sql
CREATE TABLE Test ( 
    id  SERIAL,
    val CHAR
);
INSERT INTO Test(val) VALUES ('a'), ('b');
SELECT * FROM Test;
```
