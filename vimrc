"" Colors
" Always assume a 256 color terminal
set t_Co=256

color sialoquentrj

set background=light

"replace all occurences in line
:set gdefault

"ignore case during search
:set smartcase

"pathogen
call pathogen#infect()

"additional syntax files
autocmd BufRead,BufNewFile *.io set filetype=io
autocmd BufRead,BufNewFile *.scss set filetype=css
autocmd BufRead,BufNewFile *.scss set filetype=rust

"formatting on save
let g:rustfmt_autosave = 1

:set autoindent
:set smartindent
:set autoread
:set nu
:set rnu
:set list
:set ruler
syntax on
set ts=2 sts=2 sw=2 expandtab
set winminwidth=8
set incsearch

" jj to esc
imap jj <Esc>

"always show filename
set modeline
set ls=2

:filetype plugin on

"enable matchit plugin
runtime macros/matchit.vim

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"search highlighting and smart case
:set smartcase
:set hls

"Insert spaces without entering insert mode
nmap <Space> i<Space><Esc>

"save on
nnoremap <CR> :w<CR>

"make Y so that it functions like D
nmap Y y$

"quit and save with just Z
nmap Z ZZ

"change between split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let mapleader = ","

"ocaml build
nmap <leader>mm :w<CR>:!write-cmd bld "./build.rb %"<CR>
nmap <leader>mn :w<CR>:!write-cmd bld "./build_run.rb %"<CR>
nmap <leader>mt :w<CR>:!write-cmd bld "./build.rb -run-tests %"<CR>


"insert filename
nmap <leader>fn i<C-R>=expand("%:t")<CR><Esc>

"open the vimrc file
nmap <leader>v :tabedit $MYVIMRC<CR>

"set a column to be thin (for file listings)
map <leader>w <C-W>1000<<C-W>30>

"open the snippets folder for editing
nmap <leader>s :tabedit ~/.vim/snippets/

" spelling
" enable / disable
nmap <leader>se :setlocal spell spelllang=en_us<CR>
nmap <leader>sd :setlocal spell spelllang=<CR>
" fix with most likely word
nmap <leader>sf 1z=

"edit files from the directory of the current file
nmap <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>ef :vsp <C-R><C-P><CR>
nmap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

"fzf config
let g:fzf_preview_window = 'up:50%'
nnoremap <leader>tf :Files!<CR>
nnoremap <leader>tr :Rg!<Space>

"use par to format paragraphs
:set formatprg=par\ 65q

"delete matching parens, brackets, etc.
nmap <leader>dm m`%x``x
"
"wrap in parens, quotes, brackets, curly braces
vmap <leader>w" xa""<Esc>P
vmap <leader>w( xa()<Esc>P
vmap <leader>w[ xa[]<Esc>P
vmap <leader>w{ xa{}<Esc>P
vmap <leader>w` xa`'<Esc>P

"clear search
nmap <leader>cx :let @/ = ""<CR>

"format paragraphs without moving cursor
nmap <leader>p mpgqip`p
nmap <leader>l mp0gq$`p

"coffeescript make
nmap <leader>cm :w<CR>:silent CoffeeMake<CR>

"set window width to something reasonable, but not gigantic
map <C-\> 85<C-w><Bar>

"tabs
map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
inoremap <c-w> <esc>lWi
inoremap <c-b> <esc>Bi

"reload snippets
function! ReloadSnippets( snippets_dir, ft )
    if strlen( a:ft ) == 0
        let filetype = "_"
    else
        let filetype = a:ft
    endif

    call ResetSnippets()
    call GetSnippets( a:snippets_dir, filetype )
endfunction

" Reloads
" snippets
nnoremap <leader>rr :call ReloadSnippets(snippets_dir, &filetype)<CR>:exe ":echo 'snippets reloaded'"<CR>
" vimrc
nnoremap <leader>rv :source ~/.vimrc<CR>:exe ":echo 'vimrc reloaded'"<CR>

"remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

function! PulseCursorLine()
    let current_window = winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#444444 ctermbg=239
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction

" separate out distinct configs
source ~/.vim/coc-config.vim
