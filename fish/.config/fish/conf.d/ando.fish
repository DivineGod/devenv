status is-interactive || exit

set --global _ando_git _ando_git_$fish_pid

function $_ando_git --on-variable $_ando_git
    commandline --function force-repaint
end

set --global _ando_italic (echo -e "\e[3m")
set --global _ando_dim (echo -e "\e[2m")
set --global _ando_bold (echo -e "\e[1m")
set --global _ando_warn (set_color yellow)
set --global _ando_error (set_color red)
set --global _ando_ok (set_color green)
set --global _ando_info (set_color blue)
set --global _ando_comment $_ando_italic$_ando_dim(set_color brcyan)
set --global _ando_normal (set_color normal)

function _ando_pwd_fun --on-variable PWD
    set --local root (command git rev-parse --show-toplevel 2>/dev/null |
    string replace --all --regex -- "^.*/" "")
    set --global _ando_pwd (
        string replace --ignore-case -- ~ \~ $PWD |
        string replace -- "/$root/" /:/ |
        string replace --regex --all -- "(\.?[^/]{1})[^/]*/" \$1/ |
        string replace -- : "$root" |
        string replace --regex -- '([^/]+)$' "\x1b[1m\$1\x1b[22m" |
        string replace --regex --all -- '(?!^/$)/' "\x1b[2m/\x1b[22m"
    )

    test "$root" != "$_ando_git_root" &&
        set --global _ando_git_root $root && set $_ando_git
end

function _ando_mode --on-variable fish_bind_mode
    set -l mode 'ᚦ'

    switch $fish_bind_mode
        case default
            set mode 'ᛝ'
        case insert
            set mode 'ᚦ'
        case replace-one
            set mode 'ᚱ'
        case visual
            set mode 'ᛄ'
    end

    set --global _ando_mode $mode
end

function _ando_fish_prompt --on-event fish_prompt
    set -l last_status $status # Must be first

    set --query _ando_pwd_fun || _ando_pwd_fun

    if not set -q -g __fish_prompt_functions_defined
        set -g __fish_prompt_functions_defined

        function _status_okay
            [ $argv[1] = 0 ]
        end
    end

    set --global _ando status_color "$_ando_warn"
    if _status_okay $last_status
        set --global _ando_status_color "$_ando_ok"
    else
        set --global _ando_status_color "$_ando_error"
    end

    command kill $_ando_last_pid 2>/dev/null

    fish --private --command "
    # No git repo? just ping the var and exit
    ! command git --no-optional-locks rev-parse 2>/dev/null && set $_ando_git && exit

    set --global _ando_info_color \"\$_ando_ok\"
    set --global _ando_upstream \"$ando_symbol_git_clean\"

    function _set_dirty
        set --global _ando_info_color \"\$_ando_warn\"
        set --global _ando_upstream $ando_symbol_git_dirty
    end

    ! command git diff-index --quiet HEAD 2>/dev/null ||
        count (command git ls-files --others --exclude-standard) >/dev/null &&
        _set_dirty

    set branch (
        command git symbolic-ref --short HEAD 2>/dev/null ||
        command git describe --tags --exact-match HEAD 2>/dev/null ||
        command git rev-parse --short HEAD 2>/dev/null |
            string replace --regex -- '(.+)' '@\$1'
    )

    test -z \"\$$_ando_git\" && set --universal $_ando_git \" \$_ando_comment\$branch\$_ando_normal \$_ando_info_color\$_ando_upstream\$_ando_normal\"

    for fetch in true false
        command git rev-list --count --left-right @{upstream}...@ 2>/dev/null |
            read behind ahead

        switch \"\$behind \$ahead\"
            case \" \" \"0 0\"
            case \"0 *\"
                set --global _ando_upstream $ando_symbol_git_ahead
            case \"* 0\"
                set --global _ando_upstream $ando_symbol_git_behind
            case \*
                set --global _ando_upstream $ando_symbol_git_ahead_behind
        end

        set --universal $_ando_git \" \$_ando_comment\$branch\$_ando_normal \$_ando_info_color\$_ando_upstream\$_ando_normal\"
        test \$fetch = true && command git fetch --no-tags 2>/dev/null
    end
  " &

    set --global _ando_last_pid (jobs --last --pid)

end

function _ando_fish_exit --on-event fish_exit
    set --erase $_ando_git
end

function _ando_uninstall --on-event ando_uninstall
    set --names |
        string replace --filter --regex -- "^(_?ando_)" "set --erase \$1" |
        source
    functions --erase (functions --all | string match --entire --regex "^_?ando_")
end

set --query ando_symbol_git_clean || set --global ando_symbol_git_clean ◯
set --query ando_symbol_git_dirty || set --global ando_symbol_git_dirty •
set --query ando_symbol_git_ahead || set --global ando_symbol_git_ahead ↑
set --query ando_symbol_git_ahead || set --global ando_symbol_git_behind ↓
set --query ando_symbol_git_ahead || set --global ando_symbol_git_ahead_behind ⇅
