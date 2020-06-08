# Open Hardware Group Software Task Group

This is the main repository for the OpenHW Group Software Task Group.

## About the Open Hardware Group

The [Open Hardware Group website](https://www.openhwgroup.org/) gives an overview of the project: who we are and what we are doing.

### About the Software Task Group

Our work is governed by our [Charter](charter.md).  This is currently in draft, pending ratification.

## Structure of the repository

At the top level is this [README](README.md) and our [Charter](charter.md).

The [meetings](meetings) directory contains agendas and minutes of meetings.

## Contributing

We highly appreciate community contributions.  At present the most valuable contributions are to our meetings, mailing list and Mattermost discussion groups as we plan the work of the group.

In the future we shall have specific projects. Individual work-items within a project will be defined as issues with a task label and pull requests to contribute to those tasks are welcomed.

### Contribution guidelines

The Open Hardware Group follows the [Eclipse Development Process](https://www.eclipse.org/projects/handbook/#edp).  Our practical approach to this can be found in the file [CONTRIBUTING.md](CONTRIBUTING.md).

The key points when submitting a pull request are as follows.

- Smaller commits containing sets of changes which are related are easier to review.  Larger contributions are best split into several smaller commits.
- Explanatory commit messages help us understand your work when reviewing. While we don't have separate ChangeLogs, the [GNU ChangeLog](https://www.gnu.org/prep/standards/html_node/Change-Logs.html#Change-Logs) format provides a useful discipline for structuring commit messages, with an overview of the changes and then details for each file and function that has been changed.
- Don't forget to sign your commits (the `-s` flag to `git commit`) so we know it is your work!
- After reviewing you may need to make some changes.  To help keep a clean commit history, please rebase your branch on `master` after making the changes.  Just ask if you need help on doing this.
