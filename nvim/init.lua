-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- File explorer
  { 'scrooloose/nerdtree' },
  { 'jlanzarotta/bufexplorer' },

  -- Language support
  { 'Tetralux/odin.vim' },

  -- Telescope and dependencies
  { 'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Mini.nvim collection
  { 'echasnovski/mini.nvim',
    config = function()
      require('mini.comment').setup({})
      require('mini.snippets').setup({})
      require('mini.completion').setup({})
      require('mini.files').setup({})
      require('mini.surround').setup({})
      require('mini.statusline').setup({})
      require('mini.diff').setup({})
      require('mini.tabline').setup({})
      require('mini.git').setup({})
      require('mini.sessions').setup({})
      require('mini.fuzzy').setup({})
      require('mini.icons').setup({})
      require('mini.colors').setup({})
      require('mini.notify').setup()
      require('mini.map').setup()
      require('mini.indentscope').setup({})
    end
  },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  -- Markdown support
  { 'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },
  { 'tadmccorkle/markdown.nvim',
    config = function()
      require('markdown').setup()
    end
  },

  -- Formatting and LSP
  { 'mhartington/formatter.nvim' },
  { 'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  },
  { 'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require("mason-lspconfig").setup()
    end
  },
  { 'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.enable('jedi_language_server')
      vim.lsp.enable('clangd')
      vim.lsp.enable('ols')
      vim.lsp.enable('rust_analyzer')
    end
  },

  -- Linting
  { 'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        markdown = {'vale'},
        python = {'pflake8'},
      }
    end
  },

  -- Debugging
  { 'mfussenegger/nvim-dap' },
  { 'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio'
    }
  },
  { 'nvim-neotest/nvim-nio' },

  -- Utilities
  { 'nvim-lua/plenary.nvim' },

  -- Claude Code integration
  { 'greggh/claude-code.nvim',
    config = function()
      require('claude-code').setup({
        keymaps = {
          toggle = {
            normal = '<leader>cc',
            terminal = '<leader>cc',
          }
        }
      })
    end
  },

  -- Colorschemes
  { 'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    config = function()
      require("moonfly").custom_colors({
        bg = "#000000",
        fg = "#FFFFFF",
      })
      vim.g.moonflyTransparent = true
      vim.g.moonflyItalics = true
    end
  },
  { 'dasupradyumna/midnight.nvim' },
  { 'yorumicolors/yorumi.nvim' },
  { 'projekt0n/github-nvim-theme' },
  { 'EdenEast/nightfox.nvim' },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { 'ray-x/starry.nvim',
    config = function()
      require("starry").setup()
    end
  },
  { 'Mofiqul/adwaita.nvim',
    config = function()
      vim.g.adwaita_darker = true
      vim.g.adwaita_disable_cursorline = true
      vim.g.adwaita_transparent = true
    end
  },

  -- Git integration
  { 'lewis6991/gitsigns.nvim' },

  -- Uncomment when needed:
  -- { 'epwalsh/obsidian.nvim' },
})

-- Leader key
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

-- Vim settings
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.backup = true
vim.opt.backupdir = { '~/.vim-tmp', '~/.tmp', '~/tmp', '/var/tmp/tmp' }
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.directory = { '~/.vim-tmp', '~/.tmp', '~/tmp', '/var/tmp/tmp' }
vim.opt.writebackup = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.smarttab = true
vim.opt.visualbell = true
vim.opt.errorbells = false
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.switchbuf = 'useopen'
vim.opt.hlsearch = false

-- Viminfo settings
vim.opt.viminfo = "'50,<50,s50,h,rA:,rB:,!"
vim.opt.sessionoptions = "options,tabpages,globals,curdir,winpos,resize,winsize,buffers"

-- Backup extension
vim.g.bex = ".bak"
vim.g.generate_tags = 1
vim.g.ctags_statusline = 1
vim.g.loadcount = 0

-- Deoplete (if still used)
vim.g['deoplete#enable_at_startup'] = 1

-- Autocmd for Odin filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "odin",
  callback = function()
    vim.opt_local.shiftwidth = 4
  end,
})

-- Keymaps
vim.keymap.set('n', '<F2>', '<Esc><Esc>:w!<CR>', { silent = true })
vim.keymap.set('i', '<F2>', '<Esc><Esc>:w!<CR>', { silent = true })
vim.keymap.set('n', '<C-J>', '<C-W>j', { silent = true })
vim.keymap.set('i', '<C-J>', '<C-W>j', { silent = true })
vim.keymap.set('n', '<C-H>', '<C-W>h', { silent = true })
vim.keymap.set('i', '<C-H>', '<C-W>h', { silent = true })
vim.keymap.set('n', '<C-K>', '<C-W>k', { silent = true })
vim.keymap.set('i', '<C-K>', '<C-W>k', { silent = true })
vim.keymap.set('n', '<C-L>', '<C-W>l', { silent = true })
vim.keymap.set('i', '<C-L>', '<C-W>l', { silent = true })
vim.keymap.set('n', '<leader>f', ':lua MiniFiles.open()<CR>', { silent = true })
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { silent = true })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { silent = true })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { silent = true })
vim.keymap.set('n', '<C-SPACE>', 'o<ESC>', { silent = true })

-- Set colorscheme
vim.cmd[[colorscheme adwaita]]
