function ...
    ../..
end

function ....
    ../../..
end

function .....
    ../../../..
end

function ......
    ../../../../..
end

function afind
    ack -il
end

function brews
    brew list -1
end

function bubc
    brew upgrade; and brew cleanup
end

function bubo
    brew update; and brew outdated
end

function bubu
    bubo; and bubc
end

function ctags
    /usr/local/bin/ctags
end

function d
    dirs -v | head -10
end

function g
    git
end

function ga
    git add
end

function gaa
    git add --all
end

function gapa
    git add --patch
end

function gb
    git branch
end

function gba
    git branch -a
end

function gbd
    git branch -d
end

function gbda
    'git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
end

function gbl
    git blame -b -w
end

function gbnm
    git branch --no-merged
end

function gbr
    git branch --remote
end

function gbs
    git bisect
end

function gbsb
    git bisect bad
end

function gbsg
    git bisect good
end

function gbsr
    git bisect reset
end

function gbss
    git bisect start
end

function gc
    git commit -v
end

function "gc!"
    git commit -v --amend
end

function gca
    git commit -v -a
end

function "gca!"
    git commit -v -a --amend
end

function gcam
    git commit -a -m
end

function "gcan!"
    git commit -v -a --no-edit --amend
end

function "gcans!"
    git commit -v -a -s --no-edit --amend
end

function gcb
    git checkout -b
end

function gcd
    git checkout develop
end

function gcf
    git config --list
end


function gcl
    git clone --recursive
end

function gclean
    git clean -fd
end

function gcm
    git checkout master
end

function gcmsg
    git commit -m
end

function "gcn!"
    git commit -v --no-edit --amend
end

function gco
    git checkout
end

function gcount
    git shortlog -sn
end

function gcp
    git cherry-pick
end

function gcpa
    git cherry-pick --abort
end

function gcpc
    git cherry-pick --continue
end

function gcs
    git commit -S
end

function gcsm
    git commit -s -m
end

function gd
    git diff
end

function gdca
    git diff --cached
end

function gdct
    git describe --tags `git rev-list --tags --max-count=1`
end

function gdt
    git diff-tree --no-commit-id --name-only -r
end

function gdw
    git diff --word-diff
end

function gf
    git fetch
end

function gfa
    git fetch --all --prune
end

function gfo
    git fetch origin
end

function gg
    git gui citool
end

function gga
    git gui citool --amend
end

function ggpull
    git pull origin (git_current_branch)
end

function ggpur
    ggu
end

function ggpush
    git push origin (git_current_branch)
end

function ggsup
    git branch --set-upstream-to=origin/(git_current_branch)
end
function ghh
    git help
end

function gignore
    git update-index --assume-unchanged
end

function gignored
    'git ls-files -v | grep "^[[:lower:]]"'
end

function git-svn-dcommit-push
    git svn dcommit; and git push github master:svntrunk
end

function gk
    \gitk --all --branches
end

function gke
    gitk --all (git log -g --pretty=%h)
end

function gl
    git pull
end

function glg
    git log --stat
end

function glgg
    git log --graph
end

function glgga
    git log --graph --decorate --all
end

function glgm
    git log --graph --max-count=10
end

function glgp
    git log --stat -p
end

function glo
    git log --oneline --decorate
end

function globurl
    noglob urlglobber
end

function glog
    git log --oneline --decorate --graph
end

function gloga
    git log --oneline --decorate --graph --all
end

function glol
    git log --graph --pretty="\""(set_color red)%h(set_color normal) -(set_color yellow)%d(set_color normal) %s (set_color green)%cr (set_color --bold blue)<%an>(set_color normal)"\"" --abbrev-commit
end

function glola
    git log --graph --pretty="\""(set_color red)%h(set_color normal) -(set_color yellow)%d(set_color normal) %s (set_color green)%cr (set_color --bold blue)<%an>(set_color normal)"\"" --abbrev-commit --all
end

function glp
    _git_log_prettily
end

function glum
    git pull upstream master
end
function gm
    git merge
end

function gmom
    git merge origin/master
end

function gmt
    git mergetool --no-prompt
end

function gmtvim
    git mergetool --no-prompt --tool=vimdiff
end

function gmum
    git merge upstream/master
end

function gp
    git push
end

function gpd
    git push --dry-run
end

function gpoat
    git push origin --all; and git push origin --tags
end

function gpristine
    git reset --hard; and git clean -dfx
end

function gpsup
    git push --set-upstream origin (git_current_branch)
end

function gpu
    git push upstream
end

function gpv
    git push -v
end

function gr
    git remote
end

function gra
    git remote add
end

function grb
    git rebase
end

function grba
    git rebase --abort
end

function grbc
    git rebase --continue
end

function grbi
    git rebase -i
end

function grbm
    git rebase master
end

function grbs
    git rebase --skip
end

function grep
    grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}
end

function grh
    git reset HEAD
end

function grhh
    git reset HEAD --hard
end

function grmv
    git remote rename
end

function grrm
    git remote remove
end

function grset
    git remote set-url
end

function grt
    cd (git rev-parse --show-toplevel; echo ".")
end

function gru
    git reset --
end

function grup
    git remote update
end

function grv
    git remote -v
end
function gsb
    git status -sb
end

function gsd
    git svn dcommit
end

function gsi
    git submodule init
end

function gsps
    git show --pretty=short --show-signature
end

function gsr
    git svn rebase
end

function gss
    git status -s
end
function gst
    git status
end

function gsta
    git stash save
end

function gstaa
    git stash apply
end

function gstc
    git stash clear
end

function gstd
    git stash drop
end

function gstl
    git stash list
end

function gstp
    git stash pop
end
function gsts
    git stash show --text
end

function gsu
    git submodule update
end

function gts
    git tag -s
end

function gtv
    git tag | sort -V
end

function gunignore
    git update-index --no-assume-unchanged
end
function gunwip
    git log -n 1 | grep -q -c "\-\-wip\-\-"; and git reset HEAD~1
end

function gup
    git pull --rebase
end

function gupv
    git pull --rebase -v
end

function gwch
    git whatchanged -p --abbrev-commit --pretty=medium
end

function gwip
    git add -A; git rm (git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"
end

function hidefiles
    defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder
end

function history
    fc -l 1
end

function ip
    curl -s http://ipinfo.io/ip
end

function ls -w ls
    command ls -G $argv
end

function l
    ls -lah $argv
end

function la
    ls -lAh $argv
end

function ll
    ls -lh $argv
end

function lsa
    ls -lah $argv
end

function md
    mkdir -p $argv
end

function npmD
    npm i -D
end

function npmE
    set PATH (npm bin):$PATH
end

function npmL
    npm list
end

function npmO
    npm outdated
end

function npmS
    npm i -S
end

function npmV
    npm -v
end

function npmg
    npm i -g
end

function npmst
    npm start
end

function npmt
    npm test
end

function ofd
    open_command $PWD
end

function please
    sudo
end

function po
    popd
end

function pu
    pushd
end

function rd
    rmdir
end

function run-help
    man
end

function showfiles
    defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder
end

function weather
    curl http://wttr.in/Melbourne
end

function yi
    yarn install
end

set -g -x GOROOT /usr/local/go
set -g -x GOPATH $HOME/code/go
set -g -x PATH $PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/go/bin $HOME/bin $GOPATH/bin
