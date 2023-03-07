alias n='nvim'
alias n.='nvim .'

alias gst='git status'
alias gs='git switch'
alias gb='git branch'
alias gd='git diff'
alias gpl='git pull'
alias ga='git add -A'
alias gm='git merge'
alias gsta='git stash'
alias gstau='git stash --include-untracked'

function gc () { # example call: gc "example commit message"
    git commit -m "$1"
}

function gcp () { # example call: gcp "example commit message"
    git commit -m "$1" && git push
}

function gac () { # example call: gac "example commit message"
    git add -A && git commit -m "$1"
}

function gacp () { # example call: gacp "example commit message"
    git add -A && git commit -m "$1" && git push
}

function gcb () { # example call: gcb exampleBranch
    git checkout -b $1
}

function curr_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function up_main () {
    export mainbranch='main'
    export currbranch=$(curr_branch)
    git switch $mainbranch && git pull && git switch $currbranch
}

function up_w_main () {
    export mainbranch='main'
    export currbranch=$(curr_branch)
    git switch $mainbranch && git pull && git switch $currbranch && git merge $mainbranch
}

function begin_bisect () { # example call: begin_bisect 6f35f8c
    clear && git bisect start && git bisect bad && git bisect good $1
}

function grep_log () { # example call: grep_log "redux"
    clear && git log --all -i --no-merges --pretty=medium --source --name-only --grep="$1"
}

function glog_full () {
    clear && git log --oneline --graph
}

function glog () {
    export mainbranch='main'
    export currbranch=$(curr_branch)
    clear && git log --oneline $mainbranch...$curr_branch
}

function gps () {
    git fetch && git push
}
