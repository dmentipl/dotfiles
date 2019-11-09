" vim: set foldmethod=marker foldlevel=0 nomodeline:

"         ██╗   ██╗ ██╗ ███╗   ███╗ ██████╗   ██████╗
"         ██║   ██║ ██║ ████╗ ████║ ██╔══██╗ ██╔════╝
"         ██║   ██║ ██║ ██╔████╔██║ ██████╔╝ ██║
"         ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ██╔══██╗ ██║
"       ██╗╚████╔╝  ██║ ██║ ╚═╝ ██║ ██║  ██║ ╚██████╗
"       ╚═╝ ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ╚═╝  ╚═╝  ╚═════╝


" ==============================================================================
"   Settings {{{
" ==============================================================================

set autoindent                       " Enable automatic indentation.
set background=dark                  " Enable colors for dark backgrounds.
set backspace=indent,eol,start       " Backspace works on everything.
set colorcolumn=80                   " Colored column to see textwidth.
set completeopt=noinsert,menuone,noselect
set concealcursor=nc                 " Conceal in normal & command mode.
set conceallevel=1                   " Concealed text replaced by one character.
set cursorline                       " Highlight the line with the cursor.
set diffopt+=vertical                " Diff splits side-by-side.
set expandtab                        " Convert tabs to spaces.
set encoding=utf-8                   " Set encoding to UTF-8.
set hidden                           " Edit multiple unsaved buffers.
set history=1000                     " Remember the last thousand commands.
set hlsearch                         " Highlight search terms.
set ignorecase                       " Ignore case while searching.
set incsearch                        " Highlight matches as you type.
set laststatus=2                     " Always show the status line.
set lazyredraw                       " Fixes slow scrolling with cursorline.
set linebreak                        " Break on words not end of space.
set listchars=                       " Set default whitespace characters.
set listchars+=trail:·
set listchars+=precedes:«
set listchars+=extends:»
set listchars+=eol:⏎
set listchars+=tab:▸-
set modeline                         " Check files for modelines.
set mouse=a                          " Enable mouse support.
set mousehide                        " Hide the mouse cursor when typing.
set noshowmode                       " Don't show the current mode.
set nostartofline                    " Go to previous cursor location when
                                     " switching between buffers.
set nowrap                           " Don't wrap long lines.
set number                           " Always show line numbers.
set omnifunc=syntaxcomplete#Complete " Syntax completion with <c-x><c-o>.
set ruler                            " Enable the ruler.
set scrolloff=8                      " Keep 8 lines above/below the cursor.
set sidescrolloff=10                 " Keep 10 columns next to the cursor.
set shiftwidth=4                     " Use four spaces when auto-indenting.
set showcmd                          " Show partial command in status line.
set showmatch                        " Briefly jump to matching brackets.
set smartcase                        " Override the ignorecase option if
                                     " the search has upper case characters.
set smartindent                      " Smart autoindenting for new lines.
set smarttab                         " Use shiftwidth when using <tab> in
                                     " front of a line.
set softtabstop=4                    " How many spaces should be inserted
                                     " when hitting <tab> or backspace.
set spellfile=~/.config/nvim/spell/en.utf-8.add
                                     " Add words not in dictionary with zg.
set splitbelow                       " Place new splits below and
set splitright                       " to the right.
set tabstop=4                        " Set <tab> to display four spaces.
set textwidth=80                     " Maximum text length before a new line.
set timeoutlen=500                   " Key time out length.
set ttyfast                          " Indicates a fast terminal connection.
set undofile                         " Enable persistent undos.
set undolevels=9999                  " Number of changes that can be undone.
set undoreload=9999                  " Number of lines to save on buffer reload.
set updatetime=250                   " Frequency of updating for plugins like
                                     " the tagbar or gitgutter.
set viminfo='20,\"50                 " Retain various info between sessions.
set virtualedit=block                " Visual block mode can select blank space.
set whichwrap=b,s,<,>,[,]            " Allow keys to move the cursor to the
            " | | | | | |              previous/next line.
            " | | | | | |
            " | | | | | +------- ] Insert and Replace
            " | | | | +--------- [ Insert and Replace
            " | | | +----------- <right> Normal and Visual
            " | | +------------- <left> Normal and Visual
            " | +--------------- <space> Normal and Visual
            " +----------------- <bs> Normal and Visual
set wildignore+=*.swp,*.o,*.mod
set wildmenu                         " Autocomplete commands.
set wildmode=longest:full,full       " Autocomplete til the longest common
                                     " string and the next full match.

" }}}
" ==============================================================================
"   Leader {{{
" ==============================================================================

let mapleader = "\<space>"
let maplocalleader = "\<space>"

" }}}
" ==============================================================================
"   Plugins {{{
" ==============================================================================

