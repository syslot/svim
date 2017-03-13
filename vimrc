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
set rtp+=~/.vim/plugged/papercolor-theme
set rtp+=~/.vim/plugin
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
set guifont=FantasqueSansMonoNerdFontComplete---Regular:h15
set background=dark
"set background=light
set cul
set t_Co=256


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


let MultiFunc=1

if MultiFunc==1
    "colorscheme PaperColor
    colorscheme onedark
else
"colorscheme solarized
    colorscheme molokai 
endif

" cursor lable
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" space fold text
 nnoremap <space> @=((foldclosed(line(''.'')) < 0) ? 'zc' : 'zo')<CR>

" Ctrl + Direction
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" }}}


" Plug & Plug  -- The Plugin Manage Tool {{{
call plug#begin('~/.vim/plugged')
" Complete & Highlight {{{{
Plug 'Valloric/YouCompleteMe',{'for':['c','cpp','go','python','java','js','tex','rust','ruby','vim']}
Plug 'rdnetto/YCM-Generator', {'branch': 'stable','for':['c','cpp','go','python','java','js','tex','rust','ruby','vim']}
Plug 'robturtle/newycm_extra_conf.py'
Plug 'Mizuchi/STL-Syntax',{'for':['cpp']}
"Plug 'scrooloose/syntastic',{'for':['c','cpp','go','python','java','js','tex','rust','ruby','vim']}
Plug 'w0rp/ale',{'for':['c','cpp','go','python','js','tex','rust','ruby','vim']}



Plug 'arakashic/chromatica.nvim', {'for':['c','cpp']}
Plug 'artur-shaik/vim-javacomplete2', {'for':'java'} 
Plug 'NLKNguyen/vim-maven-syntax', {'for':'xml.maven'}
Plug 'ternjs/tern_for_vim', {'for':'js'} 
Plug 'Valloric/MatchTagAlways' , {'for':['xml','html','css','vim']}
Plug 'mattn/emmet-vim' , {'for':['xml','html','css','vim']}
" }}}}

" Nerdtree {{{{
Plug 'scrooloose/nerdtree', {'on':'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter', {'on':'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on':'NERDTreeToggle'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on':'NERDTreeToggle'}
" }}}}

" Layout Tools {{{{
Plug 'majutsushi/tagbar'
"Plug 'brookhong/cscope.vim'
Plug 'vim-scripts/SrcExpl'
Plug 'jlanzarotta/bufexplorer'
Plug 'rizzatti/dash.vim'
Plug 'Yggdroot/indentLine'
Plug 'mileszs/ack.vim'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }}}}

" VCS or Fold Manage {{{{
" Plug 'airblade/vim-rooter'
if MultiFunc==1
    Plug 'airblade/vim-gitgutter'
endif
Plug 'sjl/gundo.vim'
Plug 'int3/vim-extradite'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim', {'on': ['Gina']}
Plug 'gregsexton/gitv'
" }}}}

" Code Snipper{{{{
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'Raimondi/delimitMate'
Plug 'honza/vim-snippets',{'for':['c','cpp','go','python','java','js','tex','rust','ruby']}
Plug 'SirVer/ultisnips' ,{'for':['c','cpp','go','python','java','js','tex','rust','ruby']}
" }}}}

" Async tools {{{{
Plug 'tpope/vim-dispatch'
Plug 'thoughtbot/vim-rspec'
" }}}}

" Effective Tools {{{{
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'

Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'Shougo/unite.vim'
Plug 'Shougo/denite.nvim'
Plug 'devjoe/vim-codequery'
if MultiFunc==1
    Plug 'rstacruz/vim-fastunite'
endif
Plug 'Shougo/neomru.vim'

if MultiFunc==1
    Plug 'mhinz/vim-startify'
    Plug 'vim-scripts/YankRing.vim'
    Plug 'kshenoy/vim-signature'
    Plug 'dkprice/vim-easygrep'
endif

Plug 'chrisbra/vim-diff-enhanced'
Plug 'vim-scripts/DirDiff.vim'
Plug 'Shougo/vimproc.vim'
Plug 'idanarye/vim-vebugger'
Plug 'L9'

Plug 'itchyny/vim-cursorword'
" }}}}

" Graph {{{{
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-easy-align'
" }}}}

" golang {{{{
Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'fatih/vim-go'
Plug 'buoto/gotests-vim'
" }}}}

" Scala {{{
Plug 'derekwyatt/vim-scala', {'for': 'scala'}
" }}}

" Python {{{{
Plug 'klen/python-mode', {'for':'python'}
Plug 'hdima/python-syntax', {'for':'python'}
Plug 'suan/vim-instant-markdown' ,{'for':'markdown'}
Plug 'tmhedberg/SimpylFold'
Plug 'onlytiancai/flake8'
Plug 'nose-devs/nose'
" }}}}

" SQL {{{{
Plug 'vim-scripts/dbext.vim'
" }}}}
 
" Latex {{{{
Plug 'bjoernd/vim-ycm-tex'
Plug 'LaTeX-Box-Team/LaTeX-Box'
" }}}}

" Prolog {{{{
Plug 'adimit/prolog.vim'
" }}}}

" R {{{{
Plug 'jcfaria/Vim-R-plugin'
" }}}}

" Haskell {{{{
Plug 'neovimhaskell/haskell-vim'
Plug 'begriffs/haskell-vim-now'
" }}}}

" Json & xml & toml & yaml{{{{
Plug 'elzr/vim-json'
Plug 'sukima/xmledit'
Plug 'cespare/vim-toml'

Plug 'pearofducks/ansible-vim'
Plug 'chase/vim-ansible-yaml'


map <F4> <Esc>:%!python -m json.tool<CR>

" }}}}

" Effective Tools {{{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'hrj/vim-DrawIt'
" }}}}
 
" Icon {{{{
Plug 'ryanoasis/vim-devicons'
" }}}}
call plug#end()

" }}} End Plug
set rtp+=/Users/syslot/.fzf
set rtp+=/Users/syslot/.vim/eclim
" Code Complate {{{

" Omni Engine Complate 
filetype indent on
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
"autocmd FileType haskell set omnifunc=necoghc#omnifunc

"auto set omnifunc by filetype
if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
\ if &omnifunc == "" |
\ setlocal omnifunc=syntaxcomplete#Complete |
\ endif
endif

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
let g:ycm_python_binary_path='/Users/syslot/.pyenv/shims/python'
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
let g:ycm_semantic_triggers =  {
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

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

filetype plugin indent on
syntax on

" }}}


" Syncta Check {{{

"" for cpp
"let g:syntastic_cpp_include_dirs = ['/usr/include/']
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_compiler = 'g++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"" set error or warning signs
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"" whether to show balloons
"let g:syntastic_enable_balloons = 1
"
"" for golang 
"let g:syntastic_go_checkers = ['golint', 'vet', 'errcheck', 'gometalinter']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"let g:syntastic_go_gometalinter_args=['--fast']
"let g:go_list_type = "quickfix"
"
"" }}}

" ale {{{
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok'] 
 
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

" For vimr
" endif

nnoremap <F1>   :NERDTreeToggle     <CR>
 
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
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

nnoremap <F2> :TagbarToggle<CR>

" }}}


" Airline {{{
 
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airelin#extensions#eclim#enable =1
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
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
 
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
let g:chromatica#libclang_path='/usr/local/opt/llvm/lib'

" color_coded
let g:colorjcoded_enabled=1
let g:chromatica#enable_at_startup=1
"let g:chromatica#highlight_feature_level=1
let g:chromatica#responsive_mode=1
let g:chrometica#delay_ms = 80


"let g:color_coded_filetypes = ['c', 'cpp', 'objc']
"" Disable color_coded in diff mode
"if &diff
"      let g:color_coded_enabled = 0
"endif
"if has('nvim')
"      let g:color_coded_enabled = 0
"endif

" }}}


" Cscope & vim-rooter{{{

" change time workspace by folder
" let g:rooter_disable_map = 1
"let g:rooter_patterns = ['.git/']
"let g:rooter_silent_chdir = 1

" For Cscope #### Instead by vim-codequery
"function LoadCscope()
"    if filereadable("cscope.out")
"        cs add 'cscope.out'
"    endif
"endfunction

"" Load Cscope after vim config init already
"autocmd Filetype c,cpp autocmd VimEnter call LoadCscope()

"" s: Find this C symbol
"nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
"" g: Find this definition
"nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
"" d: Find functions called by this function
"nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
"" c: Find functions calling this function
"nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
"" t: Find this text string
"nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
"" e: Find this egrep pattern
"nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
"" f: Find this file
"nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
"" i: Find files #including this file
"nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

"" }}}
 

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

" asible-yaml {{{
let g:ansible_extra_syntaxes = "zsh.vim ruby.vim"
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1

" }}}


" Python syntax highlight & functional fold {{{
let g:PaperColor_Python_Highlight_Builtins = 1

let python_highlight_all = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
 
let g:SimpylFold_docstring_preview = 0
let b:did_indent=1
let g:pymode_lint_checkers = ['pyflakes']
let g:pymode_trim_whitespaces = 0
let g:pymode_options = 0
let g:pymode_rope = 0

let g:pymode_indent = 1
let g:pymode_options_colorcolumn = 1

" Enhanced python highlighting
hi pythonLambdaExpr      ctermfg=105 guifg=#8787ff
hi pythonInclude         ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold
hi pythonClass           ctermfg=167 guifg=#FF62B0 cterm=bold gui=bold
hi pythonParameters      ctermfg=147 guifg=#AAAAFF
hi pythonParam           ctermfg=175 guifg=#E37795
hi pythonBrackets        ctermfg=183 guifg=#d7afff
hi pythonClassParameters ctermfg=111 guifg=#FF5353
hi pythonSelf            ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold

hi pythonDottedName      ctermfg=74  guifg=#5fafd7

hi pythonError           ctermfg=196 guifg=#ff0000
hi pythonIndentError     ctermfg=197 guifg=#ff005f
hi pythonSpaceError      ctermfg=198 guifg=#ff0087

hi pythonBuiltinType     ctermfg=74  guifg=#9191FF
hi pythonBuiltinObj      ctermfg=71  guifg=#5faf5f
hi pythonBuiltinFunc     ctermfg=169 guifg=#d75faf cterm=bold gui=bold

hi pythonException       ctermfg=207 guifg=#CC3366 cterm=bold gui=bold
" }

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
" JavaComplete2 {{{
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P><Down>
"
"let g:JavaComplete_MavenRepositoryDisable = 1
"let g:JavaComplete_UseFQN = 1
"let g:JavaComplete_ClosingBrace = 1
"let g:JavaComplete_JavaviDebug = 1
"let g:JavaComplete_ImportDefault = 0
" }}}

" rainbow {{{
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
" }}}

" Goyo & Limelight{{{
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave() 
" }}}

" TableMode {{{
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
" }}}

" YankRing {{{
if MultiFunc==1
    let g:yankring_history_dir = '$HOME/.vim/yankdir'
endif
" }}}

" CodeQuery {{{
let g:codequery_enable_auto_clean_languages=['c','cpp','java','python','go','ruby','javascript']
" }}}
" 
" 
" Eclim {{{
let g:EclimCompletionMethod = 'omnifunc'
function! IsProjectFile()
    let projectName = eclim#project#util#GetCurrentProjectName()
    if projectName == ''
         setlocal omnifunc=javacomplete#Complete
    endif
endfunction
autocmd FileType java call IsProjectFile()

" }}}

let g:ascii = [
          \ '                                         ___                                 ___       ',
          \ '                                        /  /\         ___       ___         /__/\      ',
          \ '                                       /  /:/_       /__/\     /  /\       |  |::\     ',
          \ '                                      /  /:/ /\      \  \:\   /  /:/       |  |:|:\    ',
          \ '                                     /  /:/ /::\      \  \:\ /__/::\     __|__|:|\:\   ',
          \ '                                    /__/:/ /:/\:\ ___  \__\:\\__\/\:\__ /__/::::| \:\  ',
          \ '                                    \  \:\/:/~/://__/\ |  |:|   \  \:\/\\  \:\~~\__\/  ',
          \ '                                     \  \::/ /:/ \  \:\|  |:|    \__\::/ \  \:\        ',
          \ '                                      \__\/ /:/   \  \:\__|:|    /__/:/   \  \:\       ',
          \ '                                        /__/:/     \__\::::/     \__\/     \  \:\      ',
          \ '                                        \__\/          ~~~~                 \__\/      ',
          \]

let g:startify_custom_header = g:ascii " + startify#fortune#boxed()
