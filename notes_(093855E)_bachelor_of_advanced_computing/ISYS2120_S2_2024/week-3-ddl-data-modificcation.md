# Week 3 ISYS2120

**Creating tables in SQL:**

Generic syntax:

```sql
CREATE TABLE name ( list-of-columns-with-types );
```

e.g.,

```sql
CREATE TABLE Instructor (
  lname VARCHAR(20),
  fname VARCHAR(20),
  salary INTEGER,
  hired DATE
);
```

**Base datatypes of SQL:**

- `SMALLINT`, `INTEGER`, `BIGINT` : Integers e.g., 1704, 4070
- `DECIMAL(p, q)`, `NUMERIC(p, q)` : Fixed-point numbers with precision $p$ and $q$ decimal places e.g., 1003.44, 160139.9
- `FLOAT(p)`, `REAL`, `DOUBLE PRECISION` : Floating point numbers with precision $p$
- `CHAR(q)`, `VARCHAR(q)`, `CLOB(q)` : Alphanumerical char string types of fixed size $q$ respectively of variable length up to $q$ chars. e.g., "The quick brown fox jumos... ISYS2120"
- `BLOB(r)` : Binary string of size $r$ e.g., `B'01101' X9e ATE`
- `DATE` : date e.g., `'1997-06-19'`
- `TIME` : time e.g., `'20:30:45'`
- `TIMESTAMP` : timestamp e.g., `'2002-08-23 14:15:00'`
- `INTERVAL` : time interval e.g., `11:15' HOUR TO MINUTE`

**SQL Schema names:**

It's often difficult to ensure taht everyone uses different names for tables, constraints, etc. So, we typically want a separate name-space for each data owner. 

We can achieve this by having several different schemas stored in the DBMS. The full name of a table is then `schemaname.tablename`

```sql
CREATE SCHEMA ...
```

**Integrity Constraints (IC):**

Integrity Constraints (IC) is a condition that MUST be true for ANY contents of the database; e.g., domain constraints, uniqueness constraints, etc.

A LEGAL instance of a relation is one where the contents satisfies ALL specified Integrity Constraints (ICs). When ICs are declared in the schema, then the DBMS will NOT allow illegal instances to arise.

**The special `NULL` value:**

SQL RDBMSs allow a special entry `NULL` in a column to represent unapplicable facts, or facts that are NOT yet known. `NULL` can appear in columns of ANY DATATYPE (unless explicitly prevented by the schema).

ADVANTAGE of using `NULL`: It's useful because the system knows to treat it specially e.g., calculations like `AVG(age)` or `MIN(age)` ignores `NULL` cases but will give incorrect answer if some values are `-1`

DISADVANTAGE of using `NULL`: `NULL` causes complications in the definition of many operations (e.g., is `27 < NULL` ? is `27 > NULL` ? is `NULL = NULL`)

**`NOT NULL` constraint:** 

You can use `NOT NULL` to enforce that a column (or attribute) MUST NOT be `NULL`.

**Primary key constraint:**

You can use `PRIMARY KEY` to enforce that a column is the unique identifier for any particular entity. It will enforce that:

- every row has a different value for this column
- no row has `NULL` as value for this column

Ways to indicate a `PK` in SQL:

- Append to end of column definition

```sql
CREATE TABLE Student (
  sid
  INTEGER PRIMARY KEY,
  name VARCHAR(20)
);
```

- Extra clause in table creation

```sql
CREATE TABLE Student (
  sid
  INTEGER, 
  name VARCHAR(20),
  PRIMARY KEY (sid)
)
```

- Named constraint

```sql
CREATE TABLE Student (
  sid,
  INTEGER,
  name VARCHAR(20),
  CONSTRAINT Student_PK PRIMARY KEY (sid)
);
```

**Composite `PRIMARY KEY`:**

In tables where no single column can be an identifier, we can use a combination of columns to distinguish the rows.

We do this by specifying the columns `PRIMARY KEY (col_1, col_2, col_3, ...)`

```sql
CREATE TABLE Airplane (
  manufacturer VARCHAR(20),
  serialno INTEGER, 
  weight  REAL,
  PRIMARY KEY (manufacturer, serialno)
)
```

**The `UNIQUE` constraint:**

We can use `UNIQUE` to specify that a column, or combination of columns is unique.

**Foreign keys:**

We can connect information across tables using foreign key constraint, and the value in a foreign key column is allowed to be `NULL` unless explicitly specified otherwise by the schema.

**Ways to define a `FOREIGN KEY` constraint:**

- Append the end of the foregin key column with `REFERENCES table(column)`

```sql
CREATE TABLE Product (
  ProdID INTEGER, 
  descr VARCHAR(10),
  SuppID INTEGER REFERENCES Supplier(SuppID)
);
```

- Implicit reference to the referenced table's primary key

```sql
CREATE TABLE Product (
  ProdID INTEGER, 
  descr VARCHAR(10),
  SuppID INTEGER REFERENCES Supplier
);
```

- Explicitly say `FOREGIN KEY`

```sql
 CREATE TABLE Product (
  ProdID INTEGER,
  descr VARCHAR(10),
  SuppID INTEGER,
  FOREIGN KEY (SuppID) REFERENCES Supplier(SuppID)
);
```

- Explicitly say `CONSTRAINT`

```sql
CREATE TABLE Product (
  ProdID INTEGER,
  descr VARCHAR(10),
  SuppID INTEGER,
  CONSTRAINT Product_FK FOREIGN KEY (SuppID) REFERENCES 
  Supplier(SuppID)
);
```

**The `CHECK` constraint:**

You can use `CHECK` to specify a boolean expression that is required to always be true for every row in the column.

```sql
 CREATE TABLE Employee (
  empID  INTEGER,
  …
  salary INTEGER CHECK (salary > 0),
  …
);
```

**Delete tables using `DROP TABLE`:**

You can delete table using the `DROP TABLE` keywords

**You can also alter a table's schema using `ALTER TABLE`:**

You can change the structure of an existing table using `ALTER TABLE`

```sql
ALTER TABLE name ADD column ... | ADD constraint ... | ...
```

**Insert into a table using `INSERT`:**

```sql
INSERT INTO table VALUES ( list-of-expressions )
```

e.g.,

```sql
INSERT INTO Student VALUES (12345678, 'Smit'), (12444455, 'Cheng')
```

**Updating rows using `UPDATE`:**

```sql
UPDATE UoS
SET title = 'Awesome Data'
WHERE ucode = 'ISYS2120'
```

**Deleting rows using `DELETE FROM`:**

```sql
DELETE FROM table [ WHERE search_condition ]
```

e.g., `DELETE FROM Student WHERE name LIKE '%Fekete'`

**Referential integrity on Data Modification:**

Consider Student and Enrolled, and `Enrolled.sid` is a foreign key that references `Student.sid`

When we insert an Enrolled tuple with a non-existent `Student.sid`, then we reject the attempted insertion!

So when the row referenced is trying to get deleted, the default action is to reject that attempt i.e., `NO ACTION`. However, we have other choices:

- Delete all Enrolled tuples that refer to it (`CASCADE`)

```sql
FOREIGN KEY taughtBy REFERENCES Professor
  ON UPDATE CASCADE
  ON DELETE CASCADE
```

- Set sid in Enrolled tuples that refer to it to a _default sid_

```sql
FOREIGN KEY taughtBy REFERENCES Professor
  ON DELETE SET DEFAULT
```

- Set sid in Enrolled tuples that refer to it to a special value `null`, denoting _unknown_ or _inapplicable_

```sql
FOREIGN KEY taughtBy REFERENCES Professor
  ON DELETE SET NULL
```




