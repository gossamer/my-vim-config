" ---------------------------------------------------------------------------
" Customize the status line
" ---------------------------------------------------------------------------

" Always show a status line in the last line.
set laststatus=2

" Set what is displayed in the status line....
set statusline=
" Switch to the warning message colors.
set statusline+=%#warningmsg#
" Display any messages from Syntastic.
set statusline+=%{SyntasticStatuslineFlag()}
" Revert back to the status line default colors.
set statusline+=%#StatusLine#
" Path to the current file
set statusline+=%f
" Show the help buffer flag
set statusline+=%h
" Show the filetype flag
"set statusline+=%y
" Show the read-only flag
set statusline+=%r
" Show the modified flag
set statusline+=%m

" Show padding to right justify everything that follows.
set statusline+=%=
" Show the line and column number.
set statusline+=%l,%c
