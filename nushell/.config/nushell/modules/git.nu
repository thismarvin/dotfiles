export def is-repository [] {
	do -i { ^git status }
	| complete
	| if $in.exit_code == 0 { true } else { false }
}

export def checkout-empty-tree [] {
	if not is-repository {
		error make {
			msg: $"The current directory is not a git repository."
		}
	}

	let empty-tree-hash = (^git hash-object -t tree /dev/null | str trim)
	let commit-hash = (^git commit-tree $empty-tree-hash -m 'tmp: create pseudo bare repository' | str trim)

	^git checkout $commit-hash
}
