lua <<EOF
require('markdown').setup()
require('mini.comment').setup({})
require('mini.surround').setup({})
require('mini.statusline').setup({})
require('mini.tabline').setup({})
require('mini.git').setup({})
require('mini.sessions').setup({})
require('mini.fuzzy').setup({})
require('mini.icons').setup({})
require('mini.colors').setup({})
require('mini.indentscope').setup({})
EOF
