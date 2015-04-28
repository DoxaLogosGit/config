set nocompatible
behave mswin

" set diffexpr=MyDiff()
" function MyDiff() let opt = '' if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"     if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"     silent execute '\"!/usr/bin/vimdiff\" -a ' . opt . v:fname_in . ' ' . v:fname_new . ' > ' . v:fname_out
" endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctag_Cmd='ctags'
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Compart_Format = 1 " show small menu
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_File_Fold_Auto_Close = 0 " Do not close tags for other files

filetype off
call pathogen#incubate()
call pathogen#helptags()
execute pathogen#infect()

filetype plugin indent on
syntax on
colorscheme jaydark
let TE_Use_Right_Window = 1
" Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python source $HOME/.vim/plugin/python.vim
autocmd BufReadPost quickfix map <buffer> <silent> <CR> :.cc <CR> :ccl
au FileType set ominfunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview

" Syntastic settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map={"mode": "active", "active_filetypes": ["python"]}
let g:syntastic_python_checkers=["pep8","pyflakes","pylint"]
" let g:syntastic_python_pylint_quiet_messages={'level': 'warnings','regex': 'C0325'}
let g:syntastic_python_pylint_args="--rcfile=~/.pylintrc"
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Setup syntax
au BufNewFile,BufRead *.yang set filetype=yang
au BufNewFile,BufRead *.jinja set filetype=jinja

let g:ack_default_options = " -H --nocolor --nogroup --column"
let ackprg = "/usr/bin/ack"
let g:ackprg = "/usr/bin/ack"

let g:C_AuthorName = "Jay Atkinson"
let g:C_AuthorRef = "JGA"
let g:C_Email = "jay.atkinson@adtran.com"
let g:C_Company = "ADTRAN, Inc."
"let g:C_Comments = no
set viminfo='50,<50,s50,h,rA:,rB:,!
set sessionoptions=options,tabpages,globals,curdir,winpos,resize,winsize,buffers
let bex=".bak"
set tabstop=4
set sw=4
set et
set number
set smarttab
set completeopt=menu
"set guifont=Monospace:h10
let generate_tags=1
let g:ctags_statusline=1
set nowrap
set swb=useopen
set tpm=10
set nohls
let b:loadcount=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Exvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:exvim_custom_path='~/Projects/git/main/'
"source ~/Projects/git/main/.vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden 
                         \ --ignore .git
                         \ --ignore .gradle
                         \ --ignore .svn
                         \ --ignore .hg
                         \ --ignore .ccache
                         \ --ignore "**/*.pyc"
                         \ -g ""'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMaxSize = 7
hi link MBEVisibleChanged Error
"hi link MBEVisibleNormal Error
"hi link MBENormal Error
hi MBEChanged gui=bold guibg=darkblue guifg=white
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplModSelTarget = 1
" -------------------- 
" ShowMarks 
" -------------------- 
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" 
let g:showmarks_enable = 1 
let g:showmarks_hlline_lower = 1 
let g:showmarks_hlline_upper = 1 
let g:showmarks_hlline_other = 1 
" For marks a-z 
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue 
" For marks A-Z 
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed 
" For all other marks 
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow 
" For multiple marks on the same line. 
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen 
" pylint mode
" let g:PyLintCWindow = 1
" let g:PyLintSigns = 1
" let g:PyLintOnWrite = 1
" let g:PyLintDisabledMessages = 'W0703'

" -------------------- 
" Source Explorer
" -------------------- 
" Initialize the height of Source Explorer
" -------------------- 
noremap <silent> <F6> <Esc><Esc>:SessionList<CR>
inoremap <silent> <F6> <Esc><Esc>:SessionList<CR>
let g:sessionman_save_on_exit = 0
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
"map <F5> :w\|!python %<CR>
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
nmap <leader>a <ESC>:Ack!
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>


"set wiw=78
"set wh=50
