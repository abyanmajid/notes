# Week 2 SOFT2412

**Waterfall Model Phases**

1. Requirement's analysis and definition via a "Requirements document"
2. System and software design document based on the requirements document
3. Implementation code and test documents using design documents
4. Software components are integrated (whole system code document) and the resulting system is tested (system tests)
5. Operation and maintenance

<img width="203" alt="image" src="https://github.com/user-attachments/assets/59b5b3cf-b65c-4cb6-a913-4dc202a0d9ed">

As you can see, it's really expensive to produce such requirements document!

It's hard and was a lot of effort to elicit requirements specifications from users.

Requirements are often then documented in different formats e.g., "user stories" in agile (plain text, stylized, can be manipulated by tools). Or, in traditional methodologies, often using Word documents in a standard template and signed off as obligation on the developers.

Tracking changes and versions of requirements is very important too!

**Code**

Code as a software artifact is typically spread over different files in a directory structure 

There are language conventions or requirements e.g., Java has a file for each class

Design and architecture play an important role for maintainability e.g., MVC.

**Artifacts**

An artifact is an ite that represent work done, in ways that others can use e.g., code, requirements specification

Artifacts go through evolution and is valuable - thereby needs to be preserved, communicated, maintained, and protected from unauthorized access, etc.

**Version control**

Version control (aka revision control, source control) is a method for recording changes made to a file or set of files over time so that you can refer to specific versions later.

**Version Control System (VCS)**

A version control system (VCS) is a software tool made for software teams to manage chanfges to source code over time (i.e., to do version control!)

They typically allow you to:

- Keep track of every modification to code in a repository
- Revert selected files back to a previous version
- Compare changes over time
- See histories of contributors i.e., who did what
- An issue system and a history of issues i.e., who introduced an issue and when
- Compare earlier versions of the code to help fix bugs while minimizing disruption to all team members

**Local Version Control**

Long time ago, programmers developed Local VCS e.g., Revision Control System (RCS), which worked by keeping patch sets i.e., the differences between files.

<img width="164" alt="image" src="https://github.com/user-attachments/assets/3ac364d8-a505-46a3-a673-8fdd077c1226">

**Centralized Version Control (CVC)**

Then comes centralized version control systems (CVC), which worked by having a single server containing all versioned files. Then, multiple clients check-out files from it. 

Changes are then committed back to the central repo.

BETTER THAN LOCAL VCS: This was an improvement, because we have a single source of truth. However, there is an issue of dependency on the server! If the server is down, then all version control operations are halted! (Single point of failure!)

**Distributed Version Control (DVC)**

DVCs implement multiple repositories i.e., each developer has a complete local copy of the repository - which means most version control operations can be performed locally, and changes can be shared between repositories! This is an improvement from CVCs!

DVC WORKFLOW - Developers clone a remote repo, makes modifications locally, commit changes locally, and push to the remote repo when they're done.

DVCs are the current de facto standard as of 2024 due to developers being able to fully mirror the repository, and added on top of that, DVC's offline version control capabilities!

**Git**

A Distributed VCS that helps dev teams manage changes to source code overtime. It is often paired with a web-based Git repository service such as GitHub in order for dev teams to have a remote, shared repository.

Git captures snapshots in each version (i.e., the state of the entire repository at each commit), not differences (deltas) unlike Delta-based VCSs.

STORAGE OPTIMIZATION: While Git stores full snapshots, it optimizes storage by reusing files that were NOT changed between commits. This kind of model is useful for branching, as each branch is just a series of snapshots!

**Delta-based VCS**

There's also VCSs that work by storing the differences in files (delta) between sucessive versions, instead of the complete versions of files.

Main advantage - Efficient storage ( you dont need to store entire filesystems after all)

HOW IT WORKS - When a file is modified, the system computes the differences between the new version and the previous version, and stores these differences. So, when we need to revert to a certain version, we'd just apply a series of deltas to the original file.









