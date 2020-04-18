
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
