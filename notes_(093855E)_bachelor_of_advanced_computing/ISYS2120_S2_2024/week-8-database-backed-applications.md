# Week 8 ISYS2120 (Database-backed Applications)

### Python Database API Interface

**Connection Management:**

- `pg8000.connect()` connects to db
- `conn.cursor()` creates a cursor object for query execution

**Start SQL statements**

- `curs.execute()` start sql statement for static sql, and also parameterized sql queries
  - `curs.execute(sql)` : semi-static sql
  - `curs.execute(sql, params)` : parameterized sql
  - `curs.executemany(sql, seq_of_params)` : repeatedly executes parameterized sql statements
- `curs.callproc()` for executing a stored procedure including parameters

**Result retrieval**

- `curs.fetchone()` retreive next row of ar esult or `None` when no more data
- `curs.fetchall()` retrieve the whole result set, and returns it as a list of tuples

**Transaction control**

- `conn.commit()` finishes (commits) current transaction
- `conn.rollback()` aborts current transaction

**Error handling**

via standard exception handling of Python

### Date/Time Type Objects in DB-API

- `Date` (year, month, day)
- `Time` (hour, minute, second)
- `Timestamp` (year, month, day, hour, minute, second)
- `DateFromTicks` (ticks)
- `TimeFromTicks` (ticks)
- `TimestampFromTicks` (ticks)
- `Binary` (string)

### Cursor concept with Python

```py
curs = conn.cursor()
curs.execute("SELECT title, name, address FROM Emp")
row = curse.fetchone()

while row is not None:
  print(row)
  row = curs.fetchone()
curs.close()
```

Cursor with `fetchAll()` (good for small results, gets memory intensive for large results)

```py
curs.execute("SELECT title, name, address FROM Emp")
resultset = curs.fetchall()
curs.close()

for row in resultset:
  print(row)
```

### `NULL` handling in Python

```py
cursor.execute("SELECT gender FROM Student …")
result = cursor.fetchone()
if result[0] is None:
  # null value
else:
  # no null value
```

### Testing for variable existence / is None

```py
# Ensure variable is defined
try:
  x
except NameError:
  x = None

# Test whether variable is defined to be None
if x is None :
  some_fallback_operation()
else:
  some_operation(x)
```

### Exception Hierarchy of Python DB API

```
StandardError
|__ Warning
|__ Error
    |__ InterfaceError
    |__ DatabaseError
        |__ DataError
        |__ OperationalError
        |__ IntegrityError
        |__ InternalError
        |__ ProgrammingError
        |__ NotSupportedError
```




