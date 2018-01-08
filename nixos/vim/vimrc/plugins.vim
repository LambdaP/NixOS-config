"" Plugin options

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

" NERD Tree on launch
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close if last window is a NERD Tree window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let $HASKTAGS_VIM=expand("~/.config/nvim/hasktags.vim")
if filereadable($HASKTAGS_VIM)
    source $HASKTAGS_VIM
endif

" ALE Haskell linters
"
" Default linters include 'stack-ghc' and 'ghc-mod' on top of those below.
" ALE isn't capable of seeing project-defined names, leading to annoying
" error messages.
" This is a very heavy way of shitting them up.
" TODO: investigate a lighter way to accomplish this, without turning the
"       linter off entirely.

let g:ale_linters ={
      \   'haskell': ['hlint', 'hdevtools', 'hfmt'],
      \}

" Haskell-vim indentation
let g:haskell_indent_where = 2

" Let vim-airline convey ALE info
let g:airline#extensions#ale#enabled = 1

" Auto-use indent guides
let g:indent_guides_enable_on_vim_startup = 1

let g:vimtex_view_method = 'zathura'
