set nocompatible

filetype off

let s:home_dir_name="~"
let s:vim_dir_name=".vim"
let s:bundle_dir_name="bundle"
let s:neobundle_dir_name="neobundle.vim"

let s:vim_dir_path=s:home_dir_name . "/" . s:vim_dir_name
if glob(escape(s:vim_dir_path, ".")) == ""
    echo "\nThere is no `" . s:vim_dir_path . "` directory. Creating..."
    echo system("mkdir -p " . s:vim_dir_path)
endif

let s:bundle_dir_path=s:vim_dir_path . "/" . s:bundle_dir_name
if glob(escape(s:bundle_dir_path, ".")) == ""
    echo "There is no `" . s:bundle_dir_name . "` directory in `" . s:vim_dir_path . "` directory. Creating... " . s:bundle_dir_path
    echo system("mkdir -p " . s:bundle_dir_path)
endif

let s:neobundle_dir_path=s:bundle_dir_path . "/" . s:neobundle_dir_name
if glob(escape(s:neobundle_dir_path, ".")) == ""
    echo "Now we should install NeoBundle plugin..."
    echo system("git clone https://github.com/Shougo/neobundle.vim " . s:neobundle_dir_path)
    echo system(s:neobundle_dir_path . "/bin/neoinstall")
endif

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand(s:bundle_dir_path))


NeoBundleFetch 'Shougo/neobundle.vim'


NeoBundle 'Shougo/vimproc', " {{{
    \ {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak'
    \    },
    \ }
" }}}
"NeoBundle 'porqz/KeyboardLayoutSwitcher' " {{{
"let g:kls_defaultInputSourceIndex=0
"" }}}
NeoBundle 'scrooloose/nerdcommenter' " {{{
" }}}
NeoBundle 'JulesWang/css.vim' " {{{
" }}}
NeoBundle 'hail2u/vim-css3-syntax' " {{{
" }}}
NeoBundle 'groenewege/vim-less' " {{{
" }}}
NeoBundle 'Shougo/unite.vim' " {{{

let g:unite_enable_short_source_names=0
let g:unite_winheight=10
let g:unite_marked_icon='●'
let g:unite_candidate_icon=''
let g:unite_source_file_mru_time_format="%b %d %X  ⎸ "
let g:unite_source_buffer_time_format=''
let g:unite_source_file_mru_filename_format=':.'
let g:unite_cursor_line_highlight='CursorLine'
let g:unite_converter_file_directory_width=16
" let g:unite_abbr_highlight='Search'

call unite#custom#source('file_mru', 'ignore_pattern', '/.git/')
call unite#custom#source('file_rec', 'ignore_pattern', '/.git/')

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() " {{{
    nmap <buffer> <ESC> <Plug>(unite_exit)
    imap <buffer> <ESC> <Plug>(unite_exit)
endfunction " }}}

nnoremap <leader><leader> :<C-u>Unite -start-insert buffer file_mru file_rec<CR>
" }}}
NeoBundle 'Shougo/vimfiler.vim', { 'depends' : 'Shougo/unite.vim' } " {{{

autocmd VimEnter * VimFilerCurrentDir

let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
"let g:vimfiler_no_default_key_mappings=1
let g:vimfiler_split_rule='topright'
let g:vimfiler_quick_look_command='qlmanage -p'
let g:vimfiler_time_format='%d.%m.%Y %H:%M'
"let g:vimfiler_tree_leaf_icon='⎸'

autocmd FileType vimfiler nmap <buffer><expr> <D-r> "\<Plug>(vimfiler_redraw_screen)"
autocmd FileType vimfiler nmap <buffer><expr> h "\<Plug>(vimfiler_toggle_visible_ignore_files)"

autocmd FileType vimfiler nmap <buffer><expr> <Right> "\<Plug>(vimfiler_expand_tree)"
autocmd FileType vimfiler nmap <buffer><expr> <Left> "\<Plug>(vimfiler_expand_tree)"

autocmd FileType vimfiler nmap <buffer><expr> <M-Up> "\<Plug>(vimfiler_jump_first_child)"
autocmd FileType vimfiler nmap <buffer><expr> <M-Down> "\<Plug>(vimfiler_jump_last_child)"
"autocmd FileType vimfiler nmap <buffer><expr> <Left> "\<Plug>(vimfiler_expand_tree)"
"autocmd FileType vimfiler nmap <buffer><expr> <Left> "\<Plug>(vimfiler_expand_tree)"
"autocmd FileType vimfiler nmap <buffer><expr> <Left> "\<Plug>(vimfiler_expand_tree)"
"autocmd FileType vimfiler nmap <buffer><expr> <Left> "\<Plug>(vimfiler_expand_tree)"

