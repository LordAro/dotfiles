
set wildmenu
set hlsearch
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
autocmd Filetype python,php,javascript setlocal expandtab
autocmd Filetype javascript setlocal tabstop=2
autocmd Filetype javascript setlocal shiftwidth=2
set autoindent
syntax on

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,javascript,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
