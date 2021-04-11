local util = require("lspconfig").util

require("lspconfig").ccls.setup {
  root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git", ".ccls");
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math" };
    };
  }
}
