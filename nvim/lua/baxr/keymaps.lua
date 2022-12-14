local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- local keymap = 

-- leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL mode keymaps
-- navigate windows with ctrl + h/j/k/l
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<cr>", opts)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})

-- navigate buffers with shift + h/l
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- toggle term
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', opts)
function _G.set_terminal_keymaps()
  local term_opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], term_opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], term_opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- INSERT mode keymaps

-- VISUAL mode keymaps
-- stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

-- better paste if you have yanked something
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

-- VISUAL BLOCK mode keymaps
-- move text up and down
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
