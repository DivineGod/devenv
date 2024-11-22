FISH      := $(shell fish --version 2>/dev/null)
BREW      := $(shell brew --version 2>/dev/null)
CLI_TOOLS := $(xcode-select --install 2>&1 | grep installed;)
RUSTUP    := $(shell rustup --version 2>/dev/null)

default:
	make stow

stow:
	stow fish
	stow git
	stow alacritty
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
	echo >> /Users/dg/.zprofile
	echo 'eval "$$(/opt/homebrew/bin/brew shellenv)"' >> /Users/dg/.zprofile
	eval "$$(/opt/homebrew/bin/brew shellenv)"
else
endif

	/opt/homebrew/bin/brew bundle
	make stow
