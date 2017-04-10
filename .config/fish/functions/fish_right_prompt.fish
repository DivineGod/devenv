function fish_right_prompt

  if not set -q -g __fish_repo_functions_defined
    set -g __fish_repo_functions_defined

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

    function _is_git_repo
      type -q git; or return 1
      git check-ignore -q . >/dev/null ^/dev/null
      [ $status != 0 ]; and git status -s >/dev/null ^/dev/null
    end

    function _repo_branch_name
      eval "_$argv[1]_branch_name"
    end

    function _is_repo_dirty
      eval "_is_$argv[1]_dirty"
    end

    function _is_repo_ahead
      eval "_is_$argv[1]_ahead"
    end

    function _is_repo_behind
      eval "_is_$argv[1]_behind"
    end

    function _repo_type
      if _is_git_repo
        echo 'git'
      end
    end
  end

  if not set -q -g __fish_prompt_functions_defined
    set -g __fish_prompt_functions_defined

    function _status_okay
      [ $argv[1] = 0 ]
    end
  end

  set -l italic (echo -e "\e[3m")
  set -l dim (echo -e "\e[2m")
  set -l bold (echo -e "\e[1m")
  set -l warn (set_color yellow)
  set -l error (set_color red)
  set -l ok (set_color green)
  set -l info (set_color blue)
  set -l comment $italic$dim(set_color brcyan)
  set -l normal (set_color normal)


  set -l pwd $info(prompt_pwd)

  set -l repo_type (_repo_type)
  if [ $repo_type ]
    set -l repo_branch (_repo_branch_name $repo_type)
    set -l repo_details "$comment$repo_branch$normal"

    set -l repo_status_color "$ok"
    set -l repo_status_symbol "◯"

    if _is_repo_dirty $repo_type
      set repo_status_color "$warn"
    end

    if _is_repo_ahead $repo_type
      set repo_status_symbol "↑"
    end

    if _is_repo_behind $repo_type
      set repo_status_symbol "↓"
    end

    if _is_repo_ahead $repo_type;
      and _is_repo_behind $repo_type
      set repo_status_symbol "⇅"
    end

    set -l repo_status "$repo_status_color$repo_status_symbol"
    set repo_info "$repo_details $repo_status"
  end

  echo "$pwd $repo_info$normal"

end

