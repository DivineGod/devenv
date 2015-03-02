#!/bin/bash

#Inspired by @garybarnhardt

HASH="%C(yellow)%h%C(reset)" # %h (short hash)
REL_TIME="%C(green)%ar%C(reset)" # %ar (author relative_time)
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
