# Week 1 (ISYS2120)

**Terminology:**

- **Data:** Facts that can be recorded (they're important for users and therefore must persist). Data is valuable in bussineses as day-to-day operations in orgs and also their long-term goals depend on accurate data.
- **Database:** A collection of data (Usually quite large as it contains all data needed to operate an organization or a coherent part of it). Database store records of data, and such collection can guide enterprise strategy (or is of interest to other enterprises).
- **Database Management System (DBMS):** Software package designed to store and manage one or more databases.

**How we store and use data:**

The usual way is to use application programs which all use shared collection of data, and that data is stored in a DBMS.

- For core objectives in large businesses, DBMS is usually commercial e.g., Oracle, MS SQLServer, IBM DB2, etc
- Smaller businesses, or non-mission critical parts of large businesses often use open source DBMS e.g., PostgreSQL, MySQL, etc
- Users run application programs which access the data trhrough the DBMS

Users run apps that access data through the DBMS, and they can get the DBMS to update the data based on input from the users.

**Some data management concerns:**

- Deciding what data to hold (and when to remove it)
- Ensuring data's accuracy
- Ensuring proper use of the data, only by appropriate people
- Ensuring efficient use of the data (e.g., how much hardware is needed, what software is used)

**Metadata**

A key idea in DBMSs is for the database tself to store descriptions of the format of the data. This is called the "System Catalogue" or "Data Dictionary". For example, you can find that for each employee, we keep information about their

- ID which is integer
- Name which is a string up to 30 chars
- Address which is a string up to 60 chars
- Salary which is integer

This info about the structure of the data we keep is often called **"meta-data"** (i.e., data about data)


