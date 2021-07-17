local servers = {
	"ccls",
	"omnisharp",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
}

for _, lsp in ipairs(servers) do
	require("plugins.lsp.servers." .. lsp)
end
