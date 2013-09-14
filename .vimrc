" Switch off errorbells
set noerrorbells
" Use visual errors instead fucking beepings
set visualbell

" KeyboardLayotSwitcher settings
let g:kls_defaultInputSourceIndex=1

" Pathogen initialization
execute pathogen#infect()
execute pathogen#helptags()

set ruler "Show cursor all the time
set number "Show line number

set nowrap "Disable wrapping

syntax on "Enable syntax highlighting
" Make terminal looks better
let g:solarized_termcolors=256
colorscheme solarized "Color scheme

" Tabs
set smarttab "Enable smart tabs
set smartindent
set tabstop=4 "Tab == 4 spaces
set shiftwidth=4
set expandtab

" Indent
set autoindent "Enable autoindent

" delimitMate settings (pairs symbols)
let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMateBackspace=1

"set completeopt=menu,preview
set infercase

" Search
set hlsearch "Enable highlighting search results
set incsearch "Enable search trough writing
set nowrapscan "Disable cycle search
set ignorecase "Ignore case when searching
set gdefault

" Ctrl + C to clear highlight after searching
nmap <C-c> <Esc>:nohls<CR>
imap <C-c> <Esc>:nohls<CR>i

" Swap and backup files
set noswapfile "Disable swap

" Encodings
set fileencodings=utf-8,cp1251,koi8-r,cp866 "File encodings
set encoding=utf-8 "Default encoding



" GUI
set guioptions-=rL " Remove scrollbars
set guioptions-=T " Remove panel in GUI
set noantialias
set guifont=Monaco:h10
set scrolljump=1 " lines to scroll when cursor leaves screen
set scrolloff=3 " minimum lines to keep above and below cursor

" Mouse
set mouse=a
set mousemodel=popup

" Window
set noequalalways
set winminheight=0
set winheight=9999
set helpheight=9999

" Cursor
set cursorline "Highlight current line


filetype off
filetype indent on
filetype plugin indent on


" Disable AutoComplPop
let g:acp_enableAtStartup=0
" Use neocomplcache
let g:neocomplcache_enable_at_startup=1
" Use smartcase
let g:neocomplcache_enable_smart_case=1
" Use camel case completion
let g:neocomplcache_enable_camel_case_completion=1
" AutoComplPop like behavior
let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_enable_auto_delimiter=1
let g:neocomplcache_ctags_program='/usr/local/bin/ctags'

" Enable omni completion
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,haml setlocal omnifunc=htmlcomplete#CompleteTags
"
autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
let g:jscomplete_use = ['dom', 'moz', 'es6th']

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

set ofu=syntaxcomplete#Complete

" Enable heavy omni completion
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns={}
endif

let g:neocomplcache_omni_patterns.ruby="[^. *\t]\.\w*\|\h\w*::"
let g:neocomplcache_omni_patterns.php="[^. \t]->\h\w*\|\h\w*::"
let g:neocomplcache_omni_patterns.c="\%(\.\|->\)\h\w*"

let g:neocomplcache_source_rank = {
\ 'snippets_complete' : 0,
\ 'abbrev_complete' : 8,
\ 'buffer_complete' : 8,
\ }

set nowildmenu

iabbrev </ </<C-X><C-O>
autocmd * TabEnter <Esc>

" Emulate Textmate behavior (Cmd + [] for indent)
imap <D-[> <ESC><<i
imap <D-]> <ESC>>>i
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

nmap <D-c> <ESC>
imap <D-c> <ESC>a

cnoreabbrev <expr> w!!
                \((getcmdtype() == ':' && getcmdline() == 'w!!')
                \?('!sudo tee % >/dev/null'):('w!!'))

" Keybindings
inoremap <C-D-s> <Esc>:w!!<CR>
nnoremap <C-D-s> <Esc>:w!!<CR>
cnoremap <C-D-s> <Esc>:w!!<CR>

set list
set listchars=tab:¨\ ,eol:¬,conceal:…

set fillchars=stl:\ ,stlnc:\ ,vert:\ 

au BufRead,BufNewFile *.applescript,*.scpt set filetype=applescript
au BufRead,BufNewFile *.tpl set filetype=html

" Show QuickLook when opens graphics file
au BufReadCmd *.png,*.jpg,*.gif,*.jpeg call system('qlmanage -p "' . expand('%:p') . '" &')
au BufReadCmd *.png,*.jpg,*.gif,*.jpeg let s:qlmanage_filename=expand('%:t')
au BufReadCmd *.png,*.jpg,*.gif,*.jpeg :silent execute ":bdelete! %"
au BufReadCmd *.png,*.jpg,*.gif,*.jpeg :silent execute ":b"
au BufReadCmd *.png,*.jpg,*.gif,*.jpeg echo "File \"" . s:qlmanage_filename . "\" is opened with QuickLook"

let $PATH=$PATH . ":/usr/local/bin"

au filetype applescript nnoremap <D-r> :echo "\n" . system('osascript -se "' . expand('%:p') . '"')<CR>
au filetype applescript inoremap <D-r> <Esc><Esc><D-r>

