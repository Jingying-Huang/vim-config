call plug#begin('~/.local/share/nvim/plugged')

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'google/yapf'
Plug 'airblade/vim-gitgutter'
Plug 'cocopon/iceberg.vim'
Plug 'majutsushi/tagbar'
" Providing linting (syntax checking and semantic errors) while you edit your
" text files. ALE makes use of Neovim and Vim 8
Plug 'dense-analysis/ale'
" Formater
Plug 'chiel92/vim-autoformat'
Plug 'puremourning/vimspector'
call plug#end()


" Basics
filetype plugin indent on
syntax on set number
colorscheme iceberg
set exrc
set secure
set incsearch
set splitbelow
set number
set relativenumber
set incsearch
set ignorecase
set smartcase
set hlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap
" always show the status bar
set laststatus=2
" mouse
set mouse=r
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

nnoremap <CR> :noh<CR><CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:vimspector_enable_mappings = 'HUMAN'

" NERDTree
autocmd StdinReadPre * let s:std_in=1
map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * wincmd p

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Use deoplete
let g:deoplete#enable_at_startup = 1

" vim-autoformat
noremap <F3> :Autoformat<CR>
au BufWrite * :Autoformat

" tag list
nmap <F8> :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" Navigate through the auto-completion list with TAB
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:airline_theme='minimalist' " <theme> is a valid theme name
let mapleader = "\<Space>"

" Automatical code check
call neomake#configure#automake('nrwi', 500)

nmap <F10> :ALEFix<CR>
let g:ale_fix_on_same=1

" Neomake
autocmd! BufWritePost,BufEnter * Neomake
