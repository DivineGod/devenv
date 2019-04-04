# divinegod dotfiles

Use homeshick to setup:

```bash
homeshick clone <url>
```

## Stuff it does

Uses:

* oh_my_zsh in zsh
* fish
* vim
* brew
* brew cask
* nvm
* iterm2 stuff
* alacritty - experimentally so far. Very fast terminal emulator.

### Brew installed formulae

* ncurses - provides updated terminfo use `brew install ncurses; brew link ncurses --force`
* Make sure vim is compiled from source after installing ncurses to get correct italics working. `brew install vim --with-override-system-vi`

### VIM 8

Vim 8 has a new package system so I have moved from using pathogen to using submodules in `.vim/pack/`

## Screenshots
