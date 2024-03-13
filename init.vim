call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'wesQ3/vim-windowswap'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'kyazdani42/nvim-web-devicons' "for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'chaoren/vim-wordmotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '*' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'salkin-mada/openscad.nvim'
Plug 'trunk-io/neovim-trunk', { 'tag': '*' }
Plug 'neovim/nvim-lspconfig'

call plug#end()

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Because it takes like 4 commands to get shit going
command! Updoom so $MYVIMRC | PlugClean | PlugUpdate | CocUpdate

"
" Theme
"
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme gruvbox
set number


"
" general keybindings
"
let mapleader = " "

" Save aliases
command W w
" Not sure why these won't work
"command ц w
"command Ц w

" Russian remapping
nnoremap ё `
nnoremap й q
nnoremap ц w
nnoremap у e
nnoremap к r
nnoremap е t
nnoremap н y
nnoremap нн yy
nnoremap г u
nnoremap ш i
nnoremap щ o
nnoremap з p
nnoremap зз pp
nnoremap х [
nnoremap ъ ]
nnoremap ф a
nnoremap ы s
nnoremap в d
nnoremap вв dd
nnoremap а f
nnoremap п g
nnoremap р h
nnoremap о j
nnoremap л k
nnoremap д l
nnoremap ж ;
nnoremap э '
nnoremap я z
nnoremap ч x
nnoremap с c
nnoremap м v
nnoremap и b
nnoremap т n
nnoremap ь m
nnoremap б ,
nnoremap ю .

nnoremap Ё ~
nnoremap № #
nnoremap Й Q
nnoremap Ц W
nnoremap У E
nnoremap К R
nnoremap Е T
nnoremap Н Y
nnoremap Г U
nnoremap Ш I
nnoremap Щ O
nnoremap З P
nnoremap Х {
nnoremap Ъ }
nnoremap Ф A
nnoremap Ы S
nnoremap В D
nnoremap А F
nnoremap П G
nnoremap Р H
nnoremap О J
nnoremap Л K
nnoremap Д L
nnoremap Ж :
nnoremap Э "
nnoremap Я Z
nnoremap Ч X
nnoremap С C
nnoremap М V
nnoremap И B
nnoremap Т N
nnoremap Ь M
nnoremap Б <
nnoremap Ю >

" buffer navigation
nmap <silent> <Leader>b :bnext<CR>
nmap <silent> <Leader>B :bprev<CR>
nmap <silent> <Leader>qb :bp <BAR> bd #<CR>
nmap <silent> <Leader>lb :ls<CR>

nmap <silent> <Leader>и :bnext<CR>
nmap <silent> <Leader>И :bprev<CR>
nmap <silent> <Leader>йи :bp <BAR> ив #<CR>
nmap <silent> <Leader>ди :ls<CR>

" for vim-test
nmap <silent> <Leader>n :TestNearest<CR>
nmap <silent> <Leader>f :TestFile<CR>
nmap <silent> <Leader>s :TestSuite<CR>
nmap <silent> <Leader>l :TestLast<CR>
nmap <silent> <Leader>g :TestVisit<CR>

" So I don't get fucked when I accidentally hit Ctrl-z
nnoremap <c-z> <nop>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

tnoremap <A-р> <C-\><C-т><C-ц>р
tnoremap <A-о> <C-\><C-т><C-ц>о
tnoremap <A-л> <C-\><C-т><C-ц>л
tnoremap <A-д> <C-\><C-т><C-ц>д
nnoremap <A-р> <C-ц>р
nnoremap <A-о> <C-ц>о
nnoremap <A-л> <C-ц>л
nnoremap <A-д> <C-ц>д

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'right': [ [ 'paste' ],
      \             [ 'readonly', 'modified', 'cocstat', 'cocfunc' ] ]
      \ },
      \ 'component': {
      \   'cocstat': '%{coc#status()}',
      \   'cocfunc': '%{get(b:,"coc_current_function")}',
      \ },
      \ }
"
" coc
"
let g:coc_global_extensions = ['coc-yaml', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-rust-analyzer', 'coc-pyright', 'coc-eslint', 'coc-tslint-plugin', 'coc-tsserver', 'coc-vetur', 'coc-split-term', 'coc-fish']

"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

inoremap <silent><expr> <C-space> coc#refresh()

"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename) 

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
noremap <leader>t :tabnew<cr>
noremap <leader>е :tabnew<cr>

"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>

nnoremap <leader>cl :CocDiagnostics<cr>
nnoremap <leader>cf :CocFix<cr>
nnoremap <leader>ch :call CocAction('doHover')<cr>


"
" integrated terminal stuff
"
set splitbelow

" Toggle the terminal with Ctrl-k
nmap <silent> <C-k> <Plug>(coc-split-term-show)
imap <C-k> <Esc><Plug>(coc-split-term-show)<CR>
tmap <silent> <C-k> <C-\><C-n><Plug>(coc-split-term-hide)

" turn terminal to normal mode with escape
" tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif


" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-з> <cmd>Telescope find_files<cr>
nnoremap <C-а> <cmd>Telescope live_grep<cr>
nnoremap <leader>аа <cmd>Telescope find_files<cr>
nnoremap <leader>ап <cmd>Telescope live_grep<cr>
nnoremap <leader>аи <cmd>Telescope buffers<cr>
nnoremap <leader>ар <cmd>Telescope help_tags<cr>

"
" nerdcommenter stuff
"
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'openscad': { 'left': '//', 'right': '' } }



" Toggle sidebar
nmap <silent> <C-b> :NvimTreeOpen<CR>
nmap <silent> <leader><C-b> :NvimTreeFindFile<CR>

nmap <silent> <C-и> :NvimTreeOpen<CR>
nmap <silent> <leader><C-и> :NvimTreeFindFile<CR>



" Enable the mouse to help adjust split sizes
set mouse=n

" Allow copying to the system clipboard
set clipboard=unnamedplus

set hidden
" set switchbuf=useopen,usetab

" Custom filetypes
au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
au BufNewFile,BufRead *.svelte set filetype=html


inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab

luafile $HOME/.config/nvim/plugins.lua
