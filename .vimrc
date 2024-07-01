call plug#begin('~/.vim/plugged')

" File explorer
Plug 'scrooloose/nerdtree'

" Fuzzy finder for files and more
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git integration
Plug 'airblade/vim-gitgutter'

" Another fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Go development
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Auto-completion framework
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Terminal integration
Plug 'voldikss/vim-floaterm'

" Ayu theme
Plug 'ayu-theme/ayu-vim'

" Icons for NERDTree and other plugins
Plug 'ryanoasis/vim-devicons'

" Persian support
Plug 'sheerun/vim-polyglot'

call plug#end()

" Set leader key to "\"
let mapleader="\\"

" NERDTree settings
nmap <leader>e :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" FZF settings
nmap <leader>p :Files<CR>

" Enable syntax highlighting
syntax on
filetype plugin indent on

" Enable relative line numbers
set relativenumber
set number

" Use system clipboard for yank and delete operations
set clipboard=unnamedplus

" Enable mouse support
set mouse=a

" Go specific settings
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_def_mode = "gopls"
let g:go_info_mode = "gopls"

" coc.nvim settings for Go
autocmd BufNewFile,BufRead *.go setlocal omnifunc=v:lua.vim.lsp.omnifunc
let g:coc_global_extensions = ['coc-go', 'coc-tsserver', 'coc-pyright', 'coc-prettier']

" Automatically start gopls (Go language server) when editing Go files
autocmd FileType go nmap <leader>rn <Plug>(coc-rename)
autocmd FileType go nmap <leader>ca <Plug>(coc-codeaction)

" Custom keybindings
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>s :w<CR>
nmap <leader>c :wq<CR>
nmap <leader>q :q!<CR>
nmap <leader>v :vsplit<CR>
nmap <leader>= :split<CR>

" Floaterm keybindings
nnoremap <leader>t :FloatermToggle<CR>
tnoremap <leader>t <C-\><C-n>:FloatermToggle<CR>

" coc.nvim keybindings for autocomplete navigation with Ctrl+j and Ctrl+k
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"


" Enable devicons in NERDTree
let g:nerdtree_tabs_open_on_console_startup = 1

" Auto format code on save
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.md,*.html PrettierAsync
autocmd BufWritePre *.py :call CocAction('runCommand', 'editor.action.formatDocument')

" Configure cursor shapes for different modes
if exists('&t_SI')
  let &t_SI = "\e[5 q"      " Vertical bar cursor in insert mode
  let &t_SR = "\e[3 q"      " Underline cursor in replace mode
  let &t_EI = "\e[2 q"      " Block cursor in normal mode
endif

" Enable true color support
if exists('&termguicolors')
  set termguicolors
endif

