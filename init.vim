runtime! macros/matchit.vim
"
" -------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
" -------------------------------------------------------

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'kassio/neoterm'
Plug 'majutsushi/tagbar'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'

Plug 'airblade/vim-gitgutter'

Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'

Plug 'mbbill/undotree'

Plug 'godlygeek/tabular'

Plug 'ntpeters/vim-better-whitespace'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-cucumber'
Plug 'kchmck/vim-coffee-script'

Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'garyburd/go-explorer'

Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make fsautocomplete' }

Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

"Colors
Plug 'twerth/ir_black'
Plug 'jnurmine/Zenburn'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'jonathanfilip/vim-lucius'

" -------------------------------------------------------
call plug#end()
" -------------------------------------------------------

" -------------------------------------------------------
" Colors
" -------------------------------------------------------
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:fzf_command_prefix = 'Fzf'

" colors zenburn
set background=dark
" let g:jellybeans_use_term_italics = 1
" colors jellybeans
" colors molokai
" colors base16-atelierseaside
" colors lucius
colors base16-ocean


" let g:terminal_color_0 = '#151515'
" let g:terminal_color_1 = '#cf6a4c'
" let g:terminal_color_2 = '#99AD6A'
" let g:terminal_color_3 = '#D8AD4C'
" let g:terminal_color_4 = '#597BC5'
" let g:terminal_color_5 = '#AD37BD'
" let g:terminal_color_6 = '#71B9F8'
" let g:terminal_color_7 = '#ADADAD'
" let g:terminal_color_8 = '#3B3B3B'
" let g:terminal_color_9 = '#E7785A'
" let g:terminal_color_10 = '#BFD788'
" let g:terminal_color_11 = '#F3C35F'
" let g:terminal_color_12 = '#6A92E4'
" let g:terminal_color_13 = '#CB4EDE'
" let g:terminal_color_14 = '#83CAFF'
" let g:terminal_color_15 = '#D3D3D3'


" -------------------------------------------------------
" Leader
" -------------------------------------------------------
let mapleader=","
let maplocalleader = "\\"
nnoremap \ ,


" -------------------------------------------------------
" Options
" -------------------------------------------------------
set exrc

set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set cursorline
set expandtab
set hidden
set hlsearch
set ignorecase smartcase
set incsearch
set laststatus=2
set nojoinspaces
set number
set relativenumber
set scrolloff=3
set showcmd
set showcmd
set showmatch
" set switchbuf=useopen,split
set wildmenu
set wildmode=longest,list

set cpoptions+=Z

set undofile
set undolevels=2000
set undoreload=20000

set diffopt=filler,vertical

" -------------------------------------------------------
" Jump to last position
" -------------------------------------------------------
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" -------------------------------------------------------
" Display settings
" -------------------------------------------------------
set statusline=%<%f\ (%{&ft})\ %{fugitive#statusline()}\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set list listchars=tab:»·,trail:·

" -------------------------------------------------------
" Keys
" -------------------------------------------------------
nnoremap <leader>y "*y

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

cnoremap %% <C-R>=expand('%:h').'/'<CR>
nmap <leader>e :edit %%
nmap <leader>v :view %%

command! -nargs=* -complete=file W w <args>

nmap <F8> :TagbarToggle<CR>

" -------------------------------------------------------
" Whitespace hygene
" -------------------------------------------------------

autocmd BufWritePre * StripWhitespace


" -------------------------------------------------------
" Save on focus lost
" -------------------------------------------------------

autocmd FocusLost * :silent! wall

" -------------------------------------------------------
" FZF
" -------------------------------------------------------

nnoremap <c-p> :FzfFiles<CR>
nnoremap <leader>f :FzfFiles<CR>
nnoremap <leader>b :FzfBuffers<CR>
nnoremap <leader>g :FzfGitFiles<CR>
nnoremap <leader>a :FzfAg <C-r>=expand('<cWORD>')<CR>
nnoremap <leader>t :FzfTags <C-r>=expand('<cWORD>')<CR>

" Mapping selecting mappings
nnoremap <leader><tab> <plug>(fzf-maps-n)
xnoremap <leader><tab> <plug>(fzf-maps-x)
onoremap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
inoremap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <c-x><c-j> <plug>(fzf-complete-file-ag)
inoremap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <CR> :nohlsearch<CR><CR>

" -------------------------------------------------------
" Deoplete
" -------------------------------------------------------
let g:deoplete#enable_at_startup = 1

" -------------------------------------------------------
" Tagbar
" -------------------------------------------------------

let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'CoffeeScript',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
    \ }
let g:tagbar_type_css = {
\ 'ctagstype' : 'CSS',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }
let g:tagbar_type_go = {
    \ 'ctagstype': 'Go',
    \ 'kinds' : [
        \'p:package',
        \'f:function',
        \'v:variables',
        \'t:type',
        \'c:const'
    \]
\}
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

" -------------------------------------------------------
" Neoterm
" -------------------------------------------------------
let g:neoterm_position = 'vertical'
let g:neoterm_automap_keys = ',tt'

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSend<cr>
vnoremap <silent> <f9> :TREPLSend<cr>

" run set test lib
nnoremap <silent> <leader>rt :w<CR>:call neoterm#test#run('all')<cr>
nnoremap <silent> <leader>rf :w<CR>:call neoterm#test#run('file')<cr>
nnoremap <silent> <leader>rn :w<CR>:call neoterm#test#run('current')<cr>
nnoremap <silent> <leader>rr :w<CR>:call neoterm#test#rerun()<cr>

" Useful maps
" hide/close terminal
nnoremap <silent> <leader>th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <leader>tc :call neoterm#kill()<cr>

" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate

" Git commands
command! -nargs=+ Tg :T git <args>

" Go setup

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

" don't allow dangerous commands in .exrc
set secure