au filetype javascript nnoremap <D-r> :echo "\n" . system('v8 --use_strict "' . expand('%:p') . '"')<CR>
au filetype javascript inoremap <D-r> <Esc><D-r>

au filetype javascript nnoremap <D-R> :echo "\n" . system('jsl -process "' . expand('%:p') . '"')<CR>
au filetype javascript inoremap <D-R> <Esc><D-R>

if !has("gui_macvim")
 map <D-D> :NERDTree
end

" Sessions
set sessionoptions=blank,curdir,folds,winsize,resize,tabpages


" Syntastic settings
"let g:syntastic_quiet_warnings=1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height=8

let g:syntastic_error_symbol='●'
let g:syntastic_warning_symbol='●'
" syntastic_style_error_symbol - For style errors, defaults to 'S>'
" syntastic_style_warning_symbol - For style warnings, defaults to 'S>'

let g:syntastic_mode_map = {
 \ "mode": "active",
 \ "active_filetypes": ["ruby", "javascript", "css", "scss", "smarty", "html"],
 \ "passive_filetypes": ["haml", "php"] }

highlight SignColumn guibg=#EEE8D7
highlight error guifg=#E12E34 guibg=#EEE8D7
highlight todo guifg=#B7882C guibg=#EEE8D7

" It is for zoomed window on startup
if has("gui_macvim")
	set lines=200
	set columns=500
endif

let g:html_indent_inctags="html,body,head,tbody"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

"
" Tagbar settings
nmap <D-P> :TagbarToggle<CR>
imap <D-P> <Esc>:TagbarToggle<CR>
nnoremap <h> :TagbarShowTag<CR>
nnoremap <j> :TagbarShowTag<CR>

" Fuck the F1!
nnoremap <F1> <Esc>

let g:tagbar_ctags_bin="/usr/local/bin/ctags"
let g:tagbar_left=0
let g:tagbar_width=35
let g:tagbar_iconchars=['‣', '▾']
let g:tagbar_autofocus=1

highlight TagbarFoldIcon guifg=#168DCC guibg=#168dcc
highlight TagbarHighlight guifg=#E62A38 guibg=#EEE8D7
highlight TagbarKind guifg=#168dcc gui=bold

let g:tagbar_type_ruby={
	\ 'kinds' : [
			\ 'm:modules',
			\ 'c:classes',
			\ 'd:describes',
			\ 'C:contexts',
			\ 'f:methods',
			\ 'F:singleton methods'
	\ ]
\ }

au BufRead,BufNewFile *.scss set filetype=scss

" JSLint configuration file
let g:syntastic_javascript_jsl_conf=expand("~/.jsl.conf")

" MatchTagAlways settings
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'tpl' : 1,
    \}

let g:mta_use_matchparen_group=0
let g:mta_set_default_matchtag_color=0
highlight MatchTag guifg=#E12E34 guibg=#E7DFC7

"autocmd BufWritePre * :%s/\s\+$/\ /e " Automatically kill trailing whitespace


" Statusbar
set showcmd " Show unfinished commands
set laststatus=2 " Always show a status line

function! GetFileSize()
	let path = expand("%:p")
	let bytes = getfsize(path)

	if bytes <= 0
		return ''
	endif

	if bytes < 1024
		return bytes . ' B'
	else
		return (bytes / 1024) . ' kB'
	endif
endfunction

function! GetShortFileNameSection()
	let filename = fnamemodify(expand("%"), ":t:r")

	if !empty(filename)
		return filename
	else
		return "Untitled"
	endif
endfunction

function! GetFileRelativePathSection()
	let expandedFilename = expand("%")
	let filename = fnamemodify(expandedFilename, ":.")
	let relativeToCurrentDirectoryPath = fnamemodify(expandedFilename, ":.:h")
	let relativeToHomeDirectoryPath = fnamemodify(expandedFilename, ":~:h")

	if strlen(relativeToCurrentDirectoryPath) < strlen(relativeToHomeDirectoryPath)
		let path = relativeToCurrentDirectoryPath
	else
		let path = relativeToHomeDirectoryPath
	endif

	if empty(filename)
		let path = fnamemodify(relativeToCurrentDirectoryPath, ":~")
	endif

	if !empty(path) && path != "."
		return simplify(path . "/")
	else
		return "./"
	endif
endfunction

function! GetBeforeFileNameSeparator()
	return " "
endfunction

function! GetFileNameSection()
	let filename = fnamemodify(expand("%"), ":t")

	if !empty(filename)
		return filename
	else
		return "Untitled"
	endif
endfunction

function! GetModifiedFlagSection()
	if !&modifiable
		return "⊘"
	elseif &modified
		return "●"
	else
		return ""
	endif
endfunction

function! GetFiletypeSection()
	return &filetype
endfunction

function! GetFileformatSection()
	return &fileformat
endfunction

function! GetEncodingSection()
	return &encoding
endfunction

function! GetFileSizeSection()
	if !empty(GetFileSize())
		return "ஃ " . GetFileSize()
	else
		return ""
	endif
endfunction

function! GetLinesCountSection()
	return "≡ " . line(".") . "/" . line("$")
endfunction

