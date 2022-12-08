if ! ps ax | grep -q [s]sh-agent; then
    eval $(ssh-agent -s)
    ssh-add --apple-use-keychain ~/.ssh/github_ed25519
fi
