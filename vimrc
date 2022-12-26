"************************************************************************
" Start with defaults from neovim for neovim/gvim compatibility
"************************************************************************
if !has('nvim')
    call mkdir($HOME.'/.config/nvim', 'p')
    set runtimepath^=$HOME/.config/nvim       " prepend nvim path to runtime
    " We load colorscheme before reaching minpac. Alternative is to load
    " colorscheme after minpac init
    call mkdir($HOME.'/.local/share/nvim/site', 'p')
    set runtimepath+=$HOME/.local/share/nvim/site
    set runtimepath+=$HOME/.local/share/nvim/site/pack/minpac/start/vim-solarized8

    set nocompatible                          " not compatible with Vi
    filetype plugin indent on                 " mandatory for modern plugins
    syntax on                                 " enable syntax highlighting
    set autoindent                            " copy indent from the previous
                                              " line
    set autoread                              " reload from disk
    set background=dark                       " dark background
    set backspace=indent,eol,start            " modern backspace behavior
    set belloff=all                           " disable the bell
    set nocompatible                          " not vi compatible
    set complete-=i                           " don't scan current and
                                              " included
                                              " files for keyword completion
    set cscopeverbose                         " verbose cscope output
    set directory=$HOME/.local/share/vim/swap " Default for swapfiles
    " set display=lastline,msgsep             " display more message text.
                                              " gvim throws error
    set encoding=utf-8                        " set default encoding
    set fillchars=vert:┋,fold:·               " Characters to fill the
                                              " statuslines and vertical
                                              " separators
    set formatoptions=tcqj                    " more intuitive autoformatting
    set nofsync                               " dont call fsync() when
                                              " file saving
    set history=10000                         " longest possible command
                                              " history
    set hlsearch                              " highlight search results
    set incsearch                             " move cursor as you type when
                                              " searching
    set langnoremap                           " helps avoid mappings breaking
    set laststatus=2                          " always display a status line
    set listchars=tab:>\ ,trail:-,nbsp:+      " chars for :list
    set nrformats=bin,hex                     " <c-a> and <c-x> support
    set ruler                                 " display current line # in a
                                              " corner
    set sessionoptions-=options               " do not carry options across
                                              " sessions
    set shortmess+=F                          " less file info when editing
    set shortmess-=S                          " show search count
    set showcmd                               " show partial command as you
                                              " type
    set sidescroll=1                          " smoother sideways scrolling
    set smarttab                              " tab setting aware <Tab> key
    set tabpagemax=50                         " maximum number of tabs open by
                                              " -p flag
    set tags=./tags;,tags                     " filenames to look for the tag
                                              " command(; stop upward file
                                              " search when you find tags)
    set ttimeoutlen=50                        " ms to wait for next key in a
                                              " sequence
    set ttyfast                               " indicates that our connection
                                              " is fast
    set viminfo+=!                            " save global variables across
                                              " sessions
    set wildmenu                              " enhanced command line
                                              " completion
    " set wildoptions=pum,tagfile             " cmdline completion behaviour
                                              " use popupmenu for cmdline
                                              " show kind and file of tag when
                                              " C-d. vim does not support pum
endif

"************************************************************************
" General settings
"************************************************************************
set fileencoding=utf8                " utf-8 file-content encoding for the current
                                     " buffer
set tabstop=8                        " number of spaces that a <Tab> in the file
                                     " counts for
set noexpandtab                      " in insert mode use appropriate number of
                                     " spaces to insert a <Tab>
set softtabstop=0                    " number of spaces that a <Tab> counts for
                                     " while performing editing operations,
                                     " like inserting a <Tab> or using <BS>
set shiftwidth=8                     " number of spaces to use for each step of
                                     " (auto)indent.
set nobackup                         " don't create backups when overwriting
set ignorecase                       " ignore case in patterns and  tags search
set smartcase                        " match case if upper case in patterns
set incsearch                        " highlight pattern matched so far as you
                                     " type
set wildmode=longest:full,full       " list all and complete longest match then
                                     " cycle full possibilities with tab
