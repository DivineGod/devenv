function fish_prompt
  set -l last_status $status
  if not set -q -g __fish_robbyrussell_functions_defined
    set -g __fish_robbyrussell_functions_defined
    function _git_branch_name
      echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    end

    function _is_git_dirty
      echo (git status -s --ignore-submodules=dirty ^/dev/null)
    end

    function _is_git_repo
      type -q git; or return 1
      git status -s >/dev/null ^/dev/null
    end

    function _hg_branch_name
      echo (hg branch ^/dev/null)
    end

    function _is_hg_dirty
      echo (hg status -mard ^/dev/null)
    end

    function _is_hg_repo
      type -q hg; or return 1
      hg summary >/dev/null ^/dev/null
    end

    function _repo_branch_name
      eval "_$argv[1]_branch_name"
    end

    function _is_repo_dirty
      eval "_is_$argv[1]_dirty"
    end

    function _repo_type
      if _is_hg_repo
        echo 'hg'
      else if _is_git_repo
        echo 'git'
      end
    end
  end

  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l brblue (set_color -o brblue)
  set -l brblack (set_color -o brblack)
  set -l normal (set_color normal)

  set -l statusColor (set_color -o yellow)
  if test $last_status -eq 0
    set statusColor (set_color -o green)
  else
    set statusColor (set_color -o red)
  end

  # set -l arrow "$statusColor❯"
  set -l arrow "$statusColorᚦ"
  if [ $USER = 'root' ]
    # set arrow "$statusColor#"
  end

  set -l pwd $blue(prompt_pwd | sed 's|^~||')
  if [ (prompt_pwd) = '~' ]
    set pwd ""
  else
    set pwd "$pwd"
  end

  set -l repo_type (_repo_type)
  if [ $repo_type ]
    set -l repo_branch (_repo_branch_name $repo_type)
    set repo_info "$brblack$repo_type/$repo_branch"

    if [ (_is_repo_dirty $repo_type) ]
      set -l dirty "$yellow ✗"
      set repo_info "$repo_info$dirty"
    end
  end

  set -l user "$blue$USER"

  echo "$user$pwd $repo_info $normal"

  set -l mode ' '
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
    switch $fish_bind_mode
        case default
          # set_color --bold --background red white
          set mode 'N'
        case insert
          # set_color --bold --background green white
          set mode 'I'
        case replace-one
          # set_color --bold --background green white
          set mode 'R'
        case visual
          # set_color --bold --background magenta white
          set mode 'V'
    end
  end
  echo -n -s $mode$normal $arrow ' '
end
