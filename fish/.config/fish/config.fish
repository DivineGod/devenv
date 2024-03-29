set -g fish_key_bindings fish_vi_key_bindings

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.poetry/bin"
fish_add_path "$HOME/go/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/Luxonis/depthai/entrypoint"

if status --is-interactive
  set -x EDITOR "hx"
  eval (/opt/homebrew/bin/brew shellenv)
  atuin init fish | source
end

direnv hook fish | source

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
