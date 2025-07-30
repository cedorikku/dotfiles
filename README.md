# dotfiles

Finally started to put my config files in a repo

## Requirements

An example using arch (_arch btw_)

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

### Essentials

Important stuff, like nerd font, to make stuff work nicely especially in neovim

```
pacman -S vim nvim eza zoxide fzf fd ripgrep ttf-firacode-nerd trash-cli
```

## Installation

> [!NOTE]: Make sure to setup your .gitconfig first

First, clone the repo in your $HOME directory using git

```
$ cd $HOME
$ git clone https://github.com/cedorikku/dotfiles.git
$ cd dotfiles
```

or via ssh

```bash
git@github.com:cedorikku/dotfiles.git
```

then use GNU stow to create symlinks

```
$ stow <config-name>
```

e.g. if you need nvim

```
$ stow nvim
```
