local servers = {
	"ccls",
	"cssls",
	"eslint",
	"html",
	"jsonls",
	"omnisharp",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"svelte",
	-- "denols",
	"tsserver",
}

for _, lsp in ipairs(servers) do
	require("plugins.lsp.servers." .. lsp)
end
