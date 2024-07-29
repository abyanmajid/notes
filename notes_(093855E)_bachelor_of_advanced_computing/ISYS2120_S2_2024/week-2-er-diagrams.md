# Week 2

**Text format for relational schema**

For each table: TableName(ColumnName: Type; ColumnTwoName: Type); TableTwoName(ColumnName: Type);

Example:

- Supplier(SuppID: int, SName: string, Phone: string);
- Product(ProdID: int, Descr: string, SuppID: int)

Alternatively, the types may be left out (implicit)

- Supplier(SuppID, SName, Phone);
- Product(ProdID, Descr, SuppID)

**Primary key:** An unique identifier for the rows (i.e., no two rows can have hte same value for the identifier col)

<img width="177" alt="image" src="https://github.com/user-attachments/assets/c29053aa-fdee-44d0-bb7d-6e624eb10734">

**Relational schema diagrams**

<img width="263" alt="image" src="https://github.com/user-attachments/assets/4d779a3d-b8bc-40a3-b328-fc8e009712c1">

**Composite primary key**

In some tables where the nature of the domain is s.t. you can't have an ID, then we can instead have a combination of suitable columns. We say the combination of columns makes a composite primary key.

<img width="403" alt="image" src="https://github.com/user-attachments/assets/ec1381fb-7305-43e5-871c-a49b7f4fa426">

This means for each possible instance, we're not allowed to have 2 rows to match values in every one of the columns involved.

**The "data model" term:** It's used in different ways. It can be the schema of a database. OR, it can also be modelling approach used for the schema e.g., relational model, document model, etc.

**Database Design Sequence**

1. Requirement Analysis "Understand" (what to store, apps to built, frequent operations)
2. Conceptual Design "Develop" (high-level desc of data matching how users think of it - useful for comms with stakeholders)
3. Logical Design "Convert" (turn conceptual design into relational db schema)
4. Physical Design "Convert" (turn logical schema into physical schema (storage choices) for a specific DBMS and tune for workload)

**Conceptual Data Model**

Goal: Specify the database information content.

- A conceptual DB design doesn't tell how data is implemented, created, modified, used, or deleted.
- A conceptual DB model is independent of _kind-of-data-model and of DBMS technology_

**Entity Relationship Model**

- ER Model is a data modelling approach that depicts the associations among different categories of data within a business or information system.
- A DB schema in the ER mdoel is usually represented pictiorially via ER diagrams
- ER Model tells what data "needs to be stored"; it does NOT imply how data is created, modified, used or deleted.

**Entities**

- "Entity": A person, object, event or concept about which you want to gather and store data (e.g., Abyan, ISYS2120)
- "Entity type" or "entity set": A collection of entities that share common properties (e.g., students, courses). It is often described by a set of attributes
- "Attribute": A certain value that describes one aspect of an entity type (e.g., the entity type "Person" has ID, Name, Address, and Hobbies)

More on attributes:

- "Domain": possible values of an attribute
- "Composite attributes": An attribute where the value for one entity has distinct parts e.g., Address attr might have parts: housenumber, streetname, suburb
- "Multi-valued attributes": An attribute where one entity might have >= 1 values e.g., A single person might have several hobbies

**ER Diagrams:**

<img width="442" alt="image" src="https://github.com/user-attachments/assets/c89bfd0a-a8cd-4619-92c6-4b2e2db58737">

**Primary key (PK):** A primary key (PK) for an entity type is an attr (or combination of several attrs) used to uniquely identify an entity.

**Key:** Instead of a PK, there may instead be >= 1 attrs that in combination could serve to distinguish entities. Any attribute, or combinations of attrs, that do so is called a "Key".

**Relationship:** Connects >= 2 entities (often from different entity types) e.g., John _is enrolled in_ ISYS2120

**Relationship type (or relationship set):** A set of similar relationships where the entities in each relationship are always from the same entity types.

**Relationship in ER Diagram:** Diamond represents a relationship type, lines connect the involved entity types to the relationship type

<img width="246" alt="image" src="https://github.com/user-attachments/assets/8f5628bc-9c8d-47dc-aad8-aa8caeb2d7c4">

**Relationship-Attribute:** Relationships can have additional props e.g., John enrols in ISYS2120 as an elective (so John and ISYS2120 are related, and Elective is the value of the _degree_role_ attr for this relationship)

**Relationship-Role:** Each participating entity can be named with an explicit role e.g., John is value of _Student_ role, ISYS2120 value of _Subject_ role. This is useful for relationship type that relates elements of same entity type ("recursive" relationship type)

e.g., "Supervises" is a relationship type between 2 employees. One has role "Manager", the other has role "Subordinate"

**Graphical rep. of Relationships in ER diagrams:**

<img width="404" alt="image" src="https://github.com/user-attachments/assets/4f602ac1-2bdf-4710-a4ea-1240d79a6f2f">

**Relationship degree:** The number of entity types involved

- Unary relationship (also called "Recursive relationship")

<img width="175" alt="image" src="https://github.com/user-attachments/assets/38e7297d-1edc-4ad9-badc-6d8e7a20ab74">

- Binary relationship

<img width="224" alt="image" src="https://github.com/user-attachments/assets/f8a5d9c8-3b27-482c-a99f-2052aa12b818">

- Ternary relationship (involves 3 entity types)

<img width="216" alt="image" src="https://github.com/user-attachments/assets/e4005cb0-44a5-460f-b0bd-0966c3f203b1">




