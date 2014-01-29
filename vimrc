"====================
" ninly's vimrc file
"====================

"~~~~~~~~~~~~~~~~~~~~~~~
" Vundle package manager
"~~~~~~~~~~~~~~~~~~~~~~~
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'mhinz/vim-startify'

"~~~~~~~~~~~~~~~~~~
" General settings
"~~~~~~~~~~~~~~~~~~
                        " turn on filetype indentation plugin
filetype plugin indent on
syntax on               " syntax highlighting on

if has ("gui_running")  " only set if running as gvim
    set background=dark     " light on dark
    colorscheme solarized   " camo, torte
    set guioptions-=m       " no menu
    set guioptions-=T       " no taskbar
    set guioptions-=r       " no right scrollbar
    set guioptions-=L       " no left scrollbar on vert split
    set visualbell t_vb=    " hush up
                            " fonts for (cyg)win, linux
    set guifont=Inconsolata,Consolas
else                        " otherwise set these (console vim)
    set background=dark
    colorscheme solarized
    set noerrorbells visualbell t_vb=
endif

set ofu=syntaxcomplete#Complete
                        " make backspace work how I like
set backspace=indent,eol,start
set expandtab           " spaces, not real tabs
set incsearch           " enable incremental search
set laststatus=2        " always show status bar
set number              " activate absolute line numbers
set relativenumber      " use line numbers relative to current position
set numberwidth=5       " 5 columns for line numbers
set ruler               " show cursor position, lower-left
set scrolloff=3         " begin scrolling 3 lines from window's edge
set showcmd             " show the command being entered
set noshowmode          " do not show current mode (--INSERT--, etc.)
set sidescrolloff=3     " begin scrolling 3 columns from window's edge
set nostartofline       " don't start me out at column 0
                        " format status bar with file info
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%c]%=[%p%%][%O]
set tabstop=4           " default tabs at 4 columns
set shiftwidth=4        " default shift 4 columns at a time
set nowrap              " don't wrap lines
                        " set crypto algorithm used for :X
set cryptmethod=blowfish
                        " shut off sidechannels for encrypted buffers
autocmd BufReadPost * if &key != "" | set nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif 

                        " config TAB completion in command mode
                        " remove ':list' if scroll-up is problematic
set wildmode=longest:list

                        " change line nos. from yellow to grey
highlight LineNr ctermfg=DarkGrey

"~~~~~~~~~~~~
" KEYMAPPING
"~~~~~~~~~~~~
                        " reformat current (inner) paragraph with Q
noremap Q gqip
                        " F2 inserts current date/time in normal and insert modes
                        " *** Conflict with VimTdb ***
" :map! <F2> <C-R>=strftime("%c")<CR><Esc>
                        
                        " automatic switching of relative line numbers
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
if has ("gui_running")  " only run if running as gvim
    autocmd FocusLost * :set norelativenumber
    autocmd FocusGained * :set relativenumber
endif
                        " ts (timestamp) to insert current date/time in normal and insert modes
:noremap ts a<C-R>=strftime("%c")<CR><Esc>
                        " tn to open new tab (w/optional filename entry)
:noremap tn :tabnew 
                        " to to close all tabs other than the current
" :noremap to :tabo
                        " open task list ('To Do')
" :noremap td :TaskList<CR>
                        " turn on project view (Taglist Toggle)
:noremap tt :TlistToggle<CR>
                        " update project view (Taglist Update)
:noremap tu :TlistUpdate<CR>
                        " add current file to taglist
:noremap ta :TlistAddFiles 
                        " experimental alternative tab navigation
" :noremap td :tabclose<CR>
" :noremap tj :tabnext<CR>
" :noremap tk :tabprev<CR>

"~~~~~~~~~~~~~~~~~~~
" Startify options
"~~~~~~~~~~~~~~~~~~~
let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ $VIMRUNTIME .'/doc',
  \ 'bundle/.*/doc',
  \ '\.DS_Store'
  \ ]

let g:startify_custom_header =
  \ map(split(system('fortune | cowthink -f dragon'), '\n'), '"   ". v:val') + ['','']

"~~~~~~~~~~~~
" PYTHON IDE
"~~~~~~~~~~~~
autocmd FileType python set omnifunc=pythoncomplete#Complete

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Import experimental and local features
"
" If $HOME/local.vim exists on current machine, it is sourced to include
" experimental features or stuff that is only used on this machine.
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cd $HOME

if filereadable("local.vim")
    source local.vim
endif

cd %:p:h
