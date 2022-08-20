alias gitfuckit="git reset --hard"
alias newbranch="git switch -c"
alias branch="git switch"
alias delbranch="git branch -D"
alias pull="git pull"
alias gs="git status"
alias gd="git diff"
alias ga="git add ."
alias gc="git commit"
alias gl="git log"
alias gac="git add .; git commit"
alias gacm="git add .; git commit -m"
alias push="git push origin HEAD"
alias pushforce="git push origin HEAD --force"

function get_main_branch
{
    local MAIN_BRANCH="main"

    if git show-ref --quiet refs/heads/develop; then
        MAIN_BRANCH="develop"
    elif git show-ref --quiet refs/heads/master; then
        MAIN_BRANCH="master"
    fi

    echo $MAIN_BRANCH
}

function get_current_branch
{
    echo $(git branch --show-current)
}

function rebase
{
    local CURRENT_BRANCH=$(get_current_branch)

    branch $1
    pull
    branch $CURRENT_BRANCH
    git rebase "origin/$1"
}

function branchdone {
    local CURRENT_BRANCH=$(get_current_branch)
    local MAIN_BRANCH=$(get_main_branch)

    branch $MAIN_BRANCH
    delbranch $CURRENT_BRANCH
    pull
}
