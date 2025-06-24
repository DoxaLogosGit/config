  
call plug#begin()
  
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'Tetralux/odin.vim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'echasnovski/mini.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'MeanderingProgrammer/render-markdown.nvim'
Plug 'tadmccorkle/markdown.nvim'
Plug 'mhartington/formatter.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-lint'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-neotest/nvim-nio'
Plug 'nvim-lua/plenary.nvim'
Plug 'bluz71/vim-moonfly-colors', {'as':'moonfly'}
Plug 'dasupradyumna/midnight.nvim'
Plug 'yorumicolors/yorumi.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'EdenEast/nightfox.nvim'
Plug 'nyoom-engineering/oxocarbon.nvim'
Plug 'ray-x/starry.nvim'
Plug 'Mofiqul/adwaita.nvim'
Plug 'lewis6991/gitsigns.nvim'


"Plug 'epwalsh/obsidian.nvim'

call plug#end()

source $HOME/.config/nvim/init.lua.vim

  
" Required:
"filetype plugin indent on
"syntax enable
  
  
"End dein Scripts-------------------------

set termguicolors
set background "dark"
set clipboard=unnamedplus

"colorscheme yorumi
"colorscheme github_dark_high_contrast
"colorscheme oxocarbon
"colorscheme jaydark
colorscheme moonfly
" Use deoplete.
let g:deoplete#enable_at_startup = 1
set viminfo='50,<50,s50,h,rA:,rB:,!
set sessionoptions=options,tabpages,globals,curdir,winpos,resize,winsize,buffers
let bex=".bak"
set tabstop=4
set sw=4
set et
set number
set smarttab
set vb
set noeb
set hidden
"set guifont=Monospace:h10
let generate_tags=1
let g:ctags_statusline=1
set nowrap
set swb=useopen
set tpm=10
set nohls
let b:loadcount=0
autocmd FileType odin set shiftwidth=4

let g:moonflyTransparent = v:true
let g:moonflyItalics = v:true


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp/tmp
set writebackup
" ---------------------------------
"  mappings
" ---------------------------------

noremap <silent> <F2> <Esc><Esc>:w!<CR>
inoremap <silent> <F2> <Esc><Esc>:w!<CR>
noremap <silent> <C-J> <C-W>j
inoremap <silent> <C-J> <C-W>j
noremap <silent> <C-H> <C-W>h
inoremap <silent> <C-H> <C-W>h
noremap <silent> <C-K> <C-W>k
inoremap <silent> <C-K> <C-W>k
noremap <silent> <C-L> <C-W>l
inoremap <silent> <C-L> <C-W>l
nnoremap <leader>f :lua MiniFiles.open()<CR>
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
map <C-SPACE> o<ESC>
