# Contributing to the Software Task Group

We encourage contributors to become a [member](https://www.openhwgroup.org/membership/) of the Open Hardware Group.  New members are always welcome.  The [README](README.md) for this repository will tell you more about the work of the Open Hardware Group and its Software Task Group.

## The mechanics of contributing

If you are new to git and GitHub, the [GitHub Quickstart](https://help.github.com/en/github/getting-started-with-github/quickstart) may prove useful.

1. Clone the [core-v-sw](https://github.com/openhwgroup/core-v-sw) repository:
```
git clone https://github.com/openhwgroup/core-v-sw.git
```

2. [Fork](https://help.github.com/articles/fork-a-repo/) the [core-v-sw](https://github.com/openhwgroup/core-v-sw) repository, so you have a personal copy

3. Add your personal fork to your cloned repository.  If you are using SSH to connet to your personal repository you can do this with.
```
cd core-v-sw
git remote add personal git@github.com:jeremybennett/core-v-sw.git
```
  for HTTPS access, you would use
```
cd core-v-sw
git remote add personal https://github.com/jeremybennett/core-v-sw.git
```

4. You now have a working copy of the repository on your machine, with two remotes, `origin` for the official upstream repository and `personal` for your personal copy.  Create a branch for your contribution (known as a _feature branch_)
```
git checkout -b <feature-branch-name>
```
A useful convention is for the feature branch to start with your GitHub username, then something indicating the purpose (which could be an issue number).  Optionally if this is work that will take some time to complete, a suffix of `_wip` indicates it is _work in progress_.  Here are some example names
```
jeremybennett_new_charter
openhw_mike_issue_43_wip
```

5. Develop and test your code.  Depending on the area you are working in, there may be standard tests to be run as part of continuous integration.  Remember to sign all your commits (the `-s` flag to `git commit`).

6. Push your changes to your personal repository.  The first time you do this you will need to use the `-u` flag to specify the remote to use.
```
git push -u personal <feature-branch-name>
```

   Thereafter, git will remember to use this target.

7. Submit a [pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests) for your feature branch to be incorporated in the master branch.

8. Your changes should be reviewed in a few days.  If you don't get a response within a week, do not hesitate to add a prompt message to the commit.  More complex issues may need to be reviewed at the monthly meeting.

9. If your pull request is accepted, one of the repository administrators will meerge it and you are done.  If you are asked to make changes, then you should do so and add a message when they are made (the pull request will pick the changes up automatically as you make them).

10. Finally make sure your feature branch is rebased on the current master before submitting a pull request.  You can do this as follows
```
git checkout master
git pull
git checkout <feature-branch-name>
git rebase master
git push -f
```

   You need the `-f` to force the push of your feature-branch, since by rebasing on `master`, you are modifying its history.  It is quite possible that the `git rebase` may identify conflicts, where both your feature branch and master have made changes to the same part of the repository.  You will need to [resolve these conflicts](https://help.github.com/en/github/using-git/resolving-merge-conflicts-after-a-git-rebase) before pushing your feature branch.
