
set nocompatible              " be iMproved, required
filetype off                  " required
set t_Co=256 
set autoread
#maps saving as root to :Sw
command! -nargs=0 Sw w !sudo -S tee % > /dev/null


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/bundle")
Plugin 'vim-obsession'
Plugin 'powerline/powerline'
Plugin 'natecraddock/sessions.nvim'
Plugin 'Shougo/deol.nvim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'djoshea/vim-autoread'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'chriskempson/base16-vim'
Plugin 'ap/vim-css-color'
Plugin 'kchmck/vim-coffee-script'
Plugin 'arzg/vim-colors-xcode'
Plugin 'tpope/vim-repeat'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'relastle/bluewery.vim'
Plugin 'morhetz/gruvbox'
Plugin 'arzg/vim-corvine'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sheerun/vim-polyglot'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'junegunn/fzf.vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'sillybun/vim-repl'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'megantiu/true.vim'
Plugin 'vimwiki/vimwiki'
call vundle#end()            " required
require("sessions").setup({

    events = { "WinEnter" },
    session_filepath = vim.fn.stdpath("data") .. "/sessions",
    absolute = true,
})

" #vimwiki use markdown
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': 'md'}]

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
		  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'wadackel/vim-dogrun'
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'dylanaraps/wal.vim'
Plug 'junegunn/fzf'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf.vim' 
Plug 'nvim-tree/nvim-web-devicons' 
Plug 'christoomey/vim-tmux-runner'

call plug#end() 

" set tabstop=4 
"
let g:powerline_pycmd="py"

let g:repl_program = { 'javascript':'node'}
let g:repl_exit_commands = { 'node':'.exit'}

nnoremap <leader>f :Files<Cr>
nnoremap <leader>r :REPLToggle<Cr>


colorscheme wal

set ts=3
set mouse=a
"hide tool bar and menu bar
set guioptions-=T
set guioptions-=m
" remove scroll bar
set guioptions-=r


syntax on
set encoding=utf-8
set number relativenumber
set autoindent
set wildmode=longest,list,full

set splitbelow splitright

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-n> :NERDTreeToggle<CR>

"----- MACROS-----"
let @a ='ysstalli href='
let @u ='ostul€ku€kr€kr€kr€kr	stli'
"----" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300


" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

runtime macros/matchit.vim
