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

function d
    dirs -v | head -10
end

function g
    git $argv
end

function ga
    git add $argv
end

function gaa
    git add --all $argv
end

function gapa
    git add --patch $argv
end

function gb
    git branch $argv
end

function gba
    git branch -a $argv
end

function gbd
    git branch -d $argv
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
    git commit -v $argv
end

function "gc!"
    git commit -v --amend $argv
end

function gca
    git commit -v -a $argv
end

function "gca!"
    git commit -v -a --amend $argv
end

function gcam
    git commit -a -m $argv
end

function "gcan!"
    git commit -v -a --no-edit --amend $argv
end

function "gcans!"
    git commit -v -a -s --no-edit --amend $argv
end

function gcb
    git checkout -b $argv
end

function gcd
    git checkout develop
end

function gcf
    git config --list
end


function gcl
    git clone --recursive $argv
end

function gclean
    git clean -fd $argv
end

function gcm
    git checkout master
end

function gcmsg
    git commit -m $argv
end

function "gcn!"
    git commit -v --no-edit --amend $argv
end

function gco
    git checkout $argv
end

function gcount
    git shortlog -sn
end

function gcp
    git cherry-pick $argv
end

function gcpa
    git cherry-pick --abort
end

function gcpc
    git cherry-pick --continue
end

function gcs
    git commit -S $argv
end

function gcsm
    git commit -s -m $argv
end

function gd
    git diff
end

function gdca
    git diff --cached
end

function gdct
    git describe --tags `git rev-list --tags --max-count=1` $argv
end

function gdt
    git diff-tree --no-commit-id --name-only -r $argv
end

function gdw
    git diff --word-diff $argv
end

function gf
    git fetch $argv
end

function gfa
    git fetch --all --prune $argv
end

function gfo
    git fetch origin $argv
end

function gg
    git gui citool $argv
end

function gga
    git gui citool --amend $argv
end

function ggpull
    git pull origin (git_current_branch) $argv
end

function ggpur
    ggu $argv
end

function ggpush
    git push origin (git_current_branch) $argv
end

function ggsup
    git branch --set-upstream-to=origin/(git_current_branch) $argv
end
function ghh
    git help $argv
end

function gignore
    git update-index --assume-unchanged $argv
end

function gignored
    'git ls-files -v | grep "^[[:lower:]]"'
end

function gl
    git pull $argv
end

function glg
    git log --stat $argv
end

function glgg
    git log --graph $argv
end

function glgga
    git log --graph --decorate --all $argv
end

function glgm
    git log --graph --max-count=10 $argv
end

function glgp
    git log --stat -p $argv
end

function glo
    git log --oneline --decorate $argv
end

function glog
    git log --oneline --decorate --graph $argv
end

function gloga
    git log --oneline --decorate --graph --all $argv
end

function glol
    git log --graph --pretty="\""(set_color red)%h(set_color normal) -(set_color yellow)%d(set_color normal) %s (set_color green)%cr (set_color --bold blue)<%an>(set_color normal)"\"" --abbrev-commit $argv
end

function glola
    git log --graph --pretty="\""(set_color red)%h(set_color normal) -(set_color yellow)%d(set_color normal) %s (set_color green)%cr (set_color --bold blue)<%an>(set_color normal)"\"" --abbrev-commit --all $argv
end

function glum
    git pull upstream master $argv
end
function gm
    git merge $argv
end

function gmom
    git merge origin/master $argv
end

function gmt
    git mergetool --no-prompt $argv
end

function gmtvim
    git mergetool --no-prompt --tool=vimdiff $argv
end

function gmum
    git merge upstream/master $argv
end

function gp
    git push $argv
end

function gpd
    git push --dry-run $argv
end

function gpoat
    git push origin --all; and git push origin --tags
end

function gpristine
    git reset --hard; and git clean -dfx
end

function gpsup
    git push --set-upstream origin (git_current_branch) $argv
end

function gpu
    git push upstream $argv
end

function gpv
    git push -v $argv
end

function gr
    git remote $argv
end

function gra
    git remote add $argv
end

function grb
    git rebase $argv
end

function grba
    git rebase --abort $argv
end

function grbc
    git rebase --continue $argv
end

function grbi
    git rebase -i $argv
end

function grbm
    git rebase master $argv
end

function grbs
    git rebase --skip $argv
end

function grep
    grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} $argv
end

function grh
    git reset HEAD $argv
end

function grhh
    git reset HEAD --hard $argv
end

function grmv
    git remote rename $argv
end

function grrm
    git remote remove $argv
end

function grset
    git remote set-url $argv
end

function grt
    cd (git rev-parse --show-toplevel; echo ".")
end

function gru
    git reset -- $argv
end

function grup
    git remote update $argv
end

function grv
    git remote -v $argv
end
function gsb
    git status -sb $argv
end

function gsd
    git svn dcommit $argv
end

function gsi
    git submodule init $argv
end

function gsps
    git show --pretty=short --show-signature $argv
end

function gsr
    git svn rebase $argv
end

function gss
    git status -s $argv
end
function gst
    git status $argv
end

function gsta
    git stash save $argv
end

function gstaa
    git stash apply $argv
end

function gstc
    git stash clear $argv
end

function gstd
    git stash drop $argv
end

function gstl
    git stash list $argv
end

function gstp
    git stash pop $argv
end
function gsts
    git stash show --text $argv
end

function gsu
    git submodule update $argv
end

function gts
    git tag -s $argv
end

function gtv
    git tag | sort -V $argv
end

function gunignore
    git update-index --no-assume-unchanged $argv
end
function gunwip
    git log -n 1 | grep -q -c "\-\-wip\-\-"; and git reset HEAD~1
end

function gup
    git pull --rebase $argv
end

function gupv
    git pull --rebase -v $argv
end

function gwch
    git whatchanged -p --abbrev-commit --pretty=medium $argv
end

function gwip
    git add -A; git rm (git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"
end

function hidefiles
    defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder
end

function npmD
    npm i -D $argv
end

function npmE
    set PATH (npm bin):$PATH
end

function npmL
    npm list $argv
end

function npmO
    npm outdated $argv
end

function npmS
    npm i -S $argv
end

function npmV
    npm -v $argv
end

function npmg
    npm i -g $argv
end

function npmst
    npm start $argv
end

function npmt
    npm test $argv
end

function ofd
    open_command $PWD
end

function please
    sudo $argv
end

function po
    popd $argv
end

function pu
    pushd $argv
end

function rd
    rmdir $argv
end

function run-help
    man $argv
end

function showfiles
    defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder
end

set -g -x GOROOT /usr/local/go
set -g -x GOPATH $HOME/code/go
set -g -x PATH $PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/go/bin $HOME/bin $GOPATH/bin
