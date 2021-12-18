set number
set linebreak
set relativenumber
set title
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
set scrolloff=8
set noshowmode
set completeopt=menu,menuone,noselect
set signcolumn=yes
set autoread
set clipboard=unnamedplus
set cursorline
set hidden
set shortmess+=c
set mouse=nv
set guifont=iosevka:h10
set smartindent

let mapleader = " "
let g:neovide_transparency=0.8


""" Plugins

call plug#begin()

    """ Colorschemes
    Plug 'sainnhe/sonokai' " the best for now
    Plug 'morhetz/gruvbox'
    Plug 'vim-scripts/wombat256.vim' " Strings in italic
    Plug 'glepnir/oceanic-material' " very nice

    """ Utilities
    Plug 'ptzz/lf.vim'
    Plug 'voldikss/vim-floaterm'

    Plug 'liuchengxu/vim-which-key'

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'liuchengxu/vista.vim'

    Plug 'akinsho/toggleterm.nvim'

    Plug 'chrisbra/Colorizer'

    Plug 'mhinz/vim-startify'

    """ LSP and completion
    Plug 'neovim/nvim-lspconfig'
    "Plug 'glepnir/lspsaga.nvim'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'onsails/lspkind-nvim'
    Plug 'weilbith/nvim-code-action-menu'
    Plug 'jiangmiao/auto-pairs'

    Plug 'kosayoda/nvim-lightbulb' " Not working ;w;

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    """ Language specific
    " Rust
    Plug 'nvim-lua/plenary.nvim'
    Plug 'saecki/crates.nvim'
    Plug 'rust-lang/rust.vim'

    let g:rustfmt_autosave = 1
    let g:rustfmt_emit_files = 1
    let g:rustfmt_fail_silently = 0

    " LaTeX
    Plug 'lervag/vimtex'

    " Yuck
    Plug 'elkowar/yuck.vim'
    """ For later
    "nvim-lua/lsp-status.nvim

call plug#end()


""" Colorscheme 

colorscheme sonokai
"colorscheme gruvbox
"colorscheme wombat256mod
"colorscheme oceanic_material
set termguicolors
hi Normal guibg=NONE
hi SignColumn guibg=NONE
hi LineNr guibg=NONE
hi EndOfBuffer guibg=NONE
" For lf to not have gray line around, breaks cmp documentation displaying
"hi NormalFloat guibg=NONE
hi StatusLine guibg=NONE


""" Lua configurations

luafile $HOME/.config/nvim/lsp.lua
luafile $HOME/.config/nvim/cmp.lua
luafile $HOME/.config/nvim/treesitter.lua
luafile $HOME/.config/nvim/toggleterm.lua


""" vsnip config

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)


""" VimTeX
filetype plugin indent on
let g:vimtex_view_method = 'zathura'
let maplocalleader = ','


""" Keybinds

"" Barbar
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-;> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-?> :BufferMovePrevious<CR>
nnoremap <silent>    <A-.> :BufferMoveNext<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>

"" WhichKey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"" lf
nnoremap <leader>lf :Lf<cr>

"" Vista
nnoremap <leader>v :Vista<cr>
