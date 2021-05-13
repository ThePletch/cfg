if [ "${PS1:+set}" = set ]; then
    alias    l='ls'
    alias    ll='ls -la'
    alias    la='ls -A'
    alias    lla='ls -Alg'
    alias    sublime='subl -a'

    git_prompt='$(git_branch_string)'
    PS1="\[\e[0;34m\][\t] \[\e[0;32m\]\u@\H \[\e[0;33m\]\w \! \[\e[0;36m\]$git_prompt\n\[\e[0;34m\]\s\v\$ \[\e[0;37m\]"
fi
