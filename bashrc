alias n='nvim'
alias n.='nvim .'

alias gst='git status'
alias gs='git switch'
alias glog='git log --oneline --graph'
alias gb='git branch'
alias gpl='git pull'
alias gps='git push'
alias ga='git add -A'
alias gm='git merge'

function gc () { # example call: gc "example commit message"
    git commit -m "$1"
}

function gcp () {
    git commit -m "$1" && git push
}

function gac () {
    git add -A && git commit -m "$1"
}

function gacp () {
    git add -A && git commit -m "$1" && git push
}

function curr_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function up_w_main () {
    export mainbranch='main'
    export currbranch=$(curr_branch)
    git switch $mainbranch && git pull && git switch $currbranch && git merge $mainbranch
}

