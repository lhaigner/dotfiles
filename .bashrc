export PS1='\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\] '

alias df='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias ssh='kitty +kitten ssh'

eval "$(direnv hook bash)"
