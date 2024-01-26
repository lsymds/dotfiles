" Leader is a comma, no ragrets.
let mapleader=","

" Standard configurations
set clipboard=unnamed
set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set ruler
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set backspace=indent,eol,start

" Plugins!
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'antoinemadec/coc-fzf'
Plug 'sheerun/vim-polyglot'
Plug 'benmills/vimux'
Plug 'preservim/nerdtree'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-test/vim-test'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" Colorscheme
colorscheme dracula

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Misc. mappings
inoremap jj <Esc>
nmap ; :
nnoremap <leader>rc :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>

" Buffer quick switch
nnoremap <leader><leader> :b#<CR>

" Navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Resizing, use ctrl+hjkl to resize windows
nnoremap <C-h> :vertical resize -2<CR>
nnoremap <C-j> :resize -2<CR>
nnoremap <C-k> :resize +2<CR>
nnoremap <C-l> :vertical resize +2<CR>

" CoC - Extensions
let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-tsserver',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-go',
            \ 'coc-vetur',
            \ 'coc-eslint',
            \ 'coc-tslint',
            \ ]

" CoC - Tab navigate completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" CoC - GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" CoC - Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Find files and project navigation
let $FZF_DEFAULT_COMMAND="rg --files --hidden -g '!dist/' -g '!node_modules/' -g '!.git/'"
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }

:map <C-t> :Files<CR>

" Nerdtree bindings
let g:NERDTreeShowHidden=1
nnoremap <leader>nt :NERDTreeFind<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" Vim Test Keymappings
nnoremap <leader>ct :TestNearest<CR>
nnoremap <leader>ft :TestFile<CR>

" Automatically re-order Go imports on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
