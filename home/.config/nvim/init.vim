" kelp's Neovim Config

" Package Management {{{
" TODO: Consider or test vim-plug for package management
" Minpac has to be loaded before any other minpac commands.
" Otherwise I'd alphabetize these folds.
" minpac to manage plugins
packadd minpac 
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
" 
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" }}}

" Appearance {{{
set number      " enable line numbers
set showcmd     " show the last command entered
set cursorline  " put a line where the cursor is

" Creates a nice default start screen
" https://github.com/mhinz/vim-startify
call minpac#add('mhinz/vim-startify')

" Nice utf-8 icons for vim-airline, must load after plugins that require
" these fonts
call minpac#add('ryanoasis/vim-devicons')

" themes have to be opt to avoid a race in loading
"call minpac#add('drewtempelmeyer/palenight.vim', {'type': 'opt'})
call minpac#add('joshdick/onedark.vim', {'type': 'opt'})
call minpac#add('edkolev/promptline.vim', {'type': 'opt'})

" Put a nice colored powerline like bar at the bottom
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
" This requires a terminal configured with Nerd Font
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
set laststatus=2

" Add a nice indent vertical indicator
call minpac#add('yggdroot/indentline')

let g:indentLine_char = '⎸'

" Disable setting a background color without this we get kind of a grey 
" washed out look
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

" Enable 24 bit colors if we can
if (has("termguicolors"))
  set termguicolors
endif

" Disable oneark, then load it. This seems to work around a race that
" causes a ton of errors.
packadd! onedark.vim
"packadd! palenight.vim
colorscheme onedark
set background=dark
"colorscheme palenight
let g:onedark_terminal_italics=1

if has('nvim')
highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" }}}

" Autocmd Rules {{{
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

set autoread

" }}}

" File Management {{{
" A bunch of commands for using git
call minpac#add('tpope/vim-fugitive')

" Show's git status in airline
call minpac#add('airblade/vim-gitgutter')

" NERDtree and related plugins
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight')
" https://github.com/Xuyuanp/nerdtree-git-plugin
call minpac#add('Xuyuanp/nerdtree-git-plugin')
" https://github.com/scrooloose/nerdtree
call minpac#add('scrooloose/nerdtree')
" key bind to open NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDtree is really slow without these
" let NERDTreeHighlightCursorline = 0
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'css', 'c++', 'go', 'h', 'js', 'md', 'py', 'rb']
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" https://github.com/Shougo/defx.nvim

"call minpac#add('Shougo/defx.nvim') 
" fzm fuzzy finder macOS config and setup
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :<C-u>FZF<CR>

" }}}

" Language Specific {{{
"
" Some tools for writing vim plugins
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})

" Sets editorconfig project / langauge specific settings if they exist
call minpac#add('editorconfig/editorconfig-vim')

" Go Lang
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
call minpac#add('fatih/vim-go')
let g:syntastic_go_checkers = ['golint', 'govet']

" Python
" jedi support for deoplete
call minpac#add('zchee/deoplete-jedi')
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" syntastic
let g:syntastic_python_checkers=['python', 'flake8']

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" JavaScript 
" use `eslint` (and only eslint)
let g:ale_linters = {
\ 'javascript': ['eslint'], 
\}

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" }}}

" Misc {{{
"
" Prevent running nvim inside a nvim terminal
if has('nvim') && executable('nvr')
let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

" make esc work in nvim terminal mode
if has('nvim')
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
endif

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch       " highlight matching [{()}]<Paste>
" }}}

" Syntax and Code Completion {{{
"
" Code completion plugin
call minpac#add('Shougo/deoplete.nvim')
let g:deoplete#enable_at_startup = 1
" Show incline documentation
let g:deoplete#sources#jedi#show_docstring = 1

" A linter, fixer and completion plugin
call minpac#add('w0rp/ale')
" Don't enable completion with ale, only use it's linter
" let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1


" Syntax and indentation for many languages
call minpac#add('sheerun/vim-polyglot')

" Syntax checking for many languages
call minpac#add('vim-syntastic/syntastic')
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

syntax on       " enable syntax highlighting
" }}}

" Text Formatting {{{
set encoding=utf-8
" Add some key mappings to manage code omments 
call minpac#add('scrooloose/nerdcommenter')
let g:NERDSpaceDelims = 1

" :Tab helps to line up text
call minpac#add('godlygeek/tabular')

set tabstop=4       " show a tab as 4 spaces
set softtabstop=4   " number of spaces a tab means when editing
set expandtab       " tab key inputs spaces
filetype indent on  " load filetype-specific indent files
set wildmenu        " visual autocomplete for the command menu
set lazyredraw      " redraw only when we need to.
set foldenable      " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
set colorcolumn=80  " mark column 80
set modelines=1     " look for a modeline on the last line of the file

" }}}

" vim:foldmethod=marker:foldlevel=0
