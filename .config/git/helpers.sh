#!/bin/bash

#Inspired by @garybarnhardt

HASH="%C(yellow)%h%C(reset)" # %h (short hash)
REL_TIME="%C(green)%ar%C(reset)" # %ar (author relative_time)
DATE="%C(yellow)%ci%C(reset)" # %ci commit time
REFS="%C(red)%d%C(reset)" # %d (decorate)
SUBJECT="%s%C(reset)" # %s (subject)
AUTHOR="%C(blue)<%an>%C(reset)" # %an (author name)
FORMAT="$HASH{$REL_TIME{$REFS $SUBJECT $AUTHOR"

function pretty_log() {
    # $* is splat params from invocation
    git log --graph --pretty="tformat:$FORMAT" $* |
    # -E is extended mode to allow (, ), +, ? without escaping
    sed -E 's/(,.+)? ago//' |
    # align by columns using { as delimiter
    column -t -s '{' |
    # page. quit if only one screen, don't clear, raw control chars, chop lines
    less -FXRS
}

B_FORMAT="$DATE{$REL_TIME{$AUTHOR{@" # @ is for xargs param substitution

function branch_stats() {
    git branch -r $* |
    grep -v HEAD |
    xargs -n 1 -I @ git log --no-merges -n 1 --pretty="tformat:$B_FORMAT" @ |
    sort -r |
    sed -E 's/^[^{]+{//g' |
    column -t -s '{' |
    less -FXRS
}

function pull_push() {
   git checkout master;
   git pull upstream master;
   git push origin master;
   git branch --merged | grep -v "\*" | xargs -n 1 git branch -d;
   git fetch -p;
}
