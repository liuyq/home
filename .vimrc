set nu
set tabstop=4
set shiftwidth=4
set incsearch
set hlsearch
set autoindent
set expandtab
set smartcase

if &diff
    " diff mode
    set diffopt+=iwhite
endif

" Highlight trailing whitespace and lines longer than 80 columns.
highlight LongLine ctermbg=Darkgray guibg=Yellow
highlight WhitespaceEOL ctermbg=green guibg=Yellow
if v:version >= 702
    "Lines longer than 80 columns.
    au BufWinEnter * let w:m0=matchadd('LongLine', '\%>80v.\+', -1)

    " Whitespace at the end of a line. This little dance suppresses
    " whitespace that has just been typed.
    au BufWinEnter * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
    au InsertEnter * call matchdelete(w:m1)
    au InsertEnter * let w:m2=matchadd('WhitespaceEOL', '\s\+\%#\@<!$', -1)
    au InsertLeave * call matchdelete(w:m2)
    au InsertLeave * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
else
    au BufRead,BufNewFile * syntax match LongLine /\%>80v.\+/
    au InsertEnter * syntax match WhitespaceEOL /\s\+\%#\@<!$/
    au InsertLeave * syntax match WhitespaceEOL /\s\+$/
endif

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

" Highlight tabs.
match Character /\t/
" hi Character term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=DarkYellow
hi Character term=standout ctermfg=0 ctermbg=0 guifg=Green guibg=DarkYellow
