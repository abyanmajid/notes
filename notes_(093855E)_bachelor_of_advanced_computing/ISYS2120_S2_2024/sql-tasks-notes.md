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
