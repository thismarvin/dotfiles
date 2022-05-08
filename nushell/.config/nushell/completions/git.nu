# Custom completions for external commands (those outside of Nushell)
# Each completions has two parts: the form of the external command, including its flags and parameters
# and a helper command that knows how to complete values for those flags and parameters
#
# This is a simplified version of completions for git branches and git remotes
def "nu-complete git branches" [] {
	^git branch | lines | each { |line| $line | str replace '[\*\+] ' '' | str trim }
}

def "nu-complete git remotes" [] {
	^git remote | lines | each { |line| $line | str trim }
}

# Download objects and refs from another repository
export extern "git fetch" [
	repository?: string@"nu-complete git remotes" # Name of the branch to fetch
	--all                                         # Fetch all remotes
	--append(-a)                                  # Append ref names and object names to .git/FETCH_HEAD
	--atomic                                      # Use an atomic transaction to update local refs.
	--depth: int                                  # Limit fetching to n commits from the tip
	--deepen: int                                 # Limit fetching to n commits from the current shallow boundary
	--shallow-since: string                       # Deepen or shorten the history by date
	--shallow-exclude: string                     # Deepen or shorten the history by branch/tag
	--unshallow                                   # Fetch all available history
	--update-shallow                              # Update .git/shallow to accept new refs
	--negotiation-tip: string                     # Specify which commit/glob to report while fetching
	--negotiate-only                              # Do not fetch, only print common ancestors
	--dry-run                                     # Show what would be done
	--write-fetch-head                            # Write fetched refs in FETCH_HEAD (default)
	--no-write-fetch-head                         # Do not write FETCH_HEAD
	--force(-f)                                   # Always update the local branch
	--keep(-k)                                    # Keep dowloaded pack
	--multiple                                    # Allow several arguments to be specified
	--auto-maintenance                            # Run 'git maintenance run --auto' at the end (default)
	--no-auto-maintenance                         # Don't run 'git maintenance' at the end
	--auto-gc                                     # Run 'git maintenance run --auto' at the end (default)
	--no-auto-gc                                  # Don't run 'git maintenance' at the end
	--write-commit-graph                          # Write a commit-graph after fetching
	--no-write-commit-graph                       # Don't write a commit-graph after fetching
	--prefetch                                    # Place all refs into the refs/prefetch/ namespace
	--prune(-p)                                   # Remove obsolete remote-tracking references
	--prune-tags(-P)                              # Remove any local tags that do not exist on the remote
	--no-tags(-n)                                 # Disable automatic tag following
	--refmap: string                              # Use this refspec to map the refs to remote-tracking branches
	--tags(-t)                                    # Fetch all tags
	--recurse-submodules: string                  # Fetch new commits of populated submodules (yes/on-demand/no)
	--jobs(-j): int                               # Number of parallel children
	--no-recurse-submodules                       # Disable recursive fetching of submodules
	--set-upstream                                # Add upstream (tracking) reference
	--submodule-prefix: string                    # Prepend to paths printed in informative messages
	--upload-pack: string                         # Non-default path for remote command
	--quiet(-q)                                   # Silence internally used git commands
	--verbose(-v)                                 # Be verbose
	--progress                                    # Report progress on stderr
	--server-option(-o): string                   # Pass options for the server to handle
	--show-forced-updates                         # Check if a branch is force-updated
	--no-show-forced-updates                      # Don't check if a branch is force-updated
	-4                                            # Use IPv4 addresses, ignore IPv6 addresses
	-6                                            # Use IPv6 addresses, ignore IPv4 addresses
]

# Check out git branches and files
export extern "git checkout" [
	...targets: string@"nu-complete git branches"   # Name of the branch or files to checkout
	--conflict: string                              # Conflict style (merge or diff3)
	--detach(-d)                                    # Detach HEAD at named commit
	--force(-f)                                     # Force checkout (throw away local modifications)
	--guess                                         # Second guess 'git checkout <no-such-branch>' (default)
	--ignore-other-worktrees                        # Do not check if another worktree is holding the given ref
	--ignore-skip-worktree-bits                     # Do not limit pathspecs to sparse entries only
	--merge(-m)                                     # Perform a 3-way merge with the new branch
	--orphan: string                                # New unparented branch
	--ours(-2)                                      # Checkout our version for unmerged files
	--overlay                                       # Use overlay mode (default)
	--overwrite-ignore                              # Update ignored files (default)
	--patch(-p)                                     # Select hunks interactively
	--pathspec-from-file: string                    # Read pathspec from file
	--progress                                      # Force progress reporting
	--quiet(-q)                                     # Suppress progress reporting
	--recurse-submodules: string                    # Control recursive updating of submodules
	--theirs(-3)                                    # Checkout their version for unmerged files
	--track(-t)                                     # Set upstream info for new branch
	-b: string                                      # Create and checkout a new branch
	-B: string                                      # Create/reset and checkout a branch
	-l                                              # Create reflog for new branch
]

# Push changes
export extern "git push" [
	remote?: string@"nu-complete git remotes",      # The name of the remote
	...refs: string@"nu-complete git branches"      # The branch / refspec
	--all                                           # Push all refs
	--atomic                                        # Request atomic transaction on remote side
	--delete(-d)                                    # Delete refs
	--dry-run(-n)                                   # Dry run
	--exec: string                                  # Receive pack program
	--follow-tags                                   # Push missing but relevant tags
	--force-with-lease: string                      # Require old value of ref to be at this value
	--force(-f)                                     # Force updates
	--ipv4(-4)                                      # Use IPv4 addresses only
	--ipv6(-6)                                      # Use IPv6 addresses only
	--mirror                                        # Mirror all refs
	--no-verify                                     # Bypass pre-push hook
	--porcelain                                     # Machine-readable output
	--progress                                      # Force progress reporting
	--prune                                         # Prune locally removed refs
	--push-option(-o): string                       # Option to transmit
	--quiet(-q)                                     # Be more quiet
	--receive-pack: string                          # Receive pack program
	--recurse-submodules: string                    # Control recursive pushing of submodules
	--repo: string                                  # Repository
	--set-upstream(-u)                              # Set upstream for git pull/status
	--signed: string                                # GPG sign the push
	--tags                                          # Push tags (can't be used with --all or --mirror)
	--thin                                          # Use thin pack
	--verbose(-v)                                   # Be more verbose
]
