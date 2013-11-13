"
" My vimrc file
" 

" GENERAL SETTINGS
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
    colorscheme torte
    set noerrorbells visualbell t_vb=
endif

set ofu=syntaxcomplete#Complete
                        " make backspace work how I like
set backspace=indent,eol,start
set nocompatible        " noncompatible with vi
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

                        " config TAB completion in command mode
                        " remove ':list' if scroll-up is problematic
set wildmode=longest:list

                        " change line nos. from yellow to grey
highlight LineNr ctermfg=DarkGrey

" KEYMAPPING
                        " F2 inserts current date/time in normal and insert modes
                        " *** Conflict with VimTdb ***
" :map! <F2> <C-R>=strftime("%c")<CR><Esc>
                        
                        " remap escape in normal mode
:inoremap jk <esc>
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
                        " add current file to taglist
:map ta :TlistAddFiles 
                        " experimental alternative tab navigation
" :map td :tabclose<CR>
" :map tj :tabnext<CR>
" :map tk :tabprev<CR>

" PYTHON IDE
autocmd FileType python set omnifunc=pythoncomplete#Complete
