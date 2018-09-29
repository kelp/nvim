set encoding=utf-8

" load minpac to manage plugins
packadd minpac 
call minpac#init()
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-fugitive')
" The bufferline plugin is incompatible with the fugitive plugin
"call minpac#add('bling/vim-bufferline')
call minpac#add('w0rp/ale')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('vim-syntastic/syntastic')
call minpac#add('sheerun/vim-polyglot')
" Nice utf-8 icons for vim-airline
call minpac#add('ryanoasis/vim-devicons')
" themes have to be opt to avoid a race in loading
call minpac#add('drewtempelmeyer/palenight.vim', {'type': 'opt'})
call minpac#add('joshdick/onedark.vim', {'type': 'opt'})
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('k-takata/minpac', {'type': 'opt'})
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" vim-airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
set laststatus=2

" vim-bufferline config
let g:airline#extensions#bufferline#enabled = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" fzm fuzzy finder macOS config and setup
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :<C-u>FZF<CR>

" For JavaScript files, use `eslint` (and only eslint)
let g:ale_linters = {
\ 'javascript': ['eslint'], 
\}
" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" make esc work in nvim terminal mode
if has('nvim')
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
endif

if has('nvim')
highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" Prevent running nvim inside an nvim terminal
if has('nvim') && executable('nvr')
let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

set number
syntax on

" Disables setting a background color
" without this we get kind of a grey washed out look
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

if (has("termguicolors"))
  set termguicolors
endif

" If we don't do this, the colorscheme errors out
packadd! onedark.vim
"packadd! palenight.vim
colorscheme onedark
set background=dark
"colorscheme palenight
let g:onedark_terminal_italics=1
