local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
keymap('n', '<leader>hh', "<C-w>h", opts)
keymap('n', '<leader>jj', "<C-w>j", opts)
keymap('n', '<leader>kk', "<C-w>k", opts)
keymap('n', '<leader>ll', "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<S-8>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<S-9>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-j>", ":m .+1<CR>==", opts)
keymap("v", "<S-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Telescope
keymap('n', '<leader>ff',"<cmd>Telescope find_files<cr>", opts)
keymap('n', '<leader>fg',"<cmd>Telescope live_grep<cr>", opts)
keymap('n', '<leader>fb',"<cmd>Telescope buffers<cr>", opts)
keymap('n', '<leader>fh',"<cmd>Telescope help_tags<cr>", opts)

-- NvimTree
keymap('n', '<leader>p',"<cmd>NvimTreeToggle<cr>", opts)
keymap('n', '<leader>r',"<cmd>NvimTreeRefresh<cr>", opts)
keymap('n', '<leader>n',"<cmd>NvimTreeFindFile<cr>", opts)

-- toggleterm
keymap('n', '<leader>gg', "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)

-- spectre
keymap('n', '<leader>sf', '<cmd>lua require("spectre").open()<cr>', opts)
keymap('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<cr>', opts)
keymap('v', '<leader>s', '<cmd>lua require("spectre").open_visual()<cr>', opts)
keymap('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search()<cr>', opts)

-- vimux
keymap('n', '<leader>vp', '<cmd>VimuxPromptCommand<cr>', opts)
keymap('n', '<leader>vl', '<cmd>VimuxRunLastCommand<cr>', opts)
keymap('n', '<leader>vi', '<cmd>VimuxInspectRunner<cr>', opts)
keymap('n', '<leader>vz', '<cmd>VimuxZoomRunner<cr>', opts)
