-- NOTE: You need to install pac"er for the plugins
local fn = vim.fn

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}


-- Plugins go here
return require("packer").startup(function(use)
    -- packer is required
    use "wbthomason/packer.nvim"

    -- actual plugins
    -- plugins other plugins depend on
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    -- colorscheme
    use "folke/tokyonight.nvim"

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-nvim-lsp" -- lsp autocomplete

    -- snippets
    use "L3MON4D3/LuaSnip" -- snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- lsp
    use "williamboman/mason.nvim" -- lsp manager
    use "williamboman/mason-lspconfig.nvim" -- lsp config for mason
    use "neovim/nvim-lspconfig" -- configurations for Nvim LSP

    -- comment
    use "tpope/vim-commentary" -- use "gcc"/"gc" with selection to comment line(s)

    -- telescope
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    -- treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- utils
    use { "windwp/nvim-autopairs", config = function()
        require("nvim-autopairs").setup {}
    end }
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly" -- optional, updated every week. (see issue #1193)
    }
    use "lewis6991/gitsigns.nvim"
end)
