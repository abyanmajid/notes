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
