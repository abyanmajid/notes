# Week 4 ISYS2120 More SQL

**Grouped aggregates**

A common pattern is to collect info for each value of some combination of attrs, and report on an aggregate of summary for each case

Example:

- "Find the average sales in each store"
- "For each department, give the number of employees"
- "For each product and month, show the number of items sold"

**Queries with `GROUP BY` and `HAVING`**

In SQL, we can partition a relation into groups according to the values of one or more attrs.

```sql
SELECT [DISTINCT] target-list
FROM relation-list
WHERE qualification
GROUP BY grouping-list
HAVING group-qualification
```

A GROUP is a set of tuples where they have identical values, considering just the attrs in grouping

**Other `GROUP BY` examples**

What was the average mark of each unit?

```sql
SELECT uos_code AS unit_of_study, AVG(mark)
FROM Assessment
GROUP BY uos_code
```

what is the average mark in each unit where that average is more than 10?

```sql
SELECT uos_code AS unit_of_study, AVG(mark)
FROM Assesssment
GROUP BY uos_code
HAVING AVG(mark) > 0
```

**Evaluation Order**

<img width="615" alt="image" src="https://github.com/user-attachments/assets/d2fa8ca3-3aca-4bcc-912c-631550919006">

**Set Operations**

Use `UNION`, `INTERSECT`, and `EXCEPT` for set operations (it takes in 2 relations as operands). By default, these operations eliminates duplicates, so to retain duplicates, include `ALL` e.g., `r UNION ALL s`

**Nested Subqueries**

A SUBQUERY is an SFW (select-from-where) expression that is nested within another query:

- In a condition of the `WHERE` clase
- As a "table" of the `FROM` clause
- Within the `HAVING` clause

COMMON USE: Subqueries is commonly used to perform tests for set membership, set comparisons, and set cardinality.

Example: Find the names of students who have enrollde in ISYS2120

```sql
SELECT name
FROM Student
WHERE sid IN (
  SELECT sid
  FROM Enrolled
  WHERE uos_code='ISYS2120'
)
```

**Correlated vs. Noncorrelated Subqueries**

Noncorrelated subqueries:

- Do not depend on data from the outer query
- Execute once for the entire outer query

Correlated subqueries:

- Make use of data from the outer query
- Execute once for each row of the outer query
- Can use the `EXISTS` operator

**Testing if a subquery exists**

The boolean expression `EXISTS` (subquery) can appear in the `WHERE` clause

**`IN` vs. `EXISTS`**

`IN` compares a value $v$ with a set (or multi-set) of values $V$, and evaluates to true if $v$ is one of the elements in $V$

`EXISTS` checks whether the result of a correlated nested query is empty (contains no tuples) or not

**Set Comparison**

- `ALL` : tests whether a comparison is true for the whole set
- `SOME` or `ANY` : tests whether a comparison holds for AT LEAST ONE set element

Example: Find the student(s) with highest mark in tasks of ISYS2120

```sql
SELECT A1.sid
FROM Assessment.A1
WHERE A1.uos_code='ISYS2120' AND
  A1.mark >= ALL (SELECT A2.mark
FROM Assessment A2
WHERE A2.uos_code='ISYS2120')
```

**"For every" queries**

SQL does NOT directly support universal quantification (i.e., for all). Instead, it permits a work around for it by utilizing the `NOT EXISTS` clause on a negated condition.

Example: Convert "Find courses where ALL enrolled student already have a grade" to "Find courses where there is NOT an enrolled student who does not have a grade"

```sql
SELECT uos_code
FROM UnitOfStudy U
WHERE NOT EXISTS (
  SELECT *
  FROM Enrolled E
  WHERE E.uos_code=U.uos_code AND
  grade is NULL
)
```

**Division in SQL - Reformulating as "NOT EXISTS NOT"**

Example: Find the students for whom there is not an ISYS subject in second year, that the student did not take

```sql
SELECT DISTINCT S.name
FROM Student S
WHERE NOT EXISTS (
  SELECT * FROM UnitOfStudy U
  AND NOT EXISTS (
    SELECT 1
    FROM Enrolled E
    WHERE E.studId = S.studId
    AND E.uosCode=U.uosCode
  )
)
```

**Division in SQL - Reformulating as "NOT EXISTS A SET-DIFFERENCE"**

Example: Find the students for whom there is not an ISYS subject in second year, that the student did not take

```sql
SELECT name
FROM Student S
WHERE NOT EXISTS (
  SELECT uosCode
  FROM UnitOfStudy
  WHERE uosCode LIKE 'ISYS2%'
  EXCEPT
  SELECT E.uosCode
  FROM Enrolled E
  WHERE E.studId
)

```
