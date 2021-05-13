############
#
# User customization file for bash
#
############

# Prepend user's bin directory to path
PATH=$HOME/bin:$PATH

source "$HOME/.bash.d/git-prompt.sh"

if [ "${PS1:+set}" = set ]; then
    alias    l='ls'
    alias    ll='ls -la'
    alias    la='ls -A'
    alias    lla='ls -Alg'
    alias    sublime='subl -a'

    git_prompt='$(git_branch_string)'
    PS1="|LOCAL MACHINE| \u@\h \w \! $git_prompt\$ "
fi

export GPG_TTY=$(tty)

 # Set up autocomplete for git branches
[[ -s "$HOME/.bash.d/git-branch-autocomplete.sh" ]] && source "$HOME/.bash.d/git-branch-autocomplete.sh"

# set up docker-machine if it's installed
if which docker-machine; then
    eval $(docker-machine env default)
fi
