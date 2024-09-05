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