autocmd FileType vimfiler nmap <buffer><expr> <Esc> "\<Plug>(vimfiler_close)"
autocmd FileType vimfiler nmap <buffer><expr> <CR> vimfiler#smart_cursor_map(
                \  "\<Plug>(vimfiler_execute)",
                \  "\<Plug>(vimfiler_edit_file)")

autocmd FileType vimfiler nmap <buffer><expr> n "\<Plug>(vimfiler_make_directory)"


"autocmd FileType vimfiler nmap <buffer><expr> <Plug>(vimfiler_double_click) <Plug>(vimfiler_split_switch)
" }}}
NeoBundle 'h1mesuke/unite-outline', { 'depends' : 'Shougo/unite.vim' } " {{{
" }}}
NeoBundle 'altercation/vim-colors-solarized' " {{{
syntax enable
set background=light
colorscheme solarized
let g:solarized_termcolors=256
" }}}
NeoBundle 'scrooloose/syntastic' " {{{

let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_loc_list_height=8

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_conf='/Users/porqz/.jshintrc'

let g:syntastic_mode_map={
 \ 'mode': 'active',
 \ 'active_filetypes': ['ruby', 'javascript', 'css', 'scss', 'smarty', 'html', 'less', 'viml'],
 \ 'passive_filetypes': ['haml', 'php'] }

let g:syntastic_filetype_map = { 'handlebars.html': 'handlebars' }
" }}}
NeoBundle 'marijnh/tern_for_vim', {'build': {'mac': 'npm install'}}  " {{{
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
" }}}
NeoBundle 'Shougo/context_filetype.vim' " {{{
" }}}
NeoBundle 'Raimondi/delimitMate' " {{{
let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMateBackspace=1
let delimitMate_smart_quotes=1
let delimitMate_balance_matchpairs=1
let delimitMate_excluded_regions='Comment'
" }}}
NeoBundle 'tpope/vim-surround' " {{{
" }}}
NeoBundle 'Shougo/neocomplete.vim' " {{{

call neobundle#config('neocomplete.vim', {
      \ 'autoload' : {
      \   'commands' : 'NeoCompleteBufferMakeCache',
      \ }})

let g:neocomplete#enable_fuzzy_completion=0
let g:neocomplete#enable_smart_case=1
let g:neocomplete#enable_auto_select=1
let g:neocomplete#enable_at_startup=1

let g:neocomplete#sources#syntax#min_keyword_length=1
let g:neocomplete#min_keyword_length=1
let g:neocomplete#auto_completion_start_length=1

imap <expr> <CR> pumvisible() ? neocomplete#close_popup() : '<Plug>delimitMateCR'
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


set ofu=syntaxcomplete#Complete
" Enable omni completion.
autocmd FileType css,scss,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,haml,handlebars setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.javascript='[^. \t]\.\w*'

call neocomplete#custom#source('neosnippet',
    \ 'disabled_filetypes', {'_': 1})
call neocomplete#custom#source('syntax',
    \ 'disabled_filetypes', {'css': 1, 'less': 1})

set completeopt=menu
set infercase
" Pmenu		normal item
" PmenuSel	selected item
" PmenuSbar	scrollbar
" PmenuThumb	thumb of the scrollbar
" }}}
NeoBundle 'Shougo/neosnippet.vim' " {{{
let g:neosnippet#snippets_directory='~/.vim/snippets'
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"
" }}}
NeoBundle 'hrsh7th/vim-neco-calc' " {{{
" }}}
NeoBundle 'pangloss/vim-javascript' " {{{
" }}}
NeoBundle 'ahayman/vim-nodejs-complete' " {{{
let g:nodejs_complete_config = {
    \  'max_node_compl_len': 0
\}
" }}}
NeoBundle 'guileen/vim-node-dict' " {{{
au FileType javascript set dictionary+=$HOME/.vim/bundle/vim-node-dict/dict/node.dict
" }}}
NeoBundle 'sidorares/node-vim-debugger' " {{{
" }}}
NeoBundle 'Valloric/MatchTagAlways' " {{{
let g:mta_use_matchparen_group=0
let g:mta_set_default_matchtag_color=0
highlight MatchTag guifg=#E12E34 guibg=#eee8d6
" }}}
NeoBundle 'lilydjwg/colorizer' " {{{