"
"---Specify a directory for plugins.
"   Keep Plug commands between plug#begin/end.
"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-rooter'             " --- Change dir to project root.
Plug 'ap/vim-css-color'                " --- Preview colours in source code.
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }                                " --- Language Server Protocol.
Plug 'bps/vim-textobj-python'          " --- Python text objects.
Plug 'cespare/vim-toml'                " --- TOML syntax.
Plug 'chrisbra/csv.vim'                " --- CSV files.
Plug 'chrisbra/vim-diff-enhanced'      " --- Enhanced vimdiff.
Plug 'christoomey/vim-tmux-navigator'  " --- Tmux pane integration with vim.
Plug 'easymotion/vim-easymotion'       " --- Easy motions.
Plug 'embear/vim-localvimrc'           " --- Project specific vimrc.
Plug 'filipekiss/ncm2-look.vim'        " --- English word completion.
Plug 'gaalcaras/ncm-R'                 " --- R completion.
Plug 'goerz/jupytext.vim'              " --- Jupytext for vim.
Plug 'haya14busa/incsearch.vim'        " --- Better search.
Plug 'honza/vim-snippets'              " --- Snippet library.
Plug 'iamcco/markdown-preview.nvim', {
    \ 'do': { -> mkdp#util#install() }
    \ }                                " --- Markdown preview.
Plug 'jalvesaq/Nvim-R'                 " --- R support.
Plug 'janko/vim-test'                  " --- Testing integration.
Plug 'josuegaleas/jay'                 " --- Jay colorscheme.
Plug 'jpalardy/vim-slime'              " --- Text to REPL.
Plug 'jreybert/vimagit'                " --- Git integration.
Plug 'JuliaEditorSupport/julia-vim'    " --- Julia support.
Plug 'junegunn/fzf.vim'                " --- fzf in vim.
Plug 'junegunn/goyo.vim'               " --- Distraction free writing.
Plug 'junegunn/gv.vim'                 " --- Git commit browser.
Plug 'junegunn/limelight.vim'          " --- Focus on paragraph.
Plug 'junegunn/vim-easy-align'         " --- Alignment.
Plug 'junegunn/vim-peekaboo'           " --- See contents of registers.
Plug 'junegunn/vim-xmark', {
    \ 'do': 'make'
    \ }                                " --- Markdown integration.
Plug 'justinmk/vim-sneak'              " --- Extra motions.
Plug 'kana/vim-textobj-line'           " --- Text objects for current line.
Plug 'kana/vim-textobj-user'           " --- Dependency for vim-textobj-line.
Plug 'lervag/vimtex'                   " --- Tex/Latex integration.
Plug 'liuchengxu/vim-which-key'        " --- Spacemacs-style show keys.
Plug 'ludovicchabant/vim-gutentags'    " --- Tag management.
Plug 'majutsushi/tagbar'               " --- Exuberant ctags tagbar.
Plug 'mbbill/undotree'                 " --- Undo tree visualization.
Plug 'mhinz/vim-signify'               " --- Git gutter.
Plug 'michaeljsmith/vim-indent-object' " --- Indent text object.
Plug 'morhetz/gruvbox'                 " --- Gruvbox colorscheme.
Plug 'mtth/scratch.vim'                " --- Scratch buffer.
Plug 'ncm2/ncm2'                       " --- Completion engine.
Plug 'ncm2/ncm2-bufword'               " --- Buffer word completion.
Plug 'ncm2/ncm2-cssomni'               " --- css completion.
Plug 'ncm2/ncm2-go'                    " --- Go completion.
Plug 'ncm2/ncm2-github'                " --- Github completion.
Plug 'ncm2/ncm2-html-subscope'         " --- Code blocks in html.
Plug 'ncm2/ncm2-jedi'                  " --- Python Jedi completion.
Plug 'ncm2/ncm2-markdown-subscope'     " --- Code blocks in markdown.
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
                                       " --- Include completion.
Plug 'ncm2/ncm2-path'                  " --- Path completion.
Plug 'ncm2/ncm2-pyclang'               " --- C/C++ completion.
Plug 'ncm2/ncm2-racer'                 " --- Rust completion.
Plug 'ncm2/ncm2-rst-subscope'          " --- Code blocks in rst.
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
                                       " --- Syntax completion.
Plug 'ncm2/ncm2-tagprefix'             " --- Tag completion.
Plug 'ncm2/ncm2-tern'                  " --- JavaScript completion.
Plug 'ncm2/ncm2-ultisnips'             " --- Snippets completion.
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
                                       " --- VimL completion.
Plug 'ntpeters/vim-better-whitespace'  " --- Whitespace hightlight and removal.
Plug 'reedes/vim-lexical'              " --- Thesaurus.
Plug 'reedes/vim-pencil'               " --- Vim as a writing tool.
Plug 'reedes/vim-wordy'                " --- Usage problems in your writing.
Plug 'roxma/nvim-yarp'                 " --- Dependency for ncm2.
Plug 'sakhnik/nvim-gdb', {
    \ 'do': ':!./install.sh \| UpdateRemotePlugins'
    \ }                                " --- Debugging.
Plug 'scrooloose/nerdtree'             " --- Tree directory browser.
Plug 'Shougo/echodoc.vim'              " --- Show function signature.
Plug 'SirVer/ultisnips'                " --- Snippet engine.
Plug 'terryma/vim-multiple-cursors'    " --- Multiple cursors.
Plug 'tommcdo/vim-fubitive'            " --- Bitbucket integration.
Plug 'tpope/vim-abolish'               " --- Fancy search/replace.
Plug 'tpope/vim-commentary'            " --- Comment stuff out.
Plug 'tpope/vim-eunuch'                " --- Unix commands.
Plug 'tpope/vim-fugitive'              " --- Git integration.
Plug 'tpope/vim-repeat'                " --- Repeating plugin maps.
Plug 'tpope/vim-rhubarb'               " --- GitHub integration.
Plug 'tpope/vim-rsi'                   " --- Readline features in command line.
Plug 'tpope/vim-speeddating'           " --- Increment dates, times, and more.
Plug 'tpope/vim-surround'              " --- Quoting/parenthesizing made simple.
Plug 'tpope/vim-unimpaired'            " --- Bracket mappings.
Plug 'unblevable/quick-scope'          " --- Hightlight f, F, t, T.
Plug 'Valloric/ListToggle'             " --- Toggle quickfix and location list.
Plug 'vim-airline/vim-airline'         " --- Airline status bar.
Plug 'whatyouhide/vim-lengthmatters'   " --- Highlight text after textwidth.
Plug 'w0rp/ale'                        " --- Asynchronous linting.
Plug 'Yggdroot/indentLine'             " --- Show indentation visually.

"
"---Initialize plugin system.
"
call plug#end()

" }}}
" ==============================================================================
"   Plugin options {{{
" ==============================================================================

"
"---autozimu/LanguageClient-neovim
"
let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsEnable = 0    " Use LSP or ALE to lint
let g:LanguageClient_useVirtualText = 0       " Show errors within code text
let g:LanguageClient_settingsPath = ''        " Path to LSP settings.json
let g:LanguageClient_serverCommands = {
    \ 'fortran': ['fortls'],
    \ }
let g:LanguageClient_loggingFile = '/tmp/lc.log'
let g:LanguageClient_loggingLevel = 'DEBUG'
augroup LSP
    autocmd!
    autocmd FileType fortran call SetLSPKeymaps()
    autocmd FileType fortran call SetLSPWhichKeyKeymaps()
augroup END

"
"---chrisbra/csv.vim
"
let g:csv_comment = '#'

"
"---christoomey/vim-tmux-navigator
"
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <m-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <m-j> :TmuxNavigateDown<cr>
nnoremap <silent> <m-k> :TmuxNavigateUp<cr>
nnoremap <silent> <m-l> :TmuxNavigateRight<cr>
nnoremap <silent> <m-\> :TmuxNavigatePrevious<cr>

"
"---easymotion/vim-easymotion
"
map <bslash> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1

"
"---embear/vim-localvimrc
"
let g:localvimrc_persistent=1

"
"---haya14busa/incsearch.vim
"
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)N
map #  <Plug>(incsearch-nohl-#)N
map g* <Plug>(incsearch-nohl-g*)N
map g# <Plug>(incsearch-nohl-g#)N

