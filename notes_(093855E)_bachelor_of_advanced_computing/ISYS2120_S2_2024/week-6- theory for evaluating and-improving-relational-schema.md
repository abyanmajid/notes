# Theory for Evaluating & Improving Relational Schema

### Evaluation of a DB Design

**Adequacy requirement:**

- The design show allow representing all the important facts about the design
- Make sure every important process can be done suing the data in the database, by joining tables as needed

**Avoid redundancy requirement:**

- Just avoid redundancy bro i.e., same info is repeated in several places
- Being able to insert/update/delete info without the need for (extensive) use of null values, or risk to introduce inconsistency

### Evils of Redundancy

_Redundancy_ is the root of several problems associated with relational schemas:

- **Wasteful Storage:** Redundant data consume extra space 
- **Insertion Anomaly:** Redundant data can make it difficult to insert new info without violating conis
- **Deletion Anomaly:** Deleting a record with redundant info can cause important data to be unintentionally lost e.g., if student and enrollment are in the same table, deleting enrollment could remove the student info
- **Update Anomaly:** Redundant data requires multiple updates across records, increasing the risk of inconsistency

### Anomalies Example:

<img width="388" alt="image" src="https://github.com/user-attachments/assets/99daeaa2-0599-4ce8-b9c1-dca6bebac48b">

Insertion Anomaly:
- If another company buys a stake into an existing mine, we have to
re-enter the ‘mine/state’ information, also 
“commodity/abbrv/capacity”, causing duplication.
– What if we want to insert a mine which has no owner so far? 
We either cannot do it at all (PK!) or we get many NULL values.
• Deletion Anomaly: 
– If we delete all Uranium mines, we loose the information that ‘U’ is 
the chemical identifier for the commodity ‘Uranium’!
– Or if composite PK, we cannot delete the last company for a mine!
• Update Anomaly: 
– For changing, e.g., the homepage of a company, we have to update 
multiple tuples, ., or risk introducing inconsistency
Why do these anomalies exist here? 
Because there are multiple themes (entity types) placed into one 
relation. This results in duplication and unnecessary dependencies

### Anomalies Example:





