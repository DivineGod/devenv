BREW      := $(shell brew --version 2>/dev/null)
CLI_TOOLS := $(xcode-select --install 2>&1 | grep installed;)
RUSTUP    := $(shell rustup --version 2>/dev/null)

default:
	make stow

stow:
	stow fish
	stow git
	stow alacritty
	stow vim
	stow nvim
	stow tmux
	stow bat

install:
ifndef CLI_TOOLS
else
	xcode-select --install
endif

ifndef RUSTUP
	echo "Rustup isn't installed... Installing"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
endif

ifndef BREW
	echo "Homebrew isn't installed... Installing"
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
endif

	brew bundle
	make stow

	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ifeq ($(wildcard ~/.tmux/plugins/tpm/.),)
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
endif
