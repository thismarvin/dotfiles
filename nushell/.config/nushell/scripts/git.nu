export def is-git-directory [] {
	do -i { ^git status }
	| complete
	| if $in.exit_code == 0 { true } else { false }
}

export def git-checkout-empty-tree [] {
	if (is-git-directory) == false {
		error make {
			msg: $"The current directory is not a git directory."
		}
	}

	let empty-tree-hash = (^git hash-object -t tree /dev/null | str trim)
	let commit-hash = (^git commit-tree $empty-tree-hash -m 'create pseudo bare repository' | str trim)

	^git checkout $commit-hash
}
