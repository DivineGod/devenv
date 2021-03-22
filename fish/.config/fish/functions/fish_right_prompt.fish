function __ando_is_git_repo
    type -q git; or return 1
    git check-ignore -q . >/dev/null ^/dev/null
    [ $status != 0 ]; and git status -s >/dev/null ^/dev/null
end
function __ando_git_status
    # Reset state if this call is *not* due to a redraw request
    set -l prev_dirty $__ando_dirty
    set -l prev_dirty_color $__ando_dirty_color
    if test $__ando_cmd_id -ne $__ando_git_state_cmd_id
        __ando_abort_check

        set __ando_git_state_cmd_id $__ando_cmd_id
        set __ando_git_static ""
        set __ando_dirty ""
    end

    # Fetch git position & action synchronously.
    # Memoize results to avoid recomputation on subsequent redraws.
    if test -z $__ando_git_static
        # Determine git working directory
        set -l git_dir (command git --no-optional-locks rev-parse --absolute-git-dir 2>/dev/null)
        if test $status -ne 0
            return 1
        end

        set -l position (command git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
        if test $status -ne 0
            # Denote detached HEAD state with short commit hash
            set position (command git --no-optional-locks rev-parse --short HEAD 2>/dev/null)
            if test $status -eq 0
                set position "@$position"
            end
        end

        command git stash list | wc -l | string trim | read stash
        set -l stash_count ""
        if test $stash -gt 0
            set stash_count "$stash"
        end


        # TODO: add bisect
        set -l action ""
        if test -f "$git_dir/MERGE_HEAD"
            set action "merge"
        else if test -d "$git_dir/rebase-merge"
            set branch "rebase"
        else if test -d "$git_dir/rebase-apply"
            set branch "rebase"
        end

        set -l state ""
        if test -n $stash_count
            set state " $ando_error$stash_count"
        end
        set state "$state $ando_comment$position$ando_normal"
        if test -n $action
            set state "$state <$action>"
        end

        set -g __ando_git_static $state
    end

    # Fetch dirty status asynchronously.
    if test -z $__ando_dirty
        if ! set -q __ando_check_pid
            # Compose shell command to run in background
            set -l check_cmd "git --no-optional-locks status -unormal --porcelain --ignore-submodules 2>/dev/null | head -n1 | count"
            set -l cmd "if test ($check_cmd) != "0"; exit 1; else; exit 0; end"

            begin
                # Defer execution of event handlers by fish for the remainder of lexical scope.
                # This is to prevent a race between the child process exiting before we can get set up.
                block -l

                set -g __ando_check_pid 0
                command fish --private --command "$cmd" >/dev/null 2>&1 &
                set -l pid (jobs --last --pid)

                set -g __ando_check_pid $pid

                # Use exit code to convey dirty status to parent process.
                function __ando_on_finish_$pid --inherit-variable pid --on-process-exit $pid
                    functions -e __ando_on_finish_$pid

                    if set -q __ando_check_pid
                        if test $pid -eq $__ando_check_pid
                            switch $argv[3]
                                case 0
                                    set -g __ando_dirty_state 0
                                    if status is-interactive
                                        commandline -f repaint
                                    end
                                case 1
                                    set -g __ando_dirty_state 1
                                    if status is-interactive
                                        commandline -f repaint
                                    end
                                case '*'
                                    set -g __ando_dirty_state 2
                                    if status is-interactive
                                        commandline -f repaint
                                    end
                            end
                        end
                    end
                end
            end
        end

        function _git_branch_name
            echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
        end

        function _is_git_dirty
            set -l _git_state (git status -s --ignore-submodules=dirty ^/dev/null)
            [ "$_git_state" != "" ]
        end

        function _is_git_ahead
            set -l revs (git rev-list origin/(_git_branch_name)..HEAD ^/dev/null)
            [ "$revs" != "" ]
        end

        function _is_git_behind
            set -l revs (git rev-list HEAD..origin/(_git_branch_name) ^/dev/null)
            [ "$revs" != "" ]
        end


        if set -q __ando_dirty_state
            switch $__ando_dirty_state
                case 0
                    set -g __ando_dirty $ando_git_clean
                    set -g __ando_dirty_color green
                case 1
                    set -g __ando_dirty $ando_git_dirty
                    set -g __ando_dirty_color yellow
                case 2
                    set -g __ando_dirty "<err>"
                    set -g __ando_dirty_color red
            end

            if _is_git_behind
                set -g __ando_dirty $ando_git_behind
            end

            if _is_git_ahead
                set -g __ando_dirty $ando_git_ahead
            end

            if _is_git_ahead; and _is_git_behind
                set -g __ando_dirty $ando_git_ahead_behind
            end

            set -e __ando_check_pid
            set -e __ando_dirty_state
        end

    end

    # Render git status. When in-progress, use previous state to reduce flicker.
    echo -n $__ando_git_static ''

    if ! test -z $__ando_dirty
        set_color $__ando_dirty_color
        echo -n $__ando_dirty
    else if ! test -z $prev_dirty
        set_color --dim $prev_dirty_color
        echo -n $prev_dirty
        set_color normal
    end

    set_color normal
end

function __ando_pwd --on-variable PWD
    set --local root (command git rev-parse --show-toplevel 2>/dev/null |
    string replace --all --regex -- "^.*/" "")
    set --global ando_pwd (
        string replace --ignore-case -- ~ \~ $PWD |
        string replace -- "/$root/" /:/ |
        string replace --regex --all -- "(\.?[^/]{1})[^/]*/" \$1/ |
        string replace -- : "$root" |
        string replace --regex -- '([^/]+)$' "\$1" |
        string replace --regex --all -- '(?!^/$)/' "/"
    )
end

function fish_right_prompt
    set --query __ando_pwd || __ando_pwd

    set -l cwd (echo $ando_pwd | string replace "$HOME" '~')

    set_color normal
    echo -n "$ando_dim$cwd"
    set_color normal

    if __ando_is_git_repo
        set -l git_state (__ando_git_status)
        if test $status -eq 0
            echo -sn "$git_state"
        end
    end
end
