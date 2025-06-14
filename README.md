# dotfiles

Finally started to put my config files in a repo

## Requirements

Using arch btw

### Git

NOTE: make sure to setup your .gitconfig first

```
pacman -S git
```

### Stow

```
pacman -S stow
```

### Extras

Some more stuff!

```
vim nvim yazi eza fzf zoxide fastfetch alacritty ttf-firacode-nerd
```

## Installation

First, clone the repo in your $HOME directory using git

```
$ cd $HOME
$ git clone git@github.com:cedorikku/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow <config-name>
```

e.g. if you need nvim

```
$ stow nvim
```
