set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax on
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set termguicolors
set sw=2
set relativenumber
so ~/.vim/plugins.vim
so ~/.vim/plugin-config.vim
so ~/.vim/maps.vim

highlight Normal ctermbg=NONE
set laststatus=2
set noshowmode

"" Theme
colorscheme gruvbox

au BufNewFile,BufRead *.html set filetype=htmldjango

"" nvim only
if has('nvim')
   lua require'colorizer'.setup()
   " My Functions
   " ************
   " Terminal Function -> ctrl+T
   let g:term_buf = 0
   let g:term_win = 0
   function! TermToggle(height)
       if win_gotoid(g:term_win)
           hide
       else
           botright new
           exec "resize " . a:height
           try
               exec "buffer " . g:term_buf
           catch
               call termopen($SHELL, {"detach": 0})
               let g:term_buf = bufnr("")
               set nonumber
               set norelativenumber
               set signcolumn=no
           endtry
           startinsert!
           let g:term_win = win_getid()
       endif
   endfunction

   " Toggle terminal on/off (neovim)
   nnoremap <C-t> :call TermToggle(12)<CR>
   inoremap <C-t> <Esc>:call TermToggle(12)<CR>
   tnoremap <C-t> <C-\><C-n>:call TermToggle(12)<CR>
endif


"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

