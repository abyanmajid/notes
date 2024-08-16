# Week 4 ISYS2120 (Relational Algebra)

**Relation**

A RELATION is a named 2D table of data, which consists of rows (or records) and columns (or attributes/fields).

or, more mathematically, given sets $D_1,D_2,...,D_n,$ a relation $R$ is a subset of $D_1\\times D_2\\times ...\\times D_n$. Hence, a RELATION is a set of $n$-tuples ($a_1,a_2,...a_n$) where $a_i\\in D_i$

<img width="577" alt="image" src="https://github.com/user-attachments/assets/87b82ada-adca-4ee9-998b-0b642cd0446d">

**Theory vs. Technology**

A relational RDBMS supports ata in a form close to but not exactly, matching the mathematical relation

- RDBMS allows `null` for unknown information
- RDBMS insists that datatype for any column is from a limited variety, all simple
- RDBMS considers the rows as being arranged in an order
- RDBMS allows duplicate rows

All of the above are NOT true for mathematical relations.

**Relational Algebra (RA) Operations**

Set operations (these operate on 2 relations):

- `UNION` ($\\cup$) tuples in relation 1 or in relation 2
- `INTERSECTION` ($\\cap$) tuples in both relation 1 and relation 2
- `DIFFERENCE` ($-$) tuples in relation 1, but not in relation 2

_IMPORTANT_ - Set operations are only defined when $R$ and $S$ have the same structure: (1) same number of fields, and (2) corresponding fields must have the same names and domains

Operations that produce a relation with only some parts of another relation

- `SELECTION` ($\\sigma$) picks a subset of rows from a relation
- `PROJECTION` ($\\pi$) picks a subset of columns from relation

Operations that combine tuples from 2 tables:

- `CROSS-PRODUCT` ($\\times$) allows us to fully combine 2 relations
- `JOIN` to combine MATCHING tuples from 2 relations

A schema-level "rename" operation

- `RENAME` ($\\rho$) rename one field or even whole relation

RA queries by nesting of multiple operators

**Projection**

To project means to keep only the attributes that are in the projection list.

Duplicates are NOT in the result (so it's a relation)

<img width="569" alt="image" src="https://github.com/user-attachments/assets/64310c3e-2203-4371-af0c-1f191b98cece">

**Selection**

Keeps those rows that satisfy a (Boolean) selection condition based on the attributes.

Example:

$$\\rho\_{country='AUS'}(Student)$$

**Cross-Product**

Each tuple of $R$ is paired with each tuple of $S$.

Mathematically: $R\\times S = {ts|t\\in R\\land s\\in S}$

<img width="515" alt="image" src="https://github.com/user-attachments/assets/b039cda8-e499-4442-8d5f-694f88eacf95">

**Composing Operations**

The resulting relation from an operation can be the input for another relational algebra operation

<img width="246" alt="image" src="https://github.com/user-attachments/assets/3c1521de-f427-4a2a-844f-26950201eb11">

**Conditional join and Equi-join**

A conditional (theta) join considers all pairs of tuples from the relations, but only keep those that satisfy a boolean condition based on the attributes

The resulting schema is the same as the cross-product's schema.

EQUI-JOIN: An equi-join is a special case where the condition contains only a test for equality

<img width="666" alt="image" src="https://github.com/user-attachments/assets/b7cc624d-8886-470d-abef-023669d1fac7">

**Natural Join**

It's like equi-join on all same-named fields, except that the resulting structure has ONLY ONE copy of each of those fields

**Rename**

Allows to name, and therefore to refer to, the results of relational-algebra expressions

Allows to refer to a relation by more than one name.

Notation 1: $\\rho_x(E)$ returns the expression $E$ under the name $X$ (i.e., rename the WHOLE relation)

Notation 2: $\\rho\_{x(a1\\rightarrow b1)}(E)$ i.e., returns the result of expression $E$ under the name $X$, and with the attributes $a_1$, ... renamed to $b_1$ ... (i.e., rename individual attributes). This assumes that RA expression $E$ has arity $n$

<img width="464" alt="image" src="https://github.com/user-attachments/assets/51e96c10-84be-4ff2-9669-498ed13a353e">

**RA without symbols (just using keyboard)**

<img width="617" alt="image" src="https://github.com/user-attachments/assets/a80a6eb2-ba31-44a5-9a4f-0b43c9ead17a">

**Relational Division**

Find the items in a set that are related to all tuples in another set.

$$R/S$$

where the base set $S$ is the "divisor" (or "denominator"), and the candidate set $R$ is the dividend (or numerator)

This can be seen as the INVERSE of Cross Product!

<img width="533" alt="image" src="https://github.com/user-attachments/assets/8c782eee-3a0f-4c8f-a5a6-629eda345cc2">

**Equivalence Rules**

<img width="560" alt="image" src="https://github.com/user-attachments/assets/a2b43dfa-c4c9-4392-951b-85cae18afe02">
