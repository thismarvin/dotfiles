# This is duplicated from ../modules/git.nu
def is-repository [] {
	do -i { ^git status }
	| complete
	| if $in.exit_code == 0 { true } else { false }
}

def list-entries-contain-str [list, value: string] {
	$list
	| reduce -f false { |it, acc| if ($it | str contains $value) { true } else { $acc }}
}

def contains-modified-files [git-status] {
	list-entries-contain-str $git-status 'Changes not staged for commit:'
}

def contains-staged-files [git-status] {
	list-entries-contain-str $git-status 'Changes to be committed:'
}

def contains-untracked-files [git-status] {
	list-entries-contain-str $git-status 'Untracked files:'
}

def is-branch-ahead [git-status] {
	list-entries-contain-str $git-status 'Your branch is ahead'
}

def is-branch-behind [git-status] {
	list-entries-contain-str $git-status 'Your branch is behind'
}

def get-git-status [] {
	let git-status = (^git status | lines)

	let modified = if (contains-modified-files $git-status) { '!' } else { '' }
	let staged = if (contains-staged-files $git-status) { '+' } else { '' }
	let untracked = if (contains-untracked-files $git-status) { '?' } else { '' }
	let ahead = if (is-branch-ahead $git-status) { '⇡' } else { '' }
	let behind = if (is-branch-behind $git-status) { '⇣' } else { '' }

	let status = $"($modified)($staged)($untracked)($ahead)($behind)"

	if ($status | str length) > 0 { $" [($status)]" } else { '' }
}

export def create-left-prompt [] {
	let path_segment = $env.PWD
	let git-status = (if is-repository { $" (get-git-status)" } else { '' })

	[(ansi c) $"($path_segment)($git-status)" (ansi reset)] | str collect
}

export def create-right-prompt [] {
	let time_segment = (date now | date format '%Y-%m-%d %R')

	[(ansi c) $time_segment] | str collect
}
