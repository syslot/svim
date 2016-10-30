"				                         _           _     _                   _
"				     ___   _   _   ___  | |   ___   | |_  ( )  ___    __   __ (_)  _ __ ___
"				    / __| | | | | / __| | |  / _ \  | __| |/  / __|   \ \ / / | | | '_ ` _ \
"				    \__ \ | |_| | \__ \ | | | (_) | | |_      \__ \    \ V /  | | | | | | | |
"				    |___/  \__, | |___/ |_|  \___/   \__|     |___/     \_/   |_| |_| |_| |_|
"				           |___/
"				
"                                                                              /**
"                                                                              * @file .vimrc
"                                                                              * @This is syslot's vimrc, enjoy it!
"                                                                              
"                                                                              * @author syslot
"                                                                              * @version 1.0
"                                                                              * @date 2016-10-30
"                                                                              */
"

" Vim Ui config {{{ 
set runtimepath+=$GOROOT/misc/vim
set rtp+=~/.fzf
set fencs=utf-8,GB18030,ucs-bom,default,latin1,ucs-bom
syntax enable
syntax on
set nocp
set backspace=2
set number
set autoindent
set cindent
set ruler
set incsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hls
set cino=g0,:0
set fdm=indent
set foldlevel=99
nnoremap <leader><space> za
set guifont=SauceCodePro\ NF:h14
set background=dark
set cul
set t_Co=256

colorscheme PaperColor
"colorscheme solarized
"colorscheme molokai 

" cursor lable
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Ctrl + Direction
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" }}}


" NeoBundle & Plug  -- The Plugin Manage Tool {{{

filetype off                   " required!
if 0 | endif
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Complete & Highlight {{{{
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'rdnetto/YCM-Generator'
NeoBundle 'robturtle/newycm_extra_conf.py'

NeoBundleLazy 'jeaye/color_coded', { 
  \ 'build': {
    \   'unix': 'cmake . -DDOWNLOAD_CLANG=0 && make && make install',
  \ },
  \ 'autoload': { 'filetypes' : ['c', 'cpp', 'objc', 'objcpp'] },
  \ 'build_commands' : ['cmake', 'make']
\}
NeoBundle 'Mizuchi/STL-Syntax'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'artur-shaik/vim-javacomplete2'
NeoBundle 'ternjs/tern_for_vim'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'mattn/emmet-vim'
" }}}}

" Nerdtree {{{{
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
" }}}}

" Layout Tools {{{{
NeoBundle 'majutsushi/tagbar'
NeoBundle 'brookhong/cscope.vim'
NeoBundle 'vim-scripts/SrcExpl'
NeoBundle 'vim-scripts/TagHighlight'
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
" }}}}

" VCS or Fold Manage {{{{
NeoBundle 'airblade/vim-rooter'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'int3/vim-extradite'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
" }}}}

" Code Snipper{{{{
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips'
" }}}}

" Async tools {{{{
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'thoughtbot/vim-rspec'
" }}}}

" Effective Tools {{{{
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-surround'
NeoBundle 'NLKNguyen/papercolor-theme'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'rstacruz/vim-fastunite'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'amitab/vim-unite-cscope'

NeoBundle 'dkprice/vim-easygrep'
NeoBundle 'chrisbra/vim-diff-enhanced'
NeoBundle 'vim-scripts/DirDiff.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'joonty/vdebug'
NeoBundle 'L9'
NeoBundle 'mhinz/vim-startify'
" }}}}
 
" golang {{{{
NeoBundle 'nsf/gocode', {'rtp': 'vim/'}
NeoBundle 'fatih/vim-go'
" }}}}

" Python {{{{
NeoBundle 'klen/python-mode'
NeoBundle 'hdima/python-syntax'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'onlytiancai/flake8'
NeoBundle 'nose-devs/nose'
" }}}}
 
" Latex {{{{
NeoBundle 'bjoernd/vim-ycm-tex'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
" }}}}

" Prolog {{{{
NeoBundle 'adimit/prolog.vim'
" }}}}

" R {{{{
NeoBundle 'jcfaria/Vim-R-plugin'
" }}}}

call neobundle#end()

call plug#begin('~/.vim/plugged')
" Effective Tools {{{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}}
 
" Icon {{{{
Plug 'ryanoasis/vim-devicons'
" }}}}
call plug#end()

filetype plugin indent on
syntax on
" }}} End Plug


" Code Complate {{{

" Omni Engine Complate 
filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python colorscheme molokai
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete

" auto set omnifunc by filetype
" if has("autocmd") && exists("+omnifunc")
" autocmd Filetype *
" \ if &omnifunc == "" |
" \ setlocal omnifunc=syntaxcomplete#Complete |
" \ endif
" endif

let OmniCpp_NamespaceSearch=2
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_ShowScopelnAbbr=1
let OmniCpp_ShowPrototypeInAbbr=1   " auto show function param
let OmniCpp_MayCompleteDot=1        " auto complete after .
let OmniCpp_MayCompleteArrow=1      " auto complete after ->
let OmniCpp_MayCompleteDot=1        " auto complete after .
let OmniCpp_MayCompleteScope=1      " auto complete after ::
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]

" Auto Close the completion window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

" YouCompleteMe auto complete configuration 
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" typing "Enter" will selected the focus item
" Key Up/Down would show more information
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 
let g:ycm_collect_identifiers_from_tags_files=1 
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_invoke_completion = '<D-y>'
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'

"auto complete in comment
let g:ycm_complete_in_comments = 1
"auto complete in string
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&','::']

"YCM Complete menu Colorscheme
highlight Pmenu guibg=darkgrey guifg=black
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=SeaGreen guibg=lightgrey " Select

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \}

nnoremap <leader>lo :lopen<CR>   "open locationlist
nnoremap <leader>lc :lclose<CR>  "close locationlist
inoremap <leader><leader> <C-x><C-o>
nnoremap <Leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <D-j> :YcmCompleter GoToDeclaration<CR> 

" }}}


" Syncta Check {{{

" for cpp
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
" set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
" whether to show balloons
let g:syntastic_enable_balloons = 1

" for golang 
let g:syntastic_go_checkers = ['golint', 'vet', 'errcheck', 'gometalinter']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_go_gometalinter_args=['--fast']
let g:go_list_type = "quickfix"

" }}}


" WebDevIcon Conf {{{
 
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign=1

" }}}


" NerdTree Conf {{{

let NERDTreeMinimalUI=1
au bufenter * if(winnr("$") ==1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") |q|endif
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" NERDCommenter
" ColorFul NERDTree
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeDirArrows=0

" By icon-syntax-highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" For macvim
"if has('gui')
autocmd FileType nerdtree setlocal nolist
set ambiwidth=double
"endif

nmap <F1>   :NERDTreeToggle     <CR>
 
" }}}


" TagBar {{{
 
" Enable Tagbar For Golang
 let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'	 : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : '/Users/ningyu/Source/code/go/bin/gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

nmap <F2> :TagbarToggle<CR>

" }}}


" Airline {{{
 
let g:airline_theme="gruvbox"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline_symbols = {}

let g:Powerline_symbols='unicode'
set encoding=utf8

" These lines setup the environment to show graphics and colors correctly.
set t_Co=256
set laststatus=2 " Always display the statusline in all windows
set showtabline=1
let g:Powerline_colorscheme='solarized256'
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
 
" }}}


" Source Explore & minibuf{{{

let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 300
" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"
" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_searchLocalDef = 1
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

let g:minBufExplForceSyntaxEnable = 1 
if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif

autocmd FileType c,cpp,cmake nmap <Leader>src :SrcExplToggle<CR>

" }}}


" Snipper {{{

let delimitMate_expand_cr      = 1
let delimitMate_jump_expansion = 1

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#disable_runtime_snippets = { "_": 1, }

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" neosippet key mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" }}}


