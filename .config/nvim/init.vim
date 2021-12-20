" Installs vim plug if not installed,
" and all plugins 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.local/share/nvim/plugged')

" Sensible defaults
Plug 'tpope/vim-sensible'
" Typescript syntax
Plug 'leafgarland/typescript-vim'
" Sidebar
Plug 'scrooloose/nerdtree'
"Bottom bar
Plug 'vim-airline/vim-airline'
" Surround parentheses, brackets, quotes...
Plug 'tpope/vim-surround'
" Dart syntax
Plug 'dart-lang/dart-vim-plugin'


call plug#end()

" Toggle sidebar (same shortcut as vscode)
silent! nmap <C-b> :NERDTreeToggle<CR>

" A little better built in theme
colorscheme desert

" Tab is 4 spaces wide, not 8
set tabstop=4
