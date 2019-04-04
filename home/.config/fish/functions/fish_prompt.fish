function fish_prompt
  set -l last_status $status

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

  set -l status_color "$warn"
  if _status_okay $last_status
    set status_color "$ok"
  else
    set status_color "$error"
  end

  set -l mode 'ᚦ'
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
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
  end
  echo -n -s "$status_color$mode$normal "
end
