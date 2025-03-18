if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    atuin init fish | source
end

eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/export-esp.sh
/Users/dg/.local/bin/mise activate fish | source

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
