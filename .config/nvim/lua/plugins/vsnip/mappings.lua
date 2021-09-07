local map = require("utils").map

-- Jump forward or backward
map("i", "<Tab>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", { expr = true })
map("s", "<Tab>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", { expr = true })
map("i", "<S-Tab>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", { expr = true })
map("s", "<S-Tab>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", { expr = true })
