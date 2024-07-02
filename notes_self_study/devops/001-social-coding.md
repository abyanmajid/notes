# Social coding

## The social coding principle

Social coding is the DevOps solution to improving a suboptimal feature by enforcing the open-source contribution follow to internal projects. It goes something like this:

1. Each product is in its own repository with an owner who has complete control over all changes made to it.
2. As an outsider, you discuss your proposition with the repo owner
3. If both of you agree, then you start by opening an issue and assign it to yourself (so everyone knows you're working on it)
4. Fork the code and make your changes
5. Issue a pull request and the repo owner has to review and can decide whether it should be merged.

This is a much more efficient workflow as supposed to reinventing the entire wheel.

## Pair programming

An aspect of social programming taken from Extreme Programming (XP):

- Two programmers on one workstation
- The driver is typing
- The navigator is reviewing
- Every 20 minutes they switch

You may think that pair programming is using twice the resources to get the same result, but no, you don't "exactly" get the same results. You get:

- Higher code quality
- Defects found ealier
- Lower maintenance costs
- Skills transfer
- Two set of eyes on every line of code
- Broader undestanding of codebase

## Git repository guidelines

1. Create a separate git repository for every component (eg. for each microservice or whatever unique thing you're building)
2. Create a new branch for every issue (there should be a `main` branch and a lot of feature branches)
3. Use pull requests to merge your code back to `main`
4. Never merge your own pull request! Every pull request is an opportunity for code review!

## Working in small batches

You should work in small batches (eg., using the single piece flow) so that you get a much quicker feedback loop which helps you identify any problems before you'd get too deep and waste time and resources.
