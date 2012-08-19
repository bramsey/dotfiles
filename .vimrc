" General
" Enable filetype plugins
filetype plugin on
filetype indent on
set autoread
call pathogen#infect()
set clipboard=unnamed
   
" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
nnoremap ; :

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <leader>no :NERDTreeToggle<cr>
map <leader>nc :NERDTreeClose<cr>

" Vim UI
set ruler
set number
set smartcase
set hlsearch
set incsearch
set showmatch
set mat=2
set hidden
set scrolloff=3

" Colors and Fonts
syntax enable
colorscheme railscasts
" highlight past 80 chars
:match DiffAdd '\%>80v.*'
source ~/.vim/plugin/matchit.vim

" Text, tab, and indents
set expandtab " Spaces instead of tabs
set shiftwidth=4
set tabstop=4
set smarttab

set si " Smart indent
set ai " auto indent

" Visual mode related
vnoremap <silent> * :call VisualSelection('f')<CR>


" Moving around, tabs, windows, buffers
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR> :NERDTreeFind<CR> <C-W>l<CR>
nnoremap <Leader>f :bn<CR> :NERDTreeFind<CR> <C-W>l<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

hi CursorLine   cterm=NONE ctermbg=darkgreen ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Files and backups

set nobackup
set nowb
set noswapfile

" Status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Use javascript plugin for json
autocmd BufNewFile,BufRead *.json set ft=javascript

" Helper functions
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
