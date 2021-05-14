let mapleader =" "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ervandew/supertab'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'powerman/vim-plugin-ruscmd'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
call plug#end()

" dracula theme
    set termguicolors 
    colorscheme dracula

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
    set go=a
    set mouse=a
    set nohlsearch
    set clipboard=unnamedplus

" no ex mode
    nnoremap Q <nop>

" set undo file
    set undofile

" completion
	set wildmode=longest,list,full
    let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
    set completeopt=longest,menuone
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <expr> <M-j> pumvisible() ? "\<C-n>" : "\<M-j>"
    inoremap <expr> <M-k> pumvisible() ? "\<C-p>" : "\<M-k>"

" 90 char highlight
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%91v', 100)

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" .envrc File syntax highlight
    au BufRead,BufNewFile .envrc set filetype=sh

" go stuff
    let g:go_imports_mode='gopls'
    let g:go_imports_autosave=1
    let g:go_gopls_staticcheck = 1
    let g:go_metalinter_autosave = 1
    let g:go_metalinter_deadline = '20s'
" Show Func signature in status line
    let g:go_auto_type_info = 1
" All syntax highlight on
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_interfaces = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_types = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_build_constraints = 1

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

    autocmd InsertEnter,InsertLeave * set cul!
