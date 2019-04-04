complete -c hub -n '__fish_use_subcommand' -a pull-request  -d "Open a pull request on GitHub"
complete -c hub -n '__fish_use_subcommand' -a fork          -d "Make a fork of a remote repository on GitHub and add as remote"
complete -c hub -n '__fish_use_subcommand' -a create        -d "Create this repository on GitHub and add GitHub as origin"
complete -c hub -n '__fish_use_subcommand' -a browse        -d "Open a GitHub page in the default browser"
complete -c hub -n '__fish_use_subcommand' -a compare       -d "Open a compare page on GitHub"
complete -c hub -n '__fish_use_subcommand' -a release       -d "List or create releases (beta)"
complete -c hub -n '__fish_use_subcommand' -a issue         -d "List or create issues (beta)"
complete -c hub -n '__fish_use_subcommand' -a ci-status     -d "Show the CI status of a commit"

complete -c hub --wraps=git

