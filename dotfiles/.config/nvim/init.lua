
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- this is separate since setting unknown color scheme throws an error
-- and that always happens before running packer sync
local setConfig = function()
  vim.cmd[[colorscheme gruvbox]]
  vim.opt.tabstop = 4

  vim.g.loaded = 1
  vim.g.loaded_netrwPlugin = 1

  require("nvim-tree").setup()
  require('lualine').setup()

end



return require('packer').startup(function(use)

	-- package manager manages itself
    use 'wbthomason/packer.nvim'
	-- theme
    use 'gruvbox-community/gruvbox'
	-- icons are needed for lualine and nvim-tree
    use 'kyazdani42/nvim-web-devicons'
	-- status bar
	use 'nvim-lualine/lualine.nvim'
	-- sidebar
	use 'kyazdani42/nvim-tree.lua'



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

  -- pcall catches errors
  -- setConfig should probably be in "after" folder,
  -- but i want to keep things in single file for now
  pcall(setConfig)

end)

