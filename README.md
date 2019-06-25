Home Directory
==============

A collection of dotfiles and customization files for my Linux setup.

For a clean setup without git marking every subdirectory of `~/` as a git repository:

```bash
alias home='git --work-tree=$HOME --git-dir=$HOME/.home'
home init
home remote add origin git@github.com:MikeVerdicchio/linux-home.git
home pull origin master # Might have to remove conflicting files
```
