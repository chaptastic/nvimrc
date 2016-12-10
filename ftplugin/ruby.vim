
setlocal tabstop=2
setlocal shiftwidth=2
setlocal shiftround
setlocal iskeyword+=?

nnoremap <buffer> <silent> <leader>re :call neoterm#test#run('failed')<cr>
autocmd! BufWritePost * Neomake
