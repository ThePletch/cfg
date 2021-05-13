function main_branch_name() {
    git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'
}

function main_branch_guard() {
	if [ "$(git rev-parse --abbrev-ref HEAD)" = "$(main_branch_name)" ]; then
		echo "$1"
		exit 1
	fi
}