let g:colorizer_nomap=1
au BufRead,BufNewFile * :if !exists('colorizer_is_enabled')
    \ | let colorizer_is_enabled=1
    \ | ColorHighlight
    \ | endif
" }}}
NeoBundle 'othree/html5.vim' " {{{
let g:html_indent_inctags='html,body,head,tbody'
let g:html_indent_script1='inc'
let g:html_indent_style1='inc'
" }}}
NeoBundle 'vim-scripts/applescript.vim' " {{{
" }}}
NeoBundle 'wting/rust.vim' " {{{
" }}}
NeoBundle 'vim-scripts/nginx.vim' " {{{
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,/Users/porqz/Desktop/*.inc set filetype=nginx
" }}}
NeoBundle 'porqz/zact.vim' " {{{
" }}}
"NeoBundle 'mhinz/vim-signify' " {{{
" }}}
NeoBundle 'airblade/vim-gitgutter' " {{{
" }}}
"NeoBundle 'Yggdroot/indentLine' " {{{
let g:indentLine_char='⎸'
let g:indentLine_color_gui='#eee8d6'
" }}}
NeoBundle 'gmarik/sudo-gui.vim' " {{{
" }}}


filetype indent on
filetype plugin indent on

NeoBundleClean
NeoBundleCheck


" Reload .vimrc when it edited
autocmd! bufwritepost .vimrc source %

" Opening new split panes to right feels more natural
set splitright

" Switch off errorbells
set noerrorbells
" Use visual errors instead fucking beepings
set visualbell

" Show line number
set number

" Disable wrapping
set nowrap

" Tab length is 4 spaces
set tabstop=4 
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set expandtab

" Sessions
set sessionoptions=blank,curdir,folds,winsize,resize,tabpages

set list
set listchars=tab:¨\ ,eol:¬,conceal:…,nbsp:⋯
set fillchars=stl:\ ,stlnc:\ ,vert:⎸" ,fold:⋅
hi SpecialKey ctermfg=1 guifg=#839496 guibg=NONE

" Highlight current line
set cursorline
" Remove scrollbars
set guioptions-=rL
" Remove panel in GUI
set guioptions-=T
set guifont=Monaco:h10
set noantialias
set winminheight=0
set noequalalways

" Encodings
set fileencodings=utf-8,cp1251,koi8-r,cp866
" Default encoding
set encoding=utf-8

set nowildmenu
set wildmode=full

" Enable highlighting search results
set hlsearch
set ignorecase
set smartcase
" Enable search trough writing
set incsearch
" Disable cycle search
set nowrapscan
" Search in whole the line(s)
set gdefault

" Ctrl + C to clear highlight after searching
noremap <C-c> <Esc>:nohls<CR>
inoremap <C-c> <Esc>:nohls<CR>i

" Make regex a little easier to type
set magic

hi Search term=reverse ctermfg=0 ctermbg=5 gui=reverse guifg=#c94819


" Emulate Textmate behavior (Cmd + [] for indent)
imap <D-[> <ESC><<i
imap <D-]> <ESC>>>i
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv


set nobackup
set nowritebackup
set noswapfile

set noshowmode
set showfulltag
set nomodeline

set updatetime=1500

set foldmethod=marker

" @TODO: Set the option for JS, LESS and Handlebars formats only
au BufRead,BufNewFile * :set shiftwidth=4

hi clear StatusLine
hi clear StatusLineNC
hi StatusLine guifg=#fcf6e4 guibg=#667b83
hi StatusLineNC guifg=#eee8d7 guibg=#93a1a1
hi VertSplit guifg=#93a1a1 guibg=#93a1a1
hi CursorLineNr guibg=#eee8d6
hi SignColumn guifg=#657b83 guibg=#eee8d6
hi SyntasticErrorSign guifg=#c94819 guibg=#eee8d6
hi SyntasticWarningSign guifg=#b38918 guibg=#eee8d6


" @TODO: Think about modes
map <D-S> <Esc>:W!

set noimdisable

set iminsert=0
set imsearch=0
