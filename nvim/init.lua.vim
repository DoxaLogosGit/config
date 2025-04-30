lua <<EOF
require('markdown').setup()
-- mini nvim setup
require('mini.comment').setup({})
require('mini.snippets').setup({})
require('mini.completion').setup({})
require('mini.files').setup({})
require('mini.surround').setup({})
require('mini.statusline').setup({})
require('mini.tabline').setup({})
require('mini.git').setup({})
require('mini.sessions').setup({})
require('mini.fuzzy').setup({})
require('mini.icons').setup({})
require('mini.colors').setup({})
require('mini.indentscope').setup({})
-- snippets
-- local gen_loader = require('mini.snippets').gen_loader
-- require('mini.snippets').setup({
--   snippets = {
    -- Load custom file with global snippets first (adjust for Windows)
--     gen_loader.from_file('~/.local/share/nvim/plugged/friendly-snippets/snippets/global.json'),

    -- Load snippets based on current language by reading files from
    -- "snippets/" subdirectories from 'runtimepath' directories.
--     gen_loader.from_lang(),
--   },
-- })
-- linters
require('lint').linters_by_ft = {
  markdown = {'vale'},
  python = {'pflake8'},
}
require("mason").setup()
-- lsp setup
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
}
vim.lsp.enable('jedi_language_server')
vim.lsp.enable('clangd')
vim.lsp.enable('ols')

EOF