function! GetBranchSection()
	let branch = fugitive#head()

	if !empty(branch)
		return "᚜ ". branch
	else
		return ""
	endif
endfunction


highlight StatusLineBranch guifg=#cf4825 guibg=#e8e3d7

highlight StatusLineFilename guifg=White guibg=#0095aa
highlight StatusLineFilenameInactive guifg=White guibg=#5db2c5

highlight StatusLineHelpFilename guifg=#000 guibg=#e9d77e
highlight StatusLineHelpFilenameInactive guifg=#000 guibg=#f4e8a7


function! BuildStatusLine(is_active)
	setlocal statusline= " Reset (do not remove!)

	if &buftype == ""
		setlocal statusline+=%-3.45(\ %{GetFileRelativePathSection()}\%)

		if a:is_active == 1
			setlocal statusline+=%#StatusLineFilename#%(\ %{GetFileNameSection()}\ %)%*
		else
			setlocal statusline+=%#StatusLineFilenameInactive#%(\ %{GetFileNameSection()}\ %)%*
		endif

		setlocal statusline+=%(\ %{GetModifiedFlagSection()}\ %)
		setlocal statusline+=%(\ %{GetFiletypeSection()}\ %)

		setlocal statusline+=%=
		setlocal statusline+=%(\ %{GetFileformatSection()}\ %)
		setlocal statusline+=%(\ %{GetEncodingSection()}\ %)

		setlocal statusline+=
		setlocal statusline+=%(\ %{GetFileSizeSection()}\ %)

		setlocal statusline+=%(\ %{GetLinesCountSection()}\ %)
		setlocal statusline+=%#StatusLineBranch#%(\ %{GetBranchSection()}\ %)%*

	elseif &buftype == "help"
		if a:is_active == 1
			setlocal statusline+=%#StatusLineHelpFilename#%(\ %{GetShortFileNameSection()}\ %)%*
		else
			setlocal statusline+=%#StatusLineHelpFilenameInactive#%(\ %{GetShortFileNameSection()}\ %)%*
		endif

		setlocal statusline+=%(\ %{GetFiletypeSection()}\ %)

		setlocal statusline+=%=
		setlocal statusline+=%(\ %{GetLinesCountSection()}\ %)
	endif
	
endfunction

au VimEnter,BufRead,BufNewFile * :call BuildStatusLine(1)
au WinLeave * :call BuildStatusLine(0)
au WinEnter * :call BuildStatusLine(1)
"au WinEnter * :call BuildStatusLine(1)

" Colorizer settings
let g:colorizer_nomap = 1
au BufRead,BufNewFile * :if !exists("colorizer_is_enabled") | let colorizer_is_enabled=1 | ColorHighlight | endif

" Gundo settings
nnoremap <D-U> :GundoToggle<CR>
let g:gundo_width = 35
let g:gundo_help = 0

let g:gundo_preview_height = 40

let g:gundo_preview_statusline = "Diffs preview"
let g:gundo_tree_statusline = "Changes tree"

" Copies path
function! CopyToClipboard(textToCopy)
	:call system("echo '" . a:textToCopy . "' \| tr -d '\n' \| pbcopy")
	:echo a:textToCopy
endfunction

" CP is command for copy and show file path
command CP :call CopyToClipboard(expand("%"))
command CRP :call CopyToClipboard(fnamemodify(expand("%"), ":."))
command CCP :call CopyToClipboard(getcwd())

" Remap Print menu item from File menu
if has("gui_macvim")
	amenu <silent> File.Print key=<nop>
endif


" ToDo: Disable scrolling for gesture time
" Trackpad gestures
nmap <D-M-Up> <C-W>k
nmap <D-M-Right> <C-W>l
nmap <D-M-Down> <C-W>j
nmap <D-M-Left> <C-W>h

hi Pmenu guifg=#647b82 guibg=#f5f0e2
hi PmenuSel guifg=#92a1a1 guibg=#eee8d7


" wrapmargin
" numberwidth
" ModeMsg
" MoreMsg
" StatusLine
" StatusLineNC
" CursorColumn

let utl_opt_highlight_urls='yes'

function! RevealFileInFinder()
	let g:utl_cfg_hdl_mt_text_directory__cmd = ":silent !open -R '%p'"
	let g:utl_cfg_hdl_mt_text_directory=g:utl_cfg_hdl_mt_text_directory__cmd

	:Utl
endfunction

function! Open()
	execute "normal BvEy"

	if matchstr(@0, '[a-z]*:\/\/[^ >,;]*') != ""
		if matchstr(@0, '#.*') != ""
			let g:utl_cfg_hdl_scm_http_system = ":silent !open '%u#%f'"
		else
			let g:utl_cfg_hdl_scm_http_system = ":silent !open '%u'"
		endif

		let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http_system
	else
		let g:utl_cfg_hdl_mt_text_directory__cmd = ":silent !open '%p'"
		let g:utl_cfg_hdl_mt_text_directory=g:utl_cfg_hdl_mt_text_directory__cmd
	endif

	:Utl
endfunction

noremap <D-O> :call Open()<CR>
noremap <D-F> :call RevealFileInFinder()<CR>
