set -g fish_key_bindings fish_vi_key_bindings

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.poetry/bin"
fish_add_path "$HOME/go/bin"

if status --is-interactive
  set -x EDITOR "vim"
  eval (/opt/homebrew/bin/brew shellenv)
end

direnv hook fish | source

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
