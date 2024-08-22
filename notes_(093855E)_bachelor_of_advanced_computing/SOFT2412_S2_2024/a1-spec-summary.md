# A1 Spec Summary

**Final product:** A currency converter software application in Java

## Part 1 - Agile Tools Setup

- [ ] Have a single shared GitHub repo
- [ ] Have gradle for build automation
- [ ] Have JUnit for testing (75% coverage, cover all normal and edge cases you can think of) - integrated with gradle and a code coverage tool
- [ ] CI with Jenkins, It should automatically run Gradle and JUnit for every new commit in a particular branch e.g., master. Jenkins must be integrated via webhooks (or NGrok). Jenkins must show test reports

## Part 2 - Building the App using Agile Tools

- [ ] Two user types: Admin and user.
- [ ] A regular user can: (1) convert from one currency to another i.e., input money amount with a certain currency symbol, and the target currency to be converted to, and (2) display most popular currencies in a 4x4 table of currencies, where every cell is an exchange rate between currencies (SEE TABLE BELOW). Most popular currencies must be 4 currencies specified by the admin user. IN the 4x4 table, if the new rate has decreased, a DOWN ARROW (or the letter D) should be shown, and alternatively if it increased, show an UP ARROW (or I). 

<img width="344" alt="image" src="https://github.com/user-attachments/assets/952e4aec-e544-4e6a-9719-80cbb855688e">

- [ ] Initially the app starts with 6 currencies and its exchange rates. Exchange rates must be loaded with the date when the app first runs.
- [ ] An admin user can do everything a regular user can do, AND they can: (1) add new exchange rates daily by entering the date and exchange rate for that date of all currencies stored. A complete history of the changes in exchange rates must be persistent including the rate and its date of addition, (2) add new currency types and its conversion rate.
- [ ] The UI must have clear instructions to guide the user on what they can do, and any correction feedback in case of incorrect inputs.

**Agile Tools:**

We have to demonstrate use of the following tools (AND SHOW EVIDENCE IN REPORT AND DEMO):

- [ ] _GitHub collaboration_ (branching, merging, conflict resolution). Make releases and version the app properly (use SemVer)
- [ ] _Build automation_ triggers successfully with appropriate reporting
- [ ] _Automated tests_ triggers successfully with appropriate test/code coverage and reporting