"
"---iamcco/markdown-preview.nvim
"
let g:mkdp_auto_start = 0
let g:mkdp_refresh_slow = 1

"
"---janko/vim-test
"
let test#strategy = "neovim"

"
"---jpalardy/vim-slime
"
let g:slime_target = "neovim"
let g:slime_python_ipython = 1
function! SlimeSplit(cmd,height) abort
    execute a:height."split"
    enew | call termopen(a:cmd)
    let l:repl_job_id = b:terminal_job_id
    execute 'normal!' . "G"
    execute 'normal!' . "\<c-w>p"
    let b:slime_config = {"jobid": l:repl_job_id}
endfunction
function! SlimeVSplit(cmd) abort
    execute "vsplit"
    enew | call termopen(a:cmd)
    let l:repl_job_id = b:terminal_job_id
    execute 'normal!' . "G"
    execute 'normal!' . "\<c-w>p"
    let b:slime_config = {"jobid": l:repl_job_id}
endfunction

"
"---junegunn/fzf.vim
"
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" ProjectFiles operates on git root if available
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()

"
"---junegunn/vim-peekaboo
"
let g:peekaboo_prefix = '<leader>r'
let g:peekaboo_window = 'vert bo 50new'
let g:peekaboo_ins_prefix = '<c-x>'

"
"---jreybert/vimagit
"
let g:magit_show_magit_mapping='<F99>'

"
"---justinmk/vim-sneak
"
let g:sneak#use_ic_scs = 1

"
"---lervag/vimtex
"
let g:tex_comment_nospell = 1
let g:tex_conceal = ''
let g:vimtex_view_automatic = 0
let g:vimtex_quickfix_mode = 0
let g:vimtex_disable_version_warning = 1
let g:vimtex_view_general_viewer =
    \ '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_general_options_latexmk = '-r 1'
augroup vimtex
    autocmd!
    autocmd FileType tex call SetLatexWhichKeyKeymaps()
augroup END

"
"---liuchengxu/vim-which-key
"
" LEADER
" Dictionary of mappings
let g:which_key_map =  {' ' : 'goto-match'}
let g:which_key_map.b = {
    \ 'name' : '+buffer',
    \ ' ' : 'alternate-buffer',
    \ 'b' : 'search-buffers',
    \ 'd' : 'delete-buffer',
    \ 'D' : 'force-delete-buffer',
    \ 'f' : 'first-buffer',
    \ 'h' : 'home-buffer',
    \ 'l' : 'last-buffer',
    \ 'n' : 'next-buffer',
    \ 'N' : 'new-buffer',
    \ 'p' : 'prev-buffer',
    \ 'r' : 'reload-buffer',
    \ }
