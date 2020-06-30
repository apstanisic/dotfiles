
call plug#begin('~/.local/share/nvim/plugged')

" Typescript
Plug 'leafgarland/typescript-vim'
" Sidebar
Plug 'scrooloose/nerdtree'
"Bottom bar
Plug 'vim-airline/vim-airline'
" Surround parentheses, brackets, quotes...
Plug 'tpope/vim-surround'

call plug#end()

" Toggle sidebar (same shortcut as vscode)
silent! nmap <C-b> :NERDTreeToggle<CR>

" A little better built in theme
colorscheme desert

" Tab is 4 spaces wide, not 8
set tabstop=4
