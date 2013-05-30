" Preferred color scheme.
colorscheme twilight

" Allow for mouse input even in a console context.
set mouse=a

" Toggle file type detection off then on to properly pick up pathogen dynamic
" bundles.
filetype off
filetype plugin indent on

" Enable syntax coloring.
syntax enable

" Enable smart indenting
set smartindent

" Expand tabs to spaces automatically
set expandtab

" Automatically reread changed files (no prompt)
set autoread

" Enable spell checking always, despite being sometimes annoying when not
" applicable.
set spell spelllang=en_us

" Allow for a 1 character wide column to show a fold character or other marks.
set foldcolumn=1

" Try to show 5 lines of context around the cursor when scrolling.
set scrolloff=5

" Do not wrap long lines to fit the margin.
set nowrap

" Do not adjust split windows to have equal size automatically.
set noequalalways

" Allow backspace to delete indention, end-of-lines, and to go past the start
" of insert.
set backspace=indent,eol,start

" Move the cursor to the matching bracket briefly
set showmatch

" If upper case characters are used in the search pattern, turn on
" case-sensitive search.
set smartcase

" Enable incremental searching.
set incsearch

" Maintain a highlight for all matches for the last search.
set hlsearch

set wildmenu
set wildmode=longest:full
"set wildmode=list:full
set wildignore+=*.pyc

" ---------------------------------------------------------------------------
"  Indenting
" ---------------------------------------------------------------------------

set shiftwidth=2
set tabstop=2
"set tabstop=8 -- Not sure why I had this as eight.

" (...) except for Java, where four spaces is preferred.
autocmd FileType java
  \ setlocal shiftwidth=4 |
  \ setlocal tabstop=4

" Set C program indenting options
set cinoptions=l1,g0.5s,h0.5s,i2s,+2s,(0,W2s

" ---------------------------------------------------------------------------
"  Marking things for attention
" ---------------------------------------------------------------------------

" Enable whitespace display
if (&termencoding == "utf-8") || has("gui_running")
  set list listchars=tab:¬·,trail:·,extends:»,precedes:«
else
  set list listchars=tab:*\ ,trail:*,extends:+,precedes:+,nbsp:_
endif

" Define a color for things needing attention.
highlight Attention ctermfg=darkgrey guifg=#552222

" Mark trailing whitespace.
autocmd BufWinEnter *
      \ call matchadd('Attention', '\s\+$', -1) |

" Mark lines too long.
autocmd BufWinEnter *
      \ call matchadd('Attention', '\%>80v.\+', -1)

" Mark English contraction use, such as in <don't> and <let's>
autocmd BufWinEnter *
      \ call matchadd('Attention', "\\w\\+\\(n't\\|'s\\)", -1)

" Mark periods not followed by two spaces.
autocmd FileType markdown
      \ call matchadd('Attention', "\\w\\+\\.\\s\\w\\+", -1)

" ---------------------------------------------------------------------------
"  GVIM
" ---------------------------------------------------------------------------

" Set the GUI font
set guifont=Envy\ Code\ R\ 10

" No toolbar (T)
set guioptions=aegimrLt

" ---------------------------------------------------------------------------
"  NetRW (File windows) configuration
" ---------------------------------------------------------------------------

" Set the default oredering by extension.
" Certain sets of source files first ...
let g:netrw_sort_sequence="[\/]$,\.h$,\.c$,\.cpp$,\.cxx$,\.cc$,\.py$,"
" ... Followed by most everything else ...
let g:netrw_sort_sequence+="*,"
" ... Except intermediates/temporaries, which should go last.
let g:netrw_sort_sequence+="\.o$,\.obj$,\.pyc$,\.info$,\.swp$,\.bak$,\~$"

" ---------------------------------------------------------------------------
"  Syntastic
" ---------------------------------------------------------------------------
" Syntastic will automatically show/hide the location list.
let g:syntastic_auto_loc_list=1
" By default this is the height of the location list window.
let g:syntastic_loc_list_height=5

" ---------------------------------------------------------------------------
"  Vim history and state settings
" ---------------------------------------------------------------------------

" Keep a good amount of command history
set history=200

" Set viminfo to:
"   + Save 100 marks (')
"   + Save 100 searches (/)
"   + Save 100 commands (:0)
"   + Save 50 lines for each register (<)
"   + Do not highlight the last search on load (h)
"   + Save global variables beginning with uppercase (!)
set viminfo='100,/100,:100,<50,s10,!

" Set what is saved in the session files
set sessionoptions=buffers,curdir,resize,tabpages,winsize

" Keep swap files away from the source code!
set directory=~/.vim/swap,/tmp