let g:which_key_map.c = {
    \ 'name' : '+comment',
    \ 'c' : 'comment-action',
    \ 'l' : 'comment-line',
    \ }
let g:which_key_map.d = {
    \ 'name' : '+do',
    \ '!' : 'do-line-as-shell-command',
    \ ':' : 'do-line-as-command',
    \ '@' : 'do-line-as-macro',
    \ }
let g:which_key_map.e = {
    \ 'name' : '+error',
    \ 'd' : 'show-error',
    \ 'f' : 'run-fixers',
    \ 'n' : 'next-error',
    \ 'p' : 'prev-error',
    \ }
let g:which_key_map.f = {
    \ 'name' : '+file',
    \ 'd' : { 'name' : '+dotfile',
            \ 'e' : 'edit-dotfile',
            \ 'r' : 'reload-dotfile', },
    \ 'f' : 'find-file',
    \ 'r' : 'reload-file',
    \ 's' : 'save-file',
    \ 'S' : 'save-all-files',
    \ }
let g:which_key_map.g = {
    \ 'name' : '+git',
    \ 'b' : 'git-blame',
    \ 'c' : { 'name' : '+commit',
            \ 'c' : 'git-commit',
            \ 's' : 'search-commits',
            \ 'v' : 'view-commits', },
    \ 'd' : 'git-diff',
    \ 'h' : { 'name' : '+hunk',
            \ 'h' : 'highlight-hunk',
            \ 'p' : 'preview-hunk',
            \ 's' : 'stage-hunk',
            \ 'u' : 'undo-hunk', },
    \ 'j' : 'next-git-hunk',
    \ 'k' : 'next-git-hunk',
    \ 'l' : 'git-pull',
    \ 'm' : 'magit',
    \ 'p' : 'git-push',
    \ 's' : 'git-status',
    \ }
let g:which_key_map.h = {
    \ 'name' : '+help',
    \ 'h' : 'open-help',
    \ }
let g:which_key_map.j = {
    \ 'name' : '+jump',
    \ 'f' : 'jump-in-line',
    \ 'j' : 'jump-to-1-character',
    \ 'l' : 'jump-to-line',
    \ 'm' : 'jump-to-mark',
    \ 's' : 'jump-to-2-characters',
    \ 't' : 'jump-to-tag',
    \ 'w' : 'jump-to-word',
    \ }
function! SetLSPWhichKeyKeymaps()
    let g:which_key_map.l = {
        \ 'name' : '+language',
        \ 'f' : 'formatting',
        \ 'h' : 'hover',
        \ 'r' : 'references',
        \ 'R' : 'rename',
        \ 's' : 'document-symbol',
        \ 'S' : 'workspace-symbol',
        \ 'g' : { 'name': '+goto',
                \ 'd' : 'definition',
                \ 't' : 'type-definition',
                \ 'i' : 'implementation', },
        \ }
endfunction
function! SetLatexWhichKeyKeymaps()
    let g:which_key_map.l =  {'name' : '+latex'}
endfunction
let g:which_key_map.p = {
    \ 'name' : '+project',
    \ 'f' : 'find-file',
    \ 's' : 'search-project',
    \ 't' : 'project-tree',
    \ }
let g:which_key_map.q = {
    \ 'name' : '+quit',
    \ 'q' : 'quit',
    \ 'Q' : 'quit-no-save',
    \ 's' : 'quit-save',
    \ }
let g:which_key_map.r = {
    \ 'name' : '+register',
    \ '"' : 'yank-register',
    \ '@' : 'macro-register',
    \ }
let g:which_key_map.s = {
    \ 'name' : '+search',
    \ '/' : 'search-history',
    \ ':' : 'command-history',
    \ '?' : 'key-maps',
    \ '\' : 'clear-search-highlight',
    \ 'b' : 'search-buffer',
    \ 'c' : 'search-commands',
    \ 'g' : 'search-commits',
    \ 'm' : 'search-marks',
    \ 'p' : 'search-project',
    \ 's' : 'search-snippets',
    \ 't' : 'search-tags',
    \ }
let g:which_key_map.t = {
    \ 'name' : '+toggle',
    \ 'g' : 'toggle-tagbar',
    \ 'h' : { 'name' : '+highlight',
            \ 'c' : 'clear-highlights',
            \ 'l' : 'highlight-line', },
    \ 'i' : 'toggle-indent-lines',
    \ 'l' : 'toggle-location-list',
    \ 'm' : 'toggle-listchars',
    \ 'n' : 'toggle-line-numbers',
    \ 'p' : 'toggle-paste',
    \ 'q' : 'toggle-quickfix',
    \ 'r' : 'toggle-line-wrap',
    \ 's' : 'toggle-spell',
    \ 't' : 'toggle-file-tree',
    \ 'u' : 'toggle-undo-tree',
    \ 'w' : 'toggle-whitespace',
    \ }
let g:which_key_map.w = {
    \ 'name' : '+window',
    \ '-' : 'horizontal-split',
    \ '/' : 'vertical-split',
    \ '=' : 'equal-window-size',
    \ 'd' : 'delete-window',
    \ 'h' : 'left-window',
    \ 'j' : 'down-window',
    \ 'k' : 'up-window',
    \ 'l' : 'right-window',
    \ 'o' : 'only-window',
    \ 'p' : 'close-preview-window',
    \ 's' : 'horizontal-split',
    \ 'v' : 'vertical-split',
    \ 'w' : 'other-window',
    \ }
