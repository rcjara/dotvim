colorscheme solarized
set background=dark

"additional syntax files
au BufRead,BufNewFile *.io set filetype=io
au BufRead,BufNewFile *.scss set filetype=css

:set autoindent
:set smartindent
:set autoread
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

"set a column to be thin (for file listings)
map <leader>w <C-W>1000<<C-W>30>

"open the snippets folder for editing
nmap <leader>s :tabedit ~/.vim/snippets/

"edit files from the directory of the current file
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

"use par to format paragraphs
:set formatprg=par\ 65q

"delete matching parents, brackets, etc.
nmap <leader>dm %x``x

"create a block comment in stata
nmap <leader>cc I* <Esc>A *<Esc>yyP:s/./*/g<CR>yyjp,cs

"clear search
nmap <leader>cs :let @/ = ""<CR>

"format paragraphs without moving cursor
nmap <leader>p mpgqip`p
nmap <leader>l mp0gq$`p

"coffeescript make
nmap <leader>cm :w<CR>:silent CoffeeMake<CR>
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

nmap ,rr :call ReloadSnippets(snippets_dir, &filetype)<CR>

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


