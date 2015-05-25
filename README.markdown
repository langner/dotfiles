My generic configuration files
------------------------------

When starting to work on a new machine, I do this in my home directory:
```
cd ~
git init
git remote add origin git@github.com:langner/dotfiles.git
git fetch
git reset origin/master
git status
```

After resolving any conflicts and possibly adding and pushing new files, I usually also ignore some files:
```
git update-index --assume-unchanged README* LICENSE
rm -rvf README* LICENSE
```