let g:which_key_map.x = {
    \ 'name' : '+text',
    \ 'a' : 'align-text',
    \ 'c' : 'change-case-word',
    \ 'f' : 'format-file',
    \ }
" Ignore maps
let g:which_key_map.b.1 = 'which_key_ignore'
let g:which_key_map.b.2 = 'which_key_ignore'
let g:which_key_map.b.3 = 'which_key_ignore'
let g:which_key_map.b.4 = 'which_key_ignore'
let g:which_key_map.b.5 = 'which_key_ignore'
let g:which_key_map.b.6 = 'which_key_ignore'
let g:which_key_map.b.7 = 'which_key_ignore'
let g:which_key_map.b.8 = 'which_key_ignore'
let g:which_key_map.b.9 = 'which_key_ignore'
" Register dictionary
call which_key#register('<Space>', "g:which_key_map")
" Key mappings
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

"
"---ludovicchabant/vim-gutentags
"
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.md', '*.rst']
let g:gutentags_ctags_tagfile = '.tags'

"
"---majutsushi/tagbar
"
let g:tagbar_sort=0
let g:tagbar_width=30
let g:tagbar_type_bib = {
    \ 'ctagstype' : 'bib',
    \ 'kinds'     : [
        \ 'a:Articles',
        \ 'b:Books',
        \ 'L:Booklets',
        \ 'c:Conferences',
        \ 'B:Inbook',
        \ 'C:Incollection',
        \ 'P:Inproceedings',
        \ 'm:Manuals',
        \ 'T:Masterstheses',
        \ 'M:Misc',
        \ 't:Phdtheses',
        \ 'p:Proceedings',
        \ 'r:Techreports',
        \ 'u:Unpublished',
    \ ],
    \ 'sort'    : 0,
    \ 'deffile' : expand('<sfile>:p:h') . '/ctags/bib.cnf',
\ }

"
"---mhinz/vim-signify
"
let g:signify_realtime = 0
let g:signify_sign_change = '~'
let g:signify_vcs_list = [ 'git', 'hg' ]

"
"---ncm2/ncm2
"
autocmd BufEnter * call ncm2#enable_for_buffer()
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Vimtex
augroup vimtex_ncm2
    autocmd!
    autocmd BufEnter * call ncm2#enable_for_buffer()
    autocmd Filetype tex call ncm2#register_source({
        \ 'name': 'vimtex',
        \ 'priority': 8,
        \ 'scope': ['tex'],
        \ 'mark': 'tex',
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
augroup END

"
"---ntpeters/vim-better-whitespace
"
" Change whitespace highlight colour.
autocmd VimEnter,BufEnter * :highlight ExtraWhitespace guibg=darkgray
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf',
                                           \ 'help', 'markdown', 'leaderGuide']

"
"---sakhnik/nvim-gdb
"
let g:nvimgdb_disable_start_keymaps = 1

"
"---scrooloose/nerdtree
"
let g:NERDTreeWinSize = 24
" Close vim if only NERDTree open.
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") &&
            \b:NERDTree.isTabTree()) | q | endif

"
"---Shougo/echodoc.vim
"
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

"
"---SirVer/ultisnips
"
let g:UltiSnipsExpandTrigger = "<c-space>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = ["snips"]

"
"---unblevable/quick-scope
"
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"
"---Valloric/ListToggle
"
let g:lt_height = 7
let g:lt_location_list_toggle_map = '<F99>'
let g:lt_quickfix_list_toggle_map = '<F99>'

"
"---vim-airline/vim-airline
"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jay'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#wordcount#filetypes = 'tex'

"
"---whatyouhide/vim-lengthmatters
"
let g:lengthmatters_on_by_default = 0

"
"---w0rp/ale
"
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_enter=1
let g:ale_linters = {}
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" LaTeX
let g:ale_linters.tex = ['chktex', 'lacheck', 'writegood', 'alex']

" Markdown
let g:ale_linters.markdown = ['writegood', 'alex']

" Python
let g:ale_linters.python = ['pyflakes', 'pycodestyle']
let g:ale_fixers.python = ['isort', 'black']
let g:ale_type_map = {'pycodestyle': {'ES': 'WS', 'E': 'W'}}
let g:ale_python_black_options = '--line-length 88 --skip-string-normalization'

" Fortran
let g:ale_fortran_gfortran_executable = 'gfortran'
let g:ale_fortran_gfortran_options = '-Wall'
let g:ale_fortran_ifort_executable = 'ifort'
let g:ale_fortran_ifort_options = '-warn'
let g:ale_linters.fortran = ['gfortran']
augroup ale_cleanup
    autocmd!
    autocmd User ALELintPost
        \ :!find . -type f -name '*.i' -print0 | xargs -0 rm -f
    autocmd User ALELintPost
        \ :!find . -type f -name '*.i90' -print0 | xargs -0 rm -f
    autocmd User ALELintPost
        \ :!find /tmp -type f -name '*.mod' -print0 | xargs -0 rm -f
