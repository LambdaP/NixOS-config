" Fish compatible ----------------------------------------------------- {{{

set shell=/bin/sh

" " }}}

" Basic options ------------------------------------------------------- {{{
"
" Most of this is probably not required with nvim

set title           " Change the terminal title
set showcmd         " count highlighted
set ruler           " Show where I am in the command area
set colorcolumn=80  " vertical ruler at 80 characters
set laststatus=2    " always show the status line
                    " ↪ (0 = never, 1 = default [multi-window only])

set noml            " Don't read first/last lines of file for settings
set hidden          " Stash unwritten files in buffer
set vb              " Don't beep at me
set cursorline      " Highlight current line
set scrolloff=3     " Start scrolling when I'm 3 lines from top/bottom
set history=10000   " Remember commands and search history
set backspace=2     " Backspace over indent, eol, and insert

set number          " Show linenumbers
set nowrap          " Turn off linewrap

set expandtab       " Expand tabs to spaces

" TODO: make this syntax-dependent.
" hs   -> 2
" C    -> 8?
" rest -> 4
set tabstop=2       " 8 spaces
set shiftwidth=2    " 8 spaces
set softtabstop=2   " 8 spaces

set ignorecase      " when searching
set smartcase       " …unless I use an uppercase character

set showmatch       " show matching brackets
set mat=2

syntax sync minlines=256 " Makes big files slow
set synmaxcol=2048  " Also long lines are slow

set autoindent      " Indent
set smartindent     " Do your best

set fileformats=unix,dos,mac

set undodir^=~/.config/nvim/undo/ " Places .un~ files in the correct directory
set undofile
set undolevels=10000  " max number of changes that can be undone
set undoreload=100000 " max number lines to save for undo
                      " on buffer reload

" Sane auto-completion
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set completeopt+=longest

" https://github.com/adobe-fonts/source-code-pro
set guifont=Source\ Code\ Pro\ 14 " GUI font

" Yell for long lines
au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>75v.\+', -1)

" }}}

" Plugin options ------------------------------------------------------ {{{

" Use deoplete
let g:deoplete#enable_at_startup = 1

" Start completing after two char
let g:deoplete#auto_completion_start_length = 2

" Have types in neco-ghc -- this slows up things a bit. Use 0 for faster.
let g:necoghc_enable_detailed_browse = 1

" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
" 
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#mappings#close_popup() . "\<CR>"
" endfunction

" Neomake after each write.
autocmd! BufWritePost * Neomake

" Open fix list when found.
let g:neomake_open_list = 2

" NERD Tree on launch
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close if last window is a NERD Tree window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

source ~/.config/nvim/hasktags.vim

" }}}

" Colorscheme ----------------------------------------------------------{{{

colorscheme solarized

set background=dark

let g:solarized_visibility      = "high"
let g:solarized_contrast        = "high"
let g:solarized_termcolors      = 16 " 16 if Solarized is the colorscheme
                                     " of iTerm2, 256 otherwise

" }}}

" Convenient Mapping--------------------------------------------------- {{{

let mapleader=","

" Make regex sane
noremap / /\v

" un-highlight search results
noremap <leader><space> :noh<cr>

" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list!<CR>

" Normal/Visual tab for bracket pairs
nnoremap <tab> %
vnoremap <tab> %

"Opens a vertical split and switches over (,v)
nnoremap <leader>v <C-w>v<C-w>l

"Moves around split windows
nnoremap <leader>w <C-w><C-w>

"Moves around tabs
nnoremap <leader>t <Esc>:tabnew<CR>

"Real Returns
nnoremap <leader>R :%s/\r/\r/g<CR>

"Kill endline whitespaces
nnoremap <Leader><Return> :%s/\s\+$//e<CR>

"Moving around windows
map <C-j> <C-W>j
map <A-S-Down> <C-W>j

map <C-k> <C-W>k
map <A-S-Up> <C-W>k

map <C-h> <C-W>h
map <A-S-Left> <C-W>h

map <C-l> <C-W>l
map <A-S-Right> <C-W>l

" Toggle line numbers in normal mode.
function! NumberToggle()
  if(&number == 0)
    set nu
  else
    set nonu
  endif
endfunc

nnoremap <leader>n :call NumberToggle()<cr>

" terminal sanity

tnoremap <Esc> <C-\><C-n> 

let g:neoterm_size = 10

" }}}
