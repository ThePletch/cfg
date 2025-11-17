function main_branch_name() {
    git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'
}

function main_branch_guard() {
	local head_branch
	head_branch="$(git rev-parse --abbrev-ref HEAD)"
	if [ "$head_branch" = main_branch_name ]; then
		echo "fatal: action blocked while on branch '$head_branch'"
		echo "$1"
		exit 1
	fi
}
