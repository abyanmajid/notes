# Week 5 ISYS2120

**Natural language descriptions**

In most settings, a conceptual model is created by first obtaining descriptions of the domain in natural language (e.g., Engish)

- Ask stakeholders to write about the domain
- Ask stakeholders to speak and explain
- Look for existing descriptions (e.g., induction guides for new staff

**Nouns**

Nouns are often the subject or object in a sentence e.g., people (Teacher), places (School), things (Computer), ideas (Happiness). 

Consider whether the noun could be an entity type? or maybe nouns are better as showing that there is an attribute of some entity type?

**Verbs**

Verbs are words that describe action (Run, Write, Jump), occurrence (Happen, Develop, Begin), or state of being (Is, Am, Are, Exist).

Verbs sometimes show connections between entities that can be captured in a relationship type.

**Constraints**

For every entity set, do you know what can be used to unique identify entities (i.e., as primary key)?

Constraints are often captured through use of singular or plural, and through use of "may/can", "must/will"

**Clues to Inheritance Hierarchy**

- Look for phrases such as "some X <do something, have something, are also something>"
- Look for "Both C and Y <do something, have something, are something>"
- Look for a significant amount of common information about 2 entity sets; maybe there's a generalization that makes sense?

**Warnings**

- Check each attribute you propose, to consider whether its better seen as the identifier of some other entity set
- Check each relationship set you propose if there are many attributes of it, consider if it might instead by "reified" as an entity set, which is then related many-to-one to each of the original participating entities

**"Category" entities**

- There can be many objects which are identical in most aspects, e.g., a library has many copies of a book (edition)
- There will usually be an entity set for the category/model/product
- Is there also an entity set for the separate items (individual book copy, tin, plane, etc?)

**Fill in gaps**

- Look at each entity set and relationship set, to be sure you have attributes for all aspects important in the domain
- Look at ways the system might be used ("business processes") and check that you have modelled the information needed to deal with each

**Remove redundancy**

There can be relationships that can be deduced from other relationships e.g., employee works-at office may be redundant if we know employee works-in department and deparment located-at office.

**Iterate**

When you have a proposal of a conceptual model, make sure everything in the text can be found somewhere from the model. Otherwise, you'd have to decide explicitly that this isn't needed for the system.











