# Week 3 SOFT2412 (Tools and Tech for Controlling Artifacts Pt. 2)

**Remote repository**

A remote repo is a _simple_ repo, typically the contents of your `.git` folder and nothing else.

**One-person vs. Team-based projects**

For a one-person project, a local repo should suffice, though they may still have a remote repo in case something happens to their device.

Remote repos are particularly useful for team-based/collaborative projects:

- Team members can push and pull to/from the repo anytime
- It acts as a common repo
- But we need to have some coordination and permission control e.g., only a select few of higher-ups may access the `master` branch

**Remote branches**

Remote references:

- `git ls-remote` : get full list of remote branches
- `git remote show` : get list of remote branches

**Remote-tracking branches**

To copy a remote repository, set up remote tracking (i.e., a connection to the remote repository known as `origin`), and create a local working directory, use:

```
git clone <remote_repo_url>
```

<img width="361" alt="image" src="https://github.com/user-attachments/assets/5995caa8-ebb7-427f-8cb7-199a5b2ed823">

Example: Suppose you have a git server at "git.ourcompany.com"

Doing `git clone git.ourcompany.com` will:

1. Name it `origin`
1. Pulls down all its data
1. Creates a pointer to where its master branch is and call it `origin/master` locally
1. Set your local `master` branch starting at the same place as `origin/master`

NOTE: `origin` is the default name for a remote when you run `git clone`. To name it something else, you can do `git clone -o MyBranch`

**Synchronization**

If someone pushes their work to remote, and you have made changes locally prior to it, you must first sync your work with remote before pushing:

```
git fetch origin
```

**Pushing**

To share your local branch, push it to a remote you have write access to.

Suppose you have a local branch `serverfix`. You can push to a remote branch of the same name:

```
git push origin serverfix
```

This is implicitly calling

```
git push origin serverfix:serverfix
```

which is saying "take my local `serverfix` and make it remote's `serverfix`"

Or, you can push to another branch

```
git push origin serverfix:awesomebranch
```

**Merging from `origin`**

Now, if a collaborator wants to fetch `serverfix` from remote:

```
git fetch origin
```

They get a reference to `origin/serverfix` (a pointer they can't modify). To merge it to their local working branch, they have to do:

```
git merge origin/serverfix
git checkout -b serverfix origin/serverfix
```

**Centralized VCSs Workflow**

Suppose, in a centralized VCS model, Joe and Sarah clones from a shared repo and make changes locally on their respective devices. If Joe pushes his work first, and then Sarah pushes her work after Joe, then the server WILL REJECT the changes, because Sarah must first fetch Joe's changes from the server and merge it locally before pushing the merged changes.

**Integration-Manager Model**

<img width="286" alt="image" src="https://github.com/user-attachments/assets/a008a489-f54b-4378-9249-08df982b7acf">

In this model, we often have a "CANONICAL REPO" that represents the OFFICIAL project. Specifically, the workflow goes like:

1. Main project maintainer pushes to their public repo
1. A contributor clones the main public repo and makes changes
1. The contributor pushes their new version to their own separate public repo
1. The contributor asks the maintainer to pull changes from their separate public repo
1. The maintainer adds the contributor's repo as a remote and merges locally
1. The maintainer pushes merged changes to the main repo.

This is a pretty common workflow in hosted servers like GitHub; its easy to fork a project and push your changes into your fork for everyone to see.

**Dictator and Lieutenants**

It's a variation of the multiple-repos workflow:

- Lieutenants: Various integration managers oversee certain parts of the repo.
- Dictator: All lieutenants have one integration manager

Here's the workflow:

1. Regular devs work on a topic branch and rebase their work on top of master (which is a reference repository to which the dictator pushes).
1. Lieutenants merge the developers' topic branches into their master branch
1. The dictator merges the lieutenants' master branches into the dictator's master branch
1. The dictator pushes that master branch to the reference repository so the other developers can rebase on it.

This is useful for very big projects or highly hierarchical environments e.g., Linux Kernel.

**Integration-Manager vs. Dictator and Lieutenants**

In Integration-Manager model, we have a single integration point and all changes are centralized on the integration manager. This ensures tight, consistent control over the project, but can be a bottleneck since all changes must go through one person.

In Dictator-Lieutenants model, the dictator delegates merging responsibilities to lieutenants, which allows higher scalability as lieutenants manage different parts of the codebase. However, there may be complexity in merging and coordinating across multiple lieutenants due to this model's decentralized nature.

In conclusion, Integration-Manager is suitable for smaller teams where tight control and consistency are paramount. Meanwhile, Dictator and Lieutenants is better for large, complex projects with many contributors.

**Contributing to a Project**

1. Active contributor count: How many users are actively contributing code, and how often?
1. Project workflow: What project workflow/model is used?
1. Commit access: How the type of commit access would affect the contribution workflow?

**Commit guidelines**

- **No whitespace errors:** Don't make changes that introduce trailing whitespace! This can lead to unnecessary merge conflicts! You can do `git diff --check` before committing to list possible whitespace errors. Or, you can, though not advised, let git ignore the warning `git config apply.whitespace nowarn`
- **Commit logically separate change set:** Do not work on many different issues in your code and submit them as one commit!
- **Use quality commit messages:** Write concise description of the change followed by a blank line then a detailed explanation

**Log filter**

```
git log --no-merges issue54..origin/master
```

Log filter that asks git to display ONLY commits that are on `origin/master` that are NOT on `issue54`

**General sequence for working with multiple-devs:**

<img width="299" alt="image" src="https://github.com/user-attachments/assets/bfb44b8a-f189-41b5-91e6-7e0a5e6c33c2">

**Git Remote - Useful Commands**
