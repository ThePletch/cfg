if [ "${PS1:+set}" = set ]; then
    alias    l='ls'
    alias    ll='ls -la'
    alias    la='ls -A'
    alias    lla='ls -Alg'
    alias    sublime='subl -a'

    git_prompt='$(git_branch_string)'
    PS1="|LOCAL MACHINE| \u@\h \w \! $git_prompt\$ "
fi
