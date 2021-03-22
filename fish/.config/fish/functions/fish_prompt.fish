set ando_italic (echo -e "\e[3m")
set ando_dim (echo -e "\e[2m")
set ando_bold (echo -e "\e[1m")
set ando_warn (set_color yellow)
set ando_error (set_color red)
set ando_ok (set_color green)
set ando_info (set_color blue)
set ando_comment $_ando_italic$_ando_dim(set_color brcyan)
set ando_normal (set_color normal)

# Default appearance options. Override in config.fish if you want.
set --query ando_git_clean        || set --global ando_git_clean ◯
set --query ando_git_dirty        || set --global ando_git_dirty ◯
set --query ando_git_ahead        || set --global ando_git_ahead "↑"
set --query ando_git_behind       || set --global ando_git_behind "↓"
set --query ando_git_ahead_behind || set --global ando_git_ahead_behind "⇅"

if ! set -q ando_status_ok
    set --global ando_status_ok green
end

if ! set -q ando_status_error
    set --global ando_status_error red
end

# State used for memoization and async calls.
set -g __ando_cmd_id 0
set -g __ando_git_state_cmd_id -1
set -g __ando_git_static ""
set -g __ando_dirty ""

# Increment a counter each time a prompt is about to be displayed.
# Enables us to distingish between redraw requests and new prompts.
function __ando_increment_cmd_id --on-event fish_prompt
    set __ando_cmd_id (math $__ando_cmd_id + 1)
end

# Abort an in-flight dirty check, if any.
function __ando_abort_check
    if set -q __ando_check_pid
        set -l pid $__ando_check_pid
        functions -e __ando_on_finish_$pid
        command kill $pid >/dev/null 2>&1
        set -e __ando_check_pid
    end
end


function __ando_vi_indicator
    if [ $fish_key_bindings = "fish_vi_key_bindings" ]
        switch $fish_bind_mode
            case insert
                echo -n 'ᚦ'
            case default
                echo -n 'ᛝ'
            case visual
                echo -n 'ᛄ'
            case replace_one
                echo -n 'ᚱ'
            case replace
                echo -n 'ᚱ'
        end
    end
end

function __ando_status_color
    set -l last_status $status # Must be first

    if [ $last_status = 0 ]
        set_color $ando_status_ok
    else
        set_color $ando_status_error
    end
end

function fish_prompt
    __ando_status_color
    __ando_vi_indicator
    set_color normal
    echo -n ' '
end
