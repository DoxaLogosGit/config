  
call plug#begin()
  
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'jlanzarotta/bufexplorer'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-scripts/sessionman.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'build': './install --all', 'merged': 0 }
Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }
Plug 'Tetralux/odin.vim'

call plug#end()
  
" Required:
"filetype plugin indent on
"syntax enable
  
  
"End dein Scripts-------------------------
"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


colorscheme jaydark
  
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
"set statusline+=%{FugitiveStatusline()}
let b:loadcount=0
autocmd FileType odin set shiftwidth=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp/tmp
set writebackup
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
map <C-SPACE> o<ESC>
map <leader>n :NERDTreeToggle<CR>
