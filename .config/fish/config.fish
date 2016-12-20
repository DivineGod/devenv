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

function git -w hub
	command hub $argv
end

function g -w git
    git $argv
end

function ga -w git
    git add $argv
end

function gaa -w git
    git add --all $argv
end

function gapa -w git
    git add --patch $argv
end

function gb -w git
    git branch $argv
end

function gba -w git
    git branch -a $argv
end

function gbd -w git
    git branch -d $argv
end

function gbda -w git
    git branch --no-color --merged | command grep -vE '^(\*|\s*(master|develop|dev)\s*$)' | command xargs -n 1 git branch -d
end

function gbl -w git
    git blame -b -w
end

function gbnm -w git
    git branch --no-merged
end

function gbr -w git
    git branch --remote
end

function gbs -w git
    git bisect
end

function gbsb -w git
    git bisect bad
end

function gbsg -w git
    git bisect good
end

function gbsr -w git
    git bisect reset
end

function gbss -w git
    git bisect start
end

function gc -w git
    git commit -v $argv
end

function "gc!"
    git commit -v --amend $argv
end

function gca -w git
    git commit -v -a $argv
end

function "gca!"
    git commit -v -a --amend $argv
end

function gcam -w git
    git commit -a -m $argv
end

function "gcan!"
    git commit -v -a --no-edit --amend $argv
end

function "gcans!"
    git commit -v -a -s --no-edit --amend $argv
end

function gcb -w git
    git checkout -b $argv
end

function gcd -w git
    git checkout develop
end

function gcf -w git
    git config --list
end


function gcl -w git
    git clone --recursive $argv
end

function gclean -w git
    git clean -fd $argv
end

function gcm -w git
    git checkout master
end

function gcmsg -w git
    git commit -m $argv
end

function "gcn!"
    git commit -v --no-edit --amend $argv
end

function gco -w git
    git checkout $argv
end

function gcount -w git
    git shortlog -sn
end

function gcp -w git
    git cherry-pick $argv
end

function gcpa -w git
    git cherry-pick --abort
end

function gcpc -w git
    git cherry-pick --continue
end

function gcs -w git
    git commit -S $argv
end

function gcsm -w git
    git commit -s -m $argv
end

function gd -w git
    git diff
end

function gdca -w git
    git diff --cached
end

function gdct -w git
    git describe --tags `git rev-list --tags --max-count=1` $argv
end

function gdt -w git
    git diff-tree --no-commit-id --name-only -r $argv
end

function gdw -w git
    git diff --word-diff $argv
end

function gf -w git
    git fetch $argv
end

function gfa -w git
    git fetch --all --prune $argv
end

function gfo -w git
    git fetch origin $argv
end

function ggpull -w git
    git pull origin (git_current_branch) $argv
end

function ggpur -w git
    ggu $argv
end

function ggpush -w git
    git push origin (git_current_branch) $argv
end

function ggsup -w git
    git branch --set-upstream-to=origin/(git_current_branch) $argv
end
function ghh -w git
    git help $argv
end

function gignore -w git
    git update-index --assume-unchanged $argv
end

function gignored -w git
    'git ls-files -v | grep "^[[:lower:]]"'
end

function gl -w git
    git pull $argv
end

function glg -w git
    git log --stat $argv
end

function glgg -w git
    git log --graph $argv
end

function glgga -w git
    git log --graph --decorate --all $argv
end

function glgm -w git
    git log --graph --max-count=10 $argv
end

function glgp -w git
    git log --stat -p $argv
end

function glo -w git
    git log --oneline --decorate $argv
end

function glog -w git
    git log --oneline --decorate --graph $argv
end

function gloga -w git
    git log --oneline --decorate --graph --all $argv
end

function glol -w git
    git log --graph --pretty="\""(set_color red)%h(set_color normal) -(set_color yellow)%d(set_color normal) %s (set_color green)%cr (set_color --bold blue)<%an>(set_color normal)"\"" --abbrev-commit $argv
end

function glola -w git
    git log --graph --pretty="\""(set_color red)%h(set_color normal) -(set_color yellow)%d(set_color normal) %s (set_color green)%cr (set_color --bold blue)<%an>(set_color normal)"\"" --abbrev-commit --all $argv
end

function glum -w git
    git pull upstream master $argv
end
function gm -w git
    git merge $argv
end

function gmom -w git
    git merge origin/master $argv
end

function gmt -w git
    git mergetool --no-prompt $argv
end

function gmtvim -w git
    git mergetool --no-prompt --tool=vimdiff $argv
end

function gmum -w git
    git merge upstream/master $argv
end

function gp -w git
    git push $argv
end

function gpd -w git
    git push --dry-run $argv
end

function gpoat -w git
    git push origin --all; and git push origin --tags
end

function gpristine -w git
    git reset --hard; and git clean -dfx
end

function gpsup -w git
    git push --set-upstream origin (git_current_branch) $argv
end

function gpu -w git
    git push upstream $argv
end

function gpv -w git
    git push -v $argv
end

function gr -w git
    git remote $argv
end

function gra -w git
    git remote add $argv
end

function grb -w git
    git rebase $argv
end

function grba -w git
    git rebase --abort $argv
end

function grbc -w git
    git rebase --continue $argv
end

function grbi -w git
    git rebase -i $argv
end

function grbm -w git
    git rebase master $argv
end

function grbs -w git
    git rebase --skip $argv
end

function grep -w git
    command grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} $argv
end

function grh -w git
    git reset HEAD $argv
end

function grhh -w git
    git reset HEAD --hard $argv
end

function grmv -w git
    git remote rename $argv
end

function grrm -w git
    git remote remove $argv
end

function grset -w git
    git remote set-url $argv
end

function grt -w git
    cd (git rev-parse --show-toplevel; echo ".")
end

function gru -w git
    git reset -- $argv
end

function grup -w git
    git remote update $argv
end

function grv -w git
    git remote -v $argv
end
function gsb -w git
    git status -sb $argv
end

function gsd -w git
    git svn dcommit $argv
end

function gsi -w git
    git submodule init $argv
end

function gsps -w git
    git show --pretty=short --show-signature $argv
end

function gsr -w git
    git svn rebase $argv
end

function gss -w git
    git status -s $argv
end
function gst -w git
    git status $argv
end

function gsta -w git
    git stash save $argv
end

function gstaa -w git
    git stash apply $argv
end

function gstc -w git
    git stash clear $argv
end

function gstd -w git
    git stash drop $argv
end

function gstl -w git
    git stash list $argv
end

function gstp -w git
    git stash pop $argv
end
function gsts -w git
    git stash show --text $argv
end

function gsu -w git
    git submodule update $argv
end

function gts -w git
    git tag -s $argv
end

function gtv -w git
    git tag | sort -V $argv
end

function gunignore -w git
    git update-index --no-assume-unchanged $argv
end
function gunwip -w git
    git log -n 1 | grep -q -c "\-\-wip\-\-"; and git reset HEAD~1
end

function gup -w git
    git pull --rebase $argv
end

function gupv -w git
    git pull --rebase -v $argv
end

function gwch -w git
    git whatchanged -p --abbrev-commit --pretty=medium $argv
end

function gwip -w git
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
set -g -x PATH $PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/go/bin $HOME/bin $GOPATH/bin $HOME/.cargo/bin

set -U fish_pager_color_prefix brblue --bold --underline
