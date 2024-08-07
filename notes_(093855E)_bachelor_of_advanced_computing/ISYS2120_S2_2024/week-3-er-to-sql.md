# Week 3 ISYS2120 (ER to SQL)

**Mapping strong (usual) entity types:**

- Create a table with the name the same as the entity type
- _For simple attributes:_ Turn them directy onto columns in the table
- _For composite attributes:_ Flattened out by creating a sepearte column for each component attribute
- _Multi-valued attributes:_ Do not include them in the table that corresponds to the entity set. Instead, create another table and convert each component attribute to a column. Then, have an extra column which is a foreign key referencing the entity's primary key.

**Mapping weak entity types:**

- Introduce a separate table with columns for the attributes, and _also_ a foreign key column that references the owning entity.
- Primary key of this table is composite; it is the combination of both: (1) the discriminator of weak entities, and (2) foreign key columns references the primary key of the relation from owning entity.

<img width="401" alt="image" src="https://github.com/user-attachments/assets/7559a530-956d-4a69-a607-2a0f98bd03fd">


**Mapping relationship types:**

Introduce an additional table in the schema with NON-NULL columns (referencing the primary keys of the entity types involved), and also columns for any non-multivalued attributes on the relationship set itself.

- Name of join table can be name of relationship type, or sometimes, schema usest he combination of entity set names.
- Constraints in the table depend on those in relationship type
- If an entity type has cardinality that an entity is involved in at most one relationship, this means the primary key of new table is just the foreign key for that entity type. The primary key of the new table will be the combination of all the columns which are foreign keys referencing involved entity types.

**Mapping many-to-many relationship type:**

<img width="382" alt="image" src="https://github.com/user-attachments/assets/dfe77360-8bef-4d90-8431-00c98016a8e9">

**Mapping many-to-one relationship type:**

<img width="395" alt="image" src="https://github.com/user-attachments/assets/35544533-cb61-49fd-8470-12801fde1217">

Alternative Mapping: We can also choose not to create a join table, _instead_ we might modify the schema of the table that corresponds to the many side to introduce one or more extra columns.

Foreign key references the "one" side, and the primary key of this table stays as before.

If there is also a TOTAL PARTICIPATION constraint for the "many" side, then foreign key of other side is declared NOT NULL.

<img width="385" alt="image" src="https://github.com/user-attachments/assets/a9cb7bbb-e826-4553-b864-70cc23ce8881">

**Mapping of recursive relationship:**

<img width="204" alt="image" src="https://github.com/user-attachments/assets/ba8eb7ce-a35d-40d4-8001-e3d2811e0e37">

**Mapping of ternary relationship:**

<img width="341" alt="image" src="https://github.com/user-attachments/assets/65db26eb-5f32-4e35-ab18-f48df17c14ed">

**Mapping of ISA-hierarchies:**

- Have 2 distinct relations - one for the superclass, and one for the subclass
- Superclass attributes (including key and possible relationships) go into the superclass relation
- Subclass attributes go to the sub-relation; primary key of superclass relation is also included as primary key of subclass relation
- Primary key of subclass relation is also a non-`NULL` foreign key referencing the superclass relation

<img width="459" alt="image" src="https://github.com/user-attachments/assets/1e6b3cdb-85a7-4eb8-934e-a0f743b9e301">





