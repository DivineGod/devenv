# divinegod dotfiles

Setup new system:

```
make install
```

## Stuff it does

Uses:

* fish
* vim
* brew
* alacritty
* tmux

## Config

Add new folder for each package config.
Update Makefile with new `stow <package>` command.
Stow will symlink into the parent directory so make sure .dotfiles is located in `~/`
