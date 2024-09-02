# Git Command Guide
```bash
# set a name that is identifiable for credit when review version history
git config --global user.name "[firstname lastname]"

# set an email address that will be associated with each history marker
git config --global user.email "[valid-email]"

# initialize an existing directory as a Git repository
git init

# retrieve an entire repository from a hosted location via URL
git clone [url]

# show modified files in working directory, staged for your next commit
git status

# add a file as it looks now to your next commit (stage), use -A for all files
git add -A

# commit your staged content as a new commit snapshot
git commit -m "[descriptive message]"

# list your branches. a * will appear next to the currently active branch
git branch

# create a new branch at the current commit
git branch [branch-name]

# switch to another branch and check it out into your working directory
git checkout -b <branch>

# merge the specified branch’s history into the current one
git merge [branch]

# show all commits in the current branch’s history
git log

# add a git URL as an alias
git remote add [alias] [url]

# Transmit local branch commits to the remote repository branch
git push [alias] [branch]
# e.g: git push -u origin master
