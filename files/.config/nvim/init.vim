silent! nmap <C-b> :NERDTreeToggle<CR>

call plug#begin('~/.local/share/nvim/plugged')

" This plugin for TypeScript IDE capabilities
" Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
