local servers = {
	"ccls",
	"clojure_lsp",
	"cssls",
	"eslint",
	"html",
	"jsonls",
	"ols",
	"omnisharp",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"svelte",
	-- "denols",
	"tsserver",
	"zls",
}

for _, lsp in ipairs(servers) do
	require("plugins.lsp.servers." .. lsp)
end
