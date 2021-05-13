export GPG_TTY=$(tty)

# set up docker-machine if it's installed
if which docker-machine; then
    eval $(docker-machine env default)
fi
