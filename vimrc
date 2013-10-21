"
" Jason Conklin's vimrc file
" 

" GENERAL SETTINGS
                        " turn on filetype indentation plugin
filetype plugin indent on
syntax on               " syntax highlighting on
if has ("gui_running")
    colorscheme camo " torte
    set guioptions-=m
    set guioptions-=T
endif
set ofu=syntaxcomplete#Complete
                        " make backspace work how I like
set backspace=indent,eol,start
set nocompatible        " noncompatible with vi
set noerrorbells        " shhh...
set expandtab           " spaces, not real tabs
set incsearch           " enable incremental search
set laststatus=2        " always show status bar
set number              " activate line numbers in left margin
set numberwidth=5       " 5 columns for line numbers
set ruler               " show cursor position, lower-left
set scrolloff=3         " begin scrolling 3 lines from window's edge
set showcmd             " show the command being entered
set noshowmode          " do not show current mode (--INSERT--, etc.)
set sidescrolloff=5     " begin scrolling 3 columns from window's edge
set nostartofline       " don't start me out at column 0
                        " format status bar with file info
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%c]%=[%p%%][%O]
set tabstop=4           " default tabs at 4 columns
set shiftwidth=4        " default shift 4 columns at a time
set nowrap              " don't wrap lines

                        " change line nos. from yellow to grey
highlight LineNr ctermfg=DarkGrey

" KEYMAPPING
                        " F2 inserts current date/time in normal and insert modes
                        " Conflict with VimTdb
" :map! <F2> <C-R>=strftime("%c")<CR><Esc>
                        
                        " ts (timestamp) to insert current date/time in normal and insert modes
:map ts a<C-R>=strftime("%c")<CR><Esc>
                        " tn to open new tab (w/optional filename entry)
:map tn :tabnew 
                        " to to close all tabs other than the current
:map to :tabo
                        " open task list ('To Do')
:map td :TaskList<CR>
                        " turn on project view (Taglist Toggle)
:map tt :TlistToggle<CR>
                        " update project view (Taglist Update)
:map tu :TlistUpdate<CR>
                        " add file to taglist
:map ta :TlistAddFiles 
                        " experimental alternative tab navigation
" :map td :tabclose<CR>
" :map tj :tabnext<CR>
" :map tk :tabprev<CR>

" PYTHON IDE
autocmd FileType python set omnifunc=pythoncomplete#Complete

" HASKELL MODE
au BufEnter *.hs compiler ghc
:let g:haddock_browser="/usr/bin/firefox"
:let g:haddock_indexfiledir="~/.vim/"

" Experimental WP mode for writing
" From Seth Brown's blog, http://drbunsen.org/
func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  map j gj 
  map k gk
  setlocal spell spelllang=en_us 
  set thesaurus+=/users/ninly/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! WP call WordProcessorMode()