augroup END
function! FortranCompiler(compiler)
    if a:compiler==?'gfortran'
        let g:ale_linters.fortran = ['gfortran'] | :ALELint
    elseif a:compiler==?'ifort'
        let g:ale_linters.fortran = ['ifort'] | :ALELint
    elseif a:compiler==?'mpifort'
        let g:ale_linters.fortran = ['ifort']
        let g:ale_fortran_ifort_executable = 'mpifort' | :ALELint
    else
        echom "compiler not recognised"
    endif
endfunction
function! FortranFlags(flag)
    if g:ale_linters['fortran'][0]==?'ifort'
        let g:ale_fortran_ifort_options=g:ale_fortran_ifort_options
            \ . ' ' . a:flag | :ALELint
    elseif g:ale_linters['fortran'][0]==?'gfortran'
        let g:ale_fortran_gfortran_options=g:ale_fortran_gfortran_options
            \ . ' ' . a:flag | :ALELint
    endif
endfunction
function! FortranInclude(dir)
    call FortranFlags(' -I' . a:dir) | :ALELint
endfunction
command! -nargs=+ -complete=command FortranCompiler call FortranCompiler(<q-args>)
command! -nargs=+ -complete=command FortranInclude  call FortranInclude(<q-args>)
command! -nargs=+ -complete=command FortranFlags    call FortranFlags(<q-args>)

"
"---Yggdroot/indentLine
"
let g:indentLine_char = "|"
let g:indentLine_enabled = 1
let g:indentLine_setConceal = 0
let g:indentLine_fileTypeExclude = ['fortran', 'json', 'text']

" }}}
" ==============================================================================
"   Functions {{{
" ==============================================================================

"
"---Highlight lines.
"
function! HighlightRegion(mode)
    highlight StandOut ctermbg=24 guibg=#204A87
    if a:mode=='line'
        " Highlight line
        execute "let m = matchadd('StandOut','\\%" . line('.') . "l')"
    elseif a:mode=='clear'
        " Clear highlights
        call clearmatches()
    else
    endif
endfunction
command! HighlightLine call HighlightRegion('line')
command! HighlightClear call HighlightRegion('clear')

"
"---Capture message output.
"
function! Message(cmd)
    redir => message
    silent execute a:cmd
    redir END
    if empty(message)
        echoerr "no output"
    else
        new
        setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
        silent put=message
    endif
endfunction
command! -nargs=+ -complete=command Message call Message(<q-args>)

" }}}
" ==============================================================================
"   Key mappings {{{
" ==============================================================================

"
"---Alt-tab and shift-alt-tab to switch between buffers.
"
nnoremap <m-tab> :bn<cr>
nnoremap <m-c-y> :bp<cr>

"
"---Jump down by half a screen.
"
noremap <c-f> <c-d>
noremap <c-b> <c-u>

"
"---Paste last yank, make Y consistent with C and D.
"
nnoremap Y y$

"
"---Allow . command to work in visual mode.
"
vnoremap . :norm.<cr>

"
"---Move between editor lines rather than actual lines.
"
vnoremap j gj
vnoremap k gk
vnoremap $ g$
vnoremap ^ g^
vnoremap 0 g0
nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap ^ g^
nnoremap 0 g0

"
"---Reverse mappings for above.
"
vnoremap gj j
vnoremap gk k
vnoremap g$ $
vnoremap g^ ^
vnoremap g0 0
nnoremap gj j
nnoremap gk k
nnoremap g$ $
nnoremap g^ ^
nnoremap g0 0

"
"---Space-space to go to match.
"
nmap <space><space> %
vmap <space><space> %
omap <space><space> %

"
"---Exit to normal mode.
"
inoremap fd <esc>
vnoremap fd <esc>
tnoremap fd <c-\><c-n>

"
"---Unmap F1 as help.
"
inoremap <f1> <esc>
nnoremap <f1> <esc>
vnoremap <f1> <esc>

"
"---Stop cursor jumping when joining lines.
"
nnoremap J mzJ`z

"
"---Split line (sister to [J]oin lines).
"
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

"
"---Search a visual selection.
"
vnoremap / <esc>/\%><c-r>=line("'<")-1<cr>l\%<<c-r>=line("'>")+1<cr>l
vnoremap ? <esc>?\%><c-r>=line("'<")-1<cr>l\%<<c-r>=line("'>")+1<cr>l

"
"---Moving lines.
"
nnoremap <silent> <c-k> :move-2<cr>
nnoremap <silent> <c-j> :move+<cr>
nnoremap <silent> <c-h> <<
nnoremap <silent> <c-l> >>
xnoremap <silent> <c-k> :move-2<cr>gv
xnoremap <silent> <c-j> :move'>+<cr>gv
xnoremap <silent> <c-h> <gv
xnoremap <silent> <c-l> >gv
xnoremap < <gv
xnoremap > >gv

"
"---Move to start and end of line.
"
noremap H ^
noremap L $
vnoremap L g_

"
"---Move to last change (like gi).
"
nnoremap gI `.

"
"---Keep flags when repeating last substitute command.
"
nnoremap & :&&<cr>
xnoremap & :&&<cr>

"
"---Spacemacs.
"

