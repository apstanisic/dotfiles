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

	-- theme
	vim.cmd[[colorscheme gruvbox]]
	-- tab width 4
	vim.opt.tabstop = 4
	vim.opt.softtabstop = 4
	vim.opt.shiftwidth = 4
    -- convert tab to space
    vim.opt.expandtab = true
    -- indent based on code
    vim.opt.smartindent = true
    -- show line number
    vim.opt.nu = true
    -- show relative
    vim.opt.relativenumber = true
    -- Maybe, it's annoying
    -- vim.opt.swapfile = false
    -- It moves to best match as you type, no need for enter
    vim.opt.incsearch = true
    -- removes highlight on all found items, since it remains after search
    vim.opt.hlsearch = false

	-- nvim-tree recommends
    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1

	-- setup sidebar
    require("nvim-tree").setup()
	-- setup status bar
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
    -- format
    use 'sbdchd/neoformat'


    -- required for telescope
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-lua/plenary.nvim'
    -- ctrl+p for neovim
    use 'nvim-telescope/telescope.nvim'
    -- syntax for nix
    use 'LnL7/vim-nix'


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

