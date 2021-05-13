# check cleanliness of branch, append following characters:
# * - unstaged changes
# + - staged but uncommitted changes
# ? - untracked, unignored files
# (only gets called if we're in a git repo, so no need to redirect output)
function git_branch_cleanliness_marker {
    marker=''
    if ! git diff --quiet; then
        # there are unstaged changes
        marker="$marker*"
    fi

    if ! git diff --staged --quiet; then
        # there are staged, but uncommitted changes
        marker="$marker+"
    fi

    if [ ! -z "$(git ls-files --other --directory --exclude-standard)" ]; then
        # there are untracked files that aren't ignored
        marker="$marker?"
    fi

    echo -e "$marker "
}

function git_branch_string {
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        # we're in a git repo, generate branch info
        current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
        echo -e "$current_branch $(git_branch_cleanliness_marker)"
    else
        echo -e ''
    fi
}
