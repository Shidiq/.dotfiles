syntax on

call plug#begin('~/.config/nvim/plugged')

" general
Plug 'joshdick/onedark.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'preservim/tagbar'
Plug 'windwp/nvim-autopairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'akinsho/bufferline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'nacro90/numb.nvim'
Plug 'windwp/nvim-spectre'
Plug 'preservim/vimux'

" telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" git
Plug 'lewis6991/gitsigns.nvim'

" file manager
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/toggleterm.nvim'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'ojroques/nvim-lspfuzzy'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'romgrk/nvim-treesitter-context'
Plug 'mhartington/formatter.nvim'
Plug 'p00f/nvim-ts-rainbow'

call plug#end()

lua require ('user')

nmap <silent> <F8> :TagbarToggle<CR>
nmap <silent> <F9> :FormatWrite<CR>

map <C-d> <Nop>

:colorscheme onedark
