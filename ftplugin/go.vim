set tabstop=4
set shiftwidth=4
set noexpandtab
set nolist

nnoremap <buffer> <silent> <leader>x <Plug>(go-run)
" nnoremap <buffer> <silent> <leader>b <Plug>(go-build)
nnoremap <buffer> <silent> <leader>t <Plug>(go-test)
nnoremap <buffer> <silent> <leader>c <Plug>(go-coverage)

nnoremap <buffer> <silent> <Leader>gd <Plug>(go-doc)
nnoremap <buffer> <silent> <Leader>gv <Plug>(go-doc-vertical)

nnoremap <buffer> <silent> <Leader>s <Plug>(go-implements)
nnoremap <buffer> <silent> <Leader>n <Plug>(go-rename)
