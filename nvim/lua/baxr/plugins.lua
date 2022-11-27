-- NOTE: You need to install packer for the plugins
local fn = vim.fn

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
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
return require('packer').startup(function(use)
    -- packer is required
    use 'wbthomason/packer.nvim'

    -- actual plugins
    -- required (?) plugins
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim" 

    -- colorscheme
    use 'folke/tokyonight.nvim'
end)
