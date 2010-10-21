:colorscheme rjanotherdark

:set autoindent
:set smartindent
:set list
:set number
syntax on
set ts=2 sts=2 sw=2 expandtab
set winminwidth=8

:filetype plugin on

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"search highlighting and ignore case
:set ic
:set hls

"Insert spaces without entering insert mode
nmap <Space> i<Space><Esc>

"insert lines above (or below) without entering insert mode
map <S-Enter> O<Esc>j
map <CR> o<Esc>k

"change between split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"edit files from the directory of the current file
map ,ew :e <C-R>=expand("%:p:h") . "/" <CR>
map ,es :sp <C-R>=expand("%:p:h") . "/" <CR>
map ,ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map ,et :tabe <C-R>=expand("%:p:h") . "/" <CR>

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

