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
set updatetime=250                   " Frequency of updating.
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

Plug 'ap/vim-css-color'                " --- Preview colours in source code.
Plug 'cespare/vim-toml'                " --- TOML syntax.
Plug 'chrisbra/csv.vim'                " --- CSV files.
Plug 'chrisbra/vim-diff-enhanced'      " --- Enhanced vimdiff.
Plug 'christoomey/vim-tmux-navigator'  " --- Tmux pane integration with vim.
Plug 'easymotion/vim-easymotion'       " --- Easy motions.
Plug 'junegunn/fzf.vim'                " --- fzf in vim.
Plug 'junegunn/vim-easy-align'         " --- Alignment.
Plug 'junegunn/vim-peekaboo'           " --- See contents of registers.
Plug 'justinmk/vim-sneak'              " --- Extra motions.
Plug 'kana/vim-textobj-line'           " --- Text objects for current line.
Plug 'kana/vim-textobj-user'           " --- Dependency for vim-textobj-line.
Plug 'mhinz/vim-signify'               " --- Git gutter.
Plug 'michaeljsmith/vim-indent-object' " --- Indent text object.
Plug 'ncm2/ncm2'                       " --- Completion engine.
Plug 'ncm2/ncm2-bufword'               " --- Buffer word completion.
Plug 'ncm2/ncm2-jedi'                  " --- Python Jedi completion.
Plug 'ncm2/ncm2-markdown-subscope'     " --- Code blocks in markdown.
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
                                       " --- Include completion.
Plug 'ncm2/ncm2-path'                  " --- Path completion.
Plug 'ncm2/ncm2-rst-subscope'          " --- Code blocks in rst.
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
                                       " --- Syntax completion.
Plug 'ncm2/ncm2-tagprefix'             " --- Tag completion.
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
                                       " --- VimL completion.
Plug 'ntpeters/vim-better-whitespace'  " --- Whitespace hightlight and removal.
Plug 'roxma/nvim-yarp'                 " --- Dependency for ncm2.
Plug 'scrooloose/nerdtree'             " --- Tree directory browser.
Plug 'Shougo/echodoc.vim'              " --- Show function signature.
Plug 'tpope/vim-commentary'            " --- Comment stuff out.
Plug 'tpope/vim-eunuch'                " --- Unix commands.
Plug 'tpope/vim-fugitive'              " --- Git integration.
Plug 'tpope/vim-repeat'                " --- Repeating plugin maps.
Plug 'tpope/vim-rsi'                   " --- Readline features in command line.
Plug 'tpope/vim-speeddating'           " --- Increment dates, times, and more.
Plug 'tpope/vim-surround'              " --- Quoting/parenthesizing made simple.
Plug 'tpope/vim-unimpaired'            " --- Bracket mappings.
Plug 'unblevable/quick-scope'          " --- Hightlight f, F, t, T.
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
"---justinmk/vim-sneak
"
let g:sneak#use_ic_scs = 1

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
"---unblevable/quick-scope
"
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"
"---vim-airline/vim-airline
"
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

" Markdown
let g:ale_linters.markdown = ['writegood', 'alex']

" Python
let g:ale_linters.python = ['pyflakes', 'pycodestyle']
let g:ale_fixers.python = ['isort', 'black']
let g:ale_type_map = {'pycodestyle': {'ES': 'WS', 'E': 'W'}}
let g:ale_python_black_options = '--line-length 88 --skip-string-normalization'

"
"---Yggdroot/indentLine
"
let g:indentLine_char = "|"
let g:indentLine_enabled = 1
let g:indentLine_setConceal = 0
let g:indentLine_fileTypeExclude = ['fortran', 'json', 'text']

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

" }}}
" ==============================================================================
"   Miscellaneous {{{
" ==============================================================================

"
"---Aesthetics.
"
set termguicolors
let g:rehash256 = 1
:highlight! link QuickFixLine NONE             " No hightlight in quickfix.

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
"---Use rg over grep.
"
if executable('ag')
    set grepprg=rg\ --no-heading\ --color\ never
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