" DoxygenToolkit {{{

let g:DoxygenToolkit_briefTag_pre="@brief \n" 
let g:DoxygenToolkit_paramTag_pre="@param \n" 
let g:DoxygenToolkit_returnTag="@returns " 
let g:DoxygenToolkit_authorName="syslot"
let g:DoxygenToolkit_versionTag="@version 1.0"
let g:DoxygenToolkit_licenseTag="GPL 2.0"

let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

nmap <C-A>A :DoxAuthor
nmap <C-A>F :Dox
nmap <C-A>D :DoxBlock
nmap <C-A>C 0/** */<Left><Left>

" }}}


" Vim-go Conf {{{

let g:go_doc_keywordprg_enabled=0
let g:go_def_mode="godef"
let g:godef_split=1
let g:godef_same_file_in_same_window=1
let g:go_fmt_command="goimports"
let g:go_metalinter_command = "gometalinter"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_fields  = 1
let g:go_highlight_types   = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
"autocmd BufWritePre *.go :Fmt

" }}}


" Cpp Highlight Advanced {{{

" color_coded
let g:colorjcoded_enabled=1
let g:color_coded_filetypes = ['c', 'cpp', 'objc']
" Disable color_coded in diff mode
if &diff
      let g:color_coded_enabled = 0
endif
if has('nvim')
      let g:color_coded_enabled = 0
endif

" }}}


" Cscope & vim-rooter{{{

" change time workspace by folder
" let g:rooter_disable_map = 1
let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1

" For Cscope
function LoadCscope()
    if filereadable("cscope.out")
        cs add 'cscope.out'
    endif
endfunction

" Load Cscope after vim config init already
autocmd VimEnter call LoadCscope()

" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

" }}}
 

" Markdown {{{

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

au FileType markdown nmap <F3> :InstantMarkdownPreview<CR>
nnoremap <Leader>ud :GundoToggle<CR>

" }}}

" Latex {{{

let g:LatexBox_split_type = "new"
let g:ycm_semantic_triggers = {
\  'tex'  : ['\ref{','\cite{'],
\ }

" }}}


" Python syntax highlight & functional fold {{{

let python_highlight_all = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
 
let g:SimpylFold_docstring_preview = 0
let b:did_indent=1

" }}} 


" For conque_gdb {{{

let g:ConqueGdb_SrcSplit = 'left'

" }}}
 

" Unit.vim {{{
 
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context', {
              \ 'start_insert': 1
              \ })
call unite#custom#source('file_rec/async','sorters','sorter_rank', )
" replacing unite with ctrl-p
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
if executable('ag')
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--smart-case --line-numbers --nogroup -S -C4'
let g:unite_source_grep_recursive_opt=''
nnoremap <silent> <Leader>ag :Unite -silent -auto-resize
        \ -buffer-name=ag grep<CR>
endif

let g:ackprg = 'ag --nogroup  --column'
nnoremap <silent> <c-p> :Unite -auto-resize file file_mru file_rec<cr>

" }}}


" fzf {{{
 
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.fzf-history'

" [Files] Extra options for fzf
"         e.g. File preview using CodeRay (http://coderay.rubychan.de/)
let g:fzf_files_options =
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})

" }}}


" MtaJumpToOtherTag {{{

nnoremap <leader>% :MtaJumpToOtherTag<cr>

" }}}


" Dispather {{{
 
autocmd FileType java let b:Dispather = 'javac %'
autocmd FileType go let b:Dispather = 'go build %'

let g:rspec_command = "Dispatch rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

" }}}
