# Git specific aliases:
alias gs='git status'

alias gsh='git show'
alias gshr='git show --word-diff-regex=.'

alias gd='git diff'
alias gdr='git diff --word-diff-regex=.'

alias gdc='git diff --cached'
alias gdcr='git diff --cached --word-diff-regex=.'

alias ga='git add'
alias gap='git add -p'

alias gco='git checkout'
alias gcb='git checkout -b'

alias gstaki='git stash --keep-index'

alias gspu='git stash && git status'
alias gspo='git stash pop'

# Safe remove git branch
function grmbr {
    set -euo pipefail
    git checkout master \
    && git pull upstream master --ff-only \
    && git diff --quiet $1 \
    && git checkout $1 \
    && git rebase master \
    && git checkout master \
    && git branch -d $1
}

# Google Chrome aliases:
alias igchr='google-chrome --incognito & disown'