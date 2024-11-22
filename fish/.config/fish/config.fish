if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    atuin init fish | source
end

eval "$(/opt/homebrew/bin/brew shellenv)"
