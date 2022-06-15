export extern "nu" [
	--help(-h)                # Display this help message
	--stdin                   # Redirect the stdin
	--login(-l)               # Start as a login shell
	--interactive(-i)         # Start as an interactive shell
	--version(-v)             # Print the version
	--perf(-p)                # Start and print performance metrics during startup
	--testbin:string          # Run internal test binary
	--commands(-c):string     # Run the given commands and then exit
	--config:string           # Start with an alternate config file
	--env-config:string       # Start with an alternate environment config file
	--log-level:string        # Log level for performance logs
	--threads:int             # Threads to use for parallel commands
	--table-mode(-m):string   # The table mode to use. rounded is default.
]
