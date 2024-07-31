# SQL Tasks Notes

**Strings:** Strings must be enclosed with single quotes ('). Double quotes (") mean something else in SQL

**Aggregate Functions:**

- **`COUNT():`** An aggregate function that counts the total number of rows in a column/table. `COUNT(*)` counts total number of rows in the table, including `NULL` values. However, `COUNT(columnName)` will only non-`NULL` values will be counted.

- **`MAX(expression):`** Max value of _expression_ across all inputs
- **`MIN(expression):`** Min value of _expression_ accross all inputs
- **`AVG(expression):`** Mean of input values
- **`SUM(expression):`** Sum of _expression_ across all inputs