" Buffers
nnoremap <leader>b<space> <c-^>
nnoremap <leader>bb  :Buffers<cr>
nnoremap <leader>bd  :bdelete<cr>
nnoremap <leader>bD  :bdelete!<cr>
nnoremap <leader>bf  :bfirst<cr>
nnoremap <leader>bl  :blast<cr>
nnoremap <leader>bn  :bnext<cr>
nnoremap <leader>bN  :enew<cr>
nnoremap <leader>bp  :bprevious<cr>
nnoremap <leader>br  :edit<cr>
nnoremap <leader>b1  :b1<cr>
nnoremap <leader>b2  :b2<cr>
nnoremap <leader>b3  :b3<cr>
nnoremap <leader>b4  :b4<cr>
nnoremap <leader>b5  :b5<cr>
nnoremap <leader>b6  :b6<cr>
nnoremap <leader>b7  :b7<cr>
nnoremap <leader>b8  :b8<cr>
nnoremap <leader>b9  :b9<cr>

" Comments
nmap     <leader>cc  <Plug>Commentary
nmap     <leader>cl  <Plug>CommentaryLine
xmap     <leader>cc  <Plug>Commentary

" Do
nnoremap <leader>d@  ^"zyg_@z
nnoremap <leader>d:  ^"zyg_:<c-r>z<cr>
nnoremap <leader>d!  ^"zyg_:!<c-r>z<cr>
nnoremap <leader>dm  :Xmark<cr>

" Errors
nnoremap <leader>ed  :ALEDetail<cr>
nnoremap <leader>ef  :ALEFix<cr>
nnoremap <leader>en  :ALENextWrap<cr>
nnoremap <leader>ep  :ALEPreviousWrap<cr>

" Files
nnoremap <leader>fde :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>fdr :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>ff  :Files<cr>
nnoremap <leader>fr  :e<cr>
nnoremap <leader>fs  :update<cr>
nnoremap <leader>fS  :wa<cr>

" Git
nnoremap <leader>gb  :Gblame<cr>
nnoremap <leader>gcc :Gcommit<cr>
nnoremap <leader>gcs :Commits<cr>
nnoremap <leader>gcv :GV<cr>
nnoremap <leader>gd  :Gdiff<cr>
nnoremap <leader>ghh :SignifyToggleHighlight<cr>
nmap     <leader>gj <plug>(signify-next-hunk)
nmap     <leader>gk <plug>(signify-prev-hunk)
nnoremap <leader>gl  :Git pull<cr>
nnoremap <leader>gm  :call magit#show_magit('h')<cr>:echo<cr>
nnoremap <leader>gp  :Git push<cr>
nnoremap <leader>gs  :Gstatus<cr>

" Help
nnoremap <leader>hh :help<cr><c-w>o

" Jump
nmap     <leader>jf  <Plug>(easymotion-lineanywhere)
nmap     <leader>jj  <Plug>(easymotion-bd-f)
nmap     <leader>jl  <Plug>(easymotion-bd-jk)
nnoremap <leader>jm  '
nmap     <leader>js  <Plug>(easymotion-bd-f2)
nnoremap <leader>jt  g<c-]>
nmap     <leader>jw  <Plug>(easymotion-bd-w)

" Language
function! SetLSPKeymaps()
    nnoremap <leader>lf  :call LanguageClient#textDocument_formatting()<cr>
    nnoremap <leader>lh  :call LanguageClient#textDocument_hover()<cr>
    nnoremap <leader>lr  :call LanguageClient#textDocument_references()<cr>
    nnoremap <leader>lR  :call LanguageClient#textDocument_rename()<cr>
    nnoremap <leader>ls  :call LanguageClient#textDocument_documentSymbol()<cr>
    nnoremap <leader>lS  :call LanguageClient#workspace_symbol()<cr>
    nnoremap <leader>lgd :call LanguageClient#textDocument_definition()<cr>
    nnoremap <leader>lgt :call LanguageClient#textDocument_typeDefinition()<cr>
    nnoremap <leader>lgi :call LanguageClient#textDocument_implementation()<cr>
endfunction

" Quit
nnoremap <leader>qq  :qa<cr>
nnoremap <leader>qQ  :qa!<cr>
nnoremap <leader>qs  :xa<cr>

" Project
nnoremap <leader>pf  :ProjectFiles<cr>
nnoremap <leader>ps  :Ag<cr>
nnoremap <leader>pt  :NERDTreeToggle<cr>

" Register

" Search
nnoremap <leader>s?  :Maps<cr>
nnoremap <leader>s:  :History:<cr>
nnoremap <leader>s/  :History/<cr>
nnoremap <leader>s\  :nohlsearch<bar>:echo<cr>
nnoremap <leader>sb  :BLines<cr>
nnoremap <leader>sc  :Commands<cr>
nnoremap <leader>sg  :BCommits<cr>
nnoremap <leader>sh  :Helptags<cr>
nnoremap <leader>sm  :Marks<cr>
nnoremap <leader>sp  :Ag<cr>
nnoremap <leader>ss  :Snippets<cr>
nnoremap <leader>st  :Tags<cr>

" Toggle
nnoremap <leader>tg  :TagbarToggle<cr>
nnoremap <leader>thc :HighlightClear<cr>
nnoremap <leader>thl :HighlightLine<cr>
vnoremap <leader>thl :HighlightLine<cr>
nnoremap <leader>ti  :IndentLinesToggle<cr>
nnoremap <leader>tl  :LToggle<cr>
nnoremap <leader>tm  :set list!<cr>
nnoremap <leader>tn  :set number!<cr>
nnoremap <leader>tq  :QToggle<cr>
nnoremap <leader>tp  :set paste!<cr>
nnoremap <leader>tr  :set wrap!<cr>
nnoremap <leader>ts  :set spell!<cr>
nnoremap <leader>tt  :NERDTreeToggle<cr>
nnoremap <leader>tu  :UndotreeToggle<cr>
nnoremap <leader>tw  :ToggleWhitespace<cr>

" Windows
nnoremap <leader>w-  :sp<cr>
nnoremap <leader>w/  :vsp<cr>
nnoremap <leader>w=  <c-w>=
nnoremap <leader>wd  :q<cr>
nnoremap <leader>wh  <c-w>h
nnoremap <leader>wj  <c-w>j
nnoremap <leader>wk  <c-w>k
nnoremap <leader>wl  <c-w>l
nnoremap <leader>wo  <c-w>o
nnoremap <leader>wp  <c-w>z
nnoremap <leader>ws  <c-w>s
nnoremap <leader>wv  <c-w>v
nnoremap <leader>ww  <c-w><c-w>

" Text
xmap     <leader>xa  <plug>(EasyAlign)
nmap     <leader>xa  <plug>(EasyAlign)
nnoremap <leader>xc  mzviw~`z
nnoremap <leader>xf  mzgg=G`z
vnoremap <leader>xf  =

" }}}
" ==============================================================================
"   Miscellaneous {{{
" ==============================================================================

"
"---Aesthetics.
"
colorscheme monokai
set termguicolors
let g:rehash256 = 1
:highlight! link QuickFixLine NONE             " No hightlight in quickfix.
:highlight! link TagbarHighlight VisualNOS     " Make tagbar hightlight grey.

"
"---Clipboard -- use system for copy/paste.
"
let os = substitute(system('uname'), "\n", "", "")
let hostname = substitute(system('hostname'), "\n", "", "")
if os ==? "darwin"
    set clipboard=unnamedplus
elseif os ==? "linux"
    set clipboard=unnamedplus
    autocmd VimLeave * call system("xsel -ib", getreg('+'))
    nnoremap <silent> <c-z> :call system("xsel -ib", getreg('+'))<cr><c-z>
endif

"
"---The Silver Searcher -- use ag over grep.
"
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif
" Bind K to grep word under cursor.
nnoremap K :grep! "\b<c-r><c-w>\b"<cr>:cw<cr>
" Push quickfix window always to the bottom
autocmd FileType qf wincmd J

" }}}
" ==============================================================================
"   Postscript {{{
" ==============================================================================

"
"---Format options: always last, but before filetypes, to override ftplugins.
"
augroup postscript
    autocmd!
    autocmd FileType * setlocal formatoptions=
    autocmd FileType * setlocal formatoptions+=tcrjq formatoptions-=o
    "                                          |||||                |
    " Auto-wrap text using textwidth ----------+||||                |
    " inserting the current comment leader -----+|||                |
    " Auto insert the current comment leader     |||                |
    " after hitting <enter> in Insert mode. -----+||                |
    " Remove comment lead on join. ---------------+|                |
    " Allow formatting comments with 'gq' ---------+                |
    " Do not continue comment using o or O -------------------------+
    " automatically.
augroup END

" }}}
" ==============================================================================
"   Filetypes {{{
" ==============================================================================

"---Fortran.
augroup fortran
    autocmd!
    autocmd FileType fortran setlocal shiftwidth=2 tabstop=2 textwidth=80
    autocmd FileType fortran let fortran_more_precise=1
    autocmd FileType fortran let fortran_do_enddo=1
    autocmd FileType fortran let fortran_indent_more=0
augroup END

"---HTML.
augroup html
    autocmd!
    autocmd FileType html setlocal shiftwidth=2 tabstop=2
augroup END

"---Markdown.
augroup markdown
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal formatoptions-=t
    autocmd FileType markdown setlocal wrap
augroup END

"---Python.
augroup python
    autocmd!
    autocmd FileType python setlocal shiftwidth=4 tabstop=4
    autocmd FileType python setlocal textwidth=88 colorcolumn=88
    autocmd FileType python command! IPython execute SlimeSplit('ipython', 16)
augroup END

"---reStructuredText.
augroup rst
    autocmd!
    autocmd FileType rst setlocal spell
    autocmd FileType rst setlocal formatoptions-=t
    autocmd FileType rst setlocal wrap
augroup END

"---Shell.
augroup shell
    autocmd!
    autocmd FileType sh,zsh setlocal shiftwidth=2 tabstop=2
augroup END

"---Tex.
augroup tex
    autocmd!
    autocmd FileType tex setlocal spell shiftwidth=3 tabstop=3
augroup END

"---Terminal.
augroup terminal
    autocmd!
    autocmd TermOpen * setlocal nonumber signcolumn=no
augroup END

"---YAML.
augroup yaml
    autocmd!
    autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
augroup END

" }}}
