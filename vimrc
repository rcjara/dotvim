colorscheme solarized

"additional syntax files
au BufRead,BufNewFile *.io set filetype=io
au BufRead,BufNewFile *.scss set filetype=css

:set autoindent
:set smartindent
:set list
:set number
:set ruler
syntax on
set ts=2 sts=2 sw=2 expandtab
set winminwidth=8

:filetype plugin on

"enable matchit plugin
runtime macros/matchit.vim

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"search highlighting and ignore case
:set ic
:set hls

"Insert spaces without entering insert mode
nmap <Space> i<Space><Esc>

"insert lines or below without entering insert mode
nmap <S-Enter> o<Esc>k

"make Y so that it functions like D
nmap Y y$

"change between split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let mapleader = ","

"insert filename
nmap <leader>fn i<C-R>=expand("%:t")<CR><Esc>

"open the vimrc file
nmap <leader>v :tabedit $MYVIMRC<CR>


"open the snippets folder for editing
nmap <leader>s :tabedit ~/.vim/snippets/

"edit files from the directory of the current file
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

"use par to format paragraphs
:set formatprg=par\ 65q

"format paragraphs without moving cursor
nmap <leader>p mpgqip`p
nmap <leader>l mp0gq$`p

"automatically reloaded .vimrc
map <silent> ,V :source ~/.vimrc<CR>:exe ":echo 'vimrc reloaded'"<CR>

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

nmap ,rr :call ReloadSnippets(snippets_dir, &filetype)<CR>

"remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