set path=.,,**,/usr/include          " recursively search cur dir for files
set wildignore+=*/.cache/*           " exclude .cache
set wildignore+=*/.config/*          " exclude .config
set wildignore+=*/.local/*           " exclude .local
set wildignore+=*/.ssh/*             " exclude .ssh
set wildignore+=*/.vim/*             " exclude .vim
set wildignore+=__*/*,*/tmp/*        " exclude python cache and temp directories
set wildignore+=*/AppData/*          " On windows
set nrformats=bin,octal,hex          " C-x and C-a understands all 4 bases
set hidden                           " allow hiding a modified buffer
set listchars=tab:»\ ,eol:¬,trail:«  " chars for tab, eol and trailing space
set clipboard+=unnamed,unnamedplus   " enable both * and + clipboard
set splitright                       " vertical split creates window right
set splitbelow                       " horizontal split creates window below
set showtabline=2                    " always show tab page labels
set ssop+=unix                       " always save session with unix eol
set complete+=i,d,k                  " scan current & included file for autocomplete
                                     " scan the current dictionary
set completeopt+=menuone             " show pop up menu even when there is only one match
set formatoptions+=n                 " recognize numbered list

if has('nvim')
    call mkdir($HOME.'/.cache/nvim/swap','p')
    set shada+=n$HOME/.cache/nvim/viminfo
    set directory=$HOME/.cache/nvim/swap
else
    call mkdir($HOME.'/.cache/vim/swap','p')
    set viminfo+=n$HOME/.cache/vim/viminfo
    set directory=$HOME/.cache/vim/swap
endif

set undofile                         " persistent undo
if has('nvim')
    call mkdir($HOME.'/.cache/nvim/undo','p')
    set undodir=$HOME/.cache/nvim/undo
else
    call mkdir($HOME.'/.cache/vim/undo','p')
    set undodir=$HOME/.cache/vim/undo
endif                                " save undo files in cache instead of
                                     " curdir
augroup noundohistontempfile
    autocmd!
    autocmd BufWritePre **/tmp/* setlocal noundofile
augroup end                          " don't save undo history of temp file
                                     " it may sensitive data like password

set statusline=
set statusline+=[%2n]                             " buffer number
set statusline+=[%<%F]                            " File path
set statusline+=%m%r                              " modified and read only
set statusline+=%w                                " Preview window
set statusline+=[%Y\|                             " filetype
set statusline+=%{''.(&fenc!=''?&fenc:&enc).''}\| " encoding
set statusline+=%{(&bomb?\',BOM\':\'\')}\|        " bom
set statusline+=%{&ff}]                           " file form dos/unix
set statusline+=[%{&spelllang}]                   " spell language
set statusline+=[0x%B]                            " hex value of char under cursor
set statusline+=%=                                " right align
set statusline+=[%{LinterStatus()}]               " Status from ale linter
set statusline+=[%{ObsessionStatus('t','p')}]     " session tracking
set statusline+=[%{FugitiveStatusline()}]         " git status
set statusline+=[%l\/\%L\(%p%%)\,                 " line number
set statusline+=%c]                               " column number

"************************************************************************
" Filetypes
"************************************************************************
filetype plugin indent on            " detect filetype and load plugin
                                     " and indent file for the filetype

"************************************************************************
" Mappings
"************************************************************************
let mapleader = "\\"                 " \ is the mapleader

" %% expands to current file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" enable/disable syntax highlighting
map yot :if exists("g:syntax_on") <Bar>
	\   syntax off <Bar>
	\ else <Bar>
	\   syntax enable <Bar>
	\ endif <CR>

" replay substitute with flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" map C-x C-o to C-Space for easy omnicomplete
inoremap <C-Space> <C-x><C-o>

" Insert mode:
inoremap <A-h> <Esc><c-w>h
inoremap <A-j> <Esc><c-w>j
inoremap <A-k> <Esc><c-w>k
inoremap <A-l> <Esc><c-w>l
" Visual mode:
vnoremap <A-h> <Esc><c-w>h
vnoremap <A-j> <Esc><c-w>j
vnoremap <A-k> <Esc><c-w>k
vnoremap <A-l> <Esc><c-w>l
" Normal mode:
nnoremap <A-h> <c-w>h
nnoremap <A-j> <c-w>j
nnoremap <A-k> <c-w>k
nnoremap <A-l> <c-w>l

"************************************************************************
" Auto commands
"************************************************************************
" :h last-position-jump
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif                        " move to last opened position of file
                                     " the " register holds that data

autocmd InsertLeave,CompleteDone *
    \ if pumvisible() != 0
    \ | pclose | endif               " close preview window when done or
                                     " when leaving insert mode

"************************************************************************
" File browser
"************************************************************************
let g:netrw_liststyle = 3            " default to tree style listing
let g:netrw_banner = 0               " do not display banner
let g:netrw_browse_split = 4         " Reuse previous window
let g:netrw_winsize = 25             " 25% of current screen either
                                     " horizontal or vertical based on split
                                     " using Sexplore or Vexplore
let g:netrw_home = $HOME.'/.cache/nvim'
                                     " save bookrmarks and history in .cache
let g:netrw_mousemaps = 1            " leftmouse opens file/directory
let g:netrw_preview = 0              " preview window opens in vert split
let g:netrw_alto = 1                 " Above/Below splitting

if has('win32') || has('win64')
    let g:netrw_cygwin   = 0
    let g:netrw_ssh_cmd  = 'PLINK.EXE -batch -T -share -ssh'
    let g:netrw_scp_cmd  = 'PSCP.EXE  -batch '
    let g:netrw_sftp_cmd = 'PSFTP.EXE -batch'
endif                                " use putty tools for windows

" use \f to toggle file explorer window
nnoremap <Leader>f :Lexplore<CR>

"************************************************************************
" Repeat and Scripts
"************************************************************************
runtime macros/matchit.vim           " extended matching with %
runtime macros/man.vim               " man page in vim

"************************************************************************
" Colors
"************************************************************************
set background=dark
colorscheme solarized8

"************************************************************************
" Terminal mappings
"************************************************************************
if exists(':tnoremap')
    " esc will switch to terminal mode
    tnoremap <Esc> <c-\><c-n>
    " send Esc to terminal program
    tnoremap <C-v><Esc> <Esc>
    " access register from terminal mode
    tnoremap <expr> <c-r> '<c-\><c-n>"'.nr2char(getchar()).'pi'
    " navigate windows when terminal is open
    " terminal mode: :h terminal
    tnoremap <A-h> <c-\><c-n><c-w>h
    tnoremap <A-j> <c-\><c-n><c-w>j
    tnoremap <A-k> <c-\><c-n><c-w>k
    tnoremap <A-l> <c-\><c-n><c-w>l
endif

"************************************************************************
" Autocompletion and linting with Ale
"************************************************************************
" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

" Linting
let g:ale_linters = {
\	'python': ['pyls','flake8'],
\}
" Keep sign gutters always open
let g:ale_sign_column_always = 1
" lint only when saving
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

" Fixers
let g:ale_fixers = {
\	'python': ['autopep8'],
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

"************************************************************************
" Plugin management with minpac
"************************************************************************
let &packpath = &runtimepath
if !isdirectory($HOME. "/.config/nvim/pack/minpac/opt")
	call mkdir($HOME. "/.config/nvim/pack/minpac/opt",'p')
	call system("cd ".$HOME."/.config/nvim/pack/minpac/opt && git clone https://github.com/k-takata/minpac.git")
endif

" $ mkdir -p $HOME/.config/nvim/pack/minpac/opt
" $ cd $HOME/.config/nvim/pack/minpac/opt
" $ git clone https://github.com/k-takata/minpac.git
packadd minpac
if exists('*minpac#init')
    " packages will be installed here
    call minpac#init({'dir': $HOME.'/.local/share/nvim/site'})
    " call minpac#init({'dir': $HOME.'/.local/share/nvim/site','verbose': 3})
    " call minpac#init()
    " add packages
    call minpac#add('atweiden/vim-dragvisuals')
    call minpac#add('dense-analysis/ale')
    call minpac#add('godlygeek/tabular')
    call minpac#add('kassio/neoterm')
    call minpac#add('lifepillar/vim-solarized8')
    call minpac#add('nelstrom/vim-qargs')
    call minpac#add('nelstrom/vim-visual-star-search')
    call minpac#add('tpope/vim-abolish')
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('tpope/vim-obsession')
    call minpac#add('tpope/vim-repeat')
    call minpac#add('tpope/vim-surround')
    call minpac#add('tpope/vim-unimpaired')
    call minpac#add('tpope/vim-vinegar')
    " call minpac#add('kien/ctrlp.vim')
    " call minpac#add('Shougo/deoplete')
    " call minpac#add('zchee/deoplete-jedi')
endif
command! PackUpdate packadd minpac |
    \ source $MYVIMRC |
    \ call minpac#update('',
    \ {'do': 'call minpac#status()'}
    \ )                              " install/update packages
command! PackClean  packadd minpac |
    \ source $MYVIMRC |
    \ call minpac#clean()            " remove plugins not registered
command! PackStatus packadd minpac |
    \ source $MYVIMRC |
    \ call minpac#status()           " get packages status

"************************************************************************
" Vim inside tmux
"************************************************************************
" https://github.com/tmux/tmux/issues/1246
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

"************************************************************************
" Only for GVim
"************************************************************************
if has('gui')
    cd $HOME
endif                                 " set working directory to home instead
                                      " of GVim install directory

"************************************************************************
" Package specific
"************************************************************************
" Visual drag
vmap  <expr>  <C-h> DVB_Drag('left')
vmap  <expr>  <C-l> DVB_Drag('right')
vmap  <expr>  <C-j> DVB_Drag('down')
vmap  <expr>  <C-k> DVB_Drag('up')
vmap  <expr>  D     DVB_Duplicate()

let g:DVB_TrimWS = 1                 " Remove any introduced trailing
                                     " whitespace after moving

" Tabularize as you type in insert mode
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Obsession - save the session
call mkdir($HOME.'/.cache','p')
nnoremap <Leader>o :Obsession $HOME/.cache<CR>

nnoremap <Leader>O :Obsession!<CR>
autocmd VimEnter * nested
      \ if !argc()
      \   && empty(v:this_session)
      \   && filereadable($HOME.'/.cache/Session.vim') 
      \   && !&modified |
      \     source $HOME/.cache/Session.vim |
      \ endif

" Neoterm
let g:neoterm_default_mod='botright' " open at bottom at full width
let g:neoterm_size=20                " 10 rows high 
let g:neoterm_autoinsert=1           " open in insert mode
nnoremap <Leader>t :Ttoggle<CR>
tnoremap <Leader>t <C-\><C-n>:Ttoggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C programming
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is a plugin for Vim (tested with Vim v7.1) to follow the OpenBSD style(9)
" indentation.  It registers a macro (see below) for changing a buffer's
" indentation rules but does not change the indentation of existing code.

" OpenBSD mapping to switch current buffer to style(9).  This is generally '\f'.
" nmap <silent> <Leader>f :call OpenBSD_Style()<CR>

" Ignore indents caused by parentheses in OpenBSD style.
function! IgnoreParenIndent()
    let indent = cindent(v:lnum)

    if indent > 4000
        if cindent(v:lnum - 1) > 4000
            return indent(v:lnum - 1)
        else
            return indent(v:lnum - 1) + 4
        endif
    else
        return (indent)
    endif
endfun

" Every value of cinoptions is passed to indentexpr. The IgnoreParenIndent
" function decides to add 4 spaces to previous line or to return the same
" indent if the value is >4000. If it is less, then whatever is in
" cinoptions is used.
function! OpenBSD_Style()
    setlocal cindent
    setlocal cinoptions=(4200,u4200,+0.5s,*500,:0,t0,U4200
    setlocal indentexpr=IgnoreParenIndent()
    setlocal indentkeys=0{,0},0),:,0#,!^F,o,O,e
    setlocal noexpandtab
    setlocal shiftwidth=8
    setlocal tabstop=8
    setlocal softtabstop=0
    setlocal textwidth=80
endfun

" A tag can record various information, called fields. The essential fields are:
" name of language objects, input, pattern, and line. input: is the name of
" source file where name: is defined or referenced. pattern: can be used to
" search the name in input:. line is the line number where name: is defined or
" referenced in input:.
" ctags offers extension fields.
" kind: is a field which represents the kind of language object specified by a
" tag. Kinds used and defined are very different between parsers. For example, C
" language defines “macro”, “function”, “variable”, “typedef”, etc.

" Build tags file for local project
let s:cmd=['ectags', '-R']             " recurse the directory
call add(s:cmd, '--c-kinds=+p')        " index prototype while generating tag
call add(s:cmd, '--fields=+S')         " include function signature in every
                                       " tagfile line
call add(s:cmd, '-f')                  " tagfile path
call add(s:cmd, expand('%:h').'/tags') " in the folder of current file
call add(s:cmd, expand('%:h'))         " source file location
let s:cmd_str=join(s:cmd, ' ')

augroup c_filetype
	autocmd!
	autocmd FileType c call OpenBSD_Style()
	autocmd FileType c setlocal tags+=/var/db/libc.tags
	autocmd FileType c let $CFLAGS="-std=c99 -g -Wall -pedantic"
	autocmd BufWritePost *.[ch] call system(s:cmd_str)
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python programming
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup py_filetype
	autocmd!
	autocmd FileType python setlocal tabstop=4
        autocmd FileType python setlocal softtabstop=4
        autocmd FileType python setlocal shiftwidth=4
        autocmd FileType python setlocal expandtab
        autocmd FileType python setlocal textwidth=78
        autocmd FileType python setlocal fileformat=unix
        autocmd FileType python setlocal autoindent
        autocmd FileType python setlocal foldmethod=indent
augroup END

