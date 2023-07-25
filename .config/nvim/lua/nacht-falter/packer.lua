-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd [[ 
augroup packer_user_config
autocmd!
autocmd BufWritePost packer.lua source <afile> | PackerSync
augroup end
]]

-- import packer safely
local status, packer = pcall(require, 'packer')
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
  } -- fuzzy finder

  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd 'colorscheme rose-pine'
    end,
  } -- colorscheme

  -- treesitter (syntax highlighting) configuration
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update { with_sync = true }
      ts_update()
    end,
  }

  use 'theprimeagen/harpoon' -- quick file switcher

  use 'mbbill/undotree' -- advanced undo history functions

  -- git functions
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-sleuth'

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'williamboman/mason.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      -- Snippet Collection (Optional)
      { 'rafamadriz/friendly-snippets' },
    },
  } -- LSP

  -- Pictogramms
  use 'onsails/lspkind.nvim'

  -- Useful status updates for LSP
  use { 'j-hui/fidget.nvim', opts = {} }

  -- Additional lua configuration
  use 'folke/neodev.nvim'

  -- Useful plugin to show you pending keybinds.
  use {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  } -- diagnostics

  use 'christoomey/vim-tmux-navigator' -- tmux & split window navigation

  use 'szw/vim-maximizer' -- maximizes and restores current window

  use 'numToStr/Comment.nvim'

  use 'tpope/vim-surround' -- add, delete, change surroundings (it's awesome)

  use 'nvim-tree/nvim-tree.lua'

  use 'nvim-tree/nvim-web-devicons'

  use 'nvim-lualine/lualine.nvim'

  use { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  }

  -- formatting & linting
  use 'jose-elias-alvarez/null-ls.nvim' -- configure formatters & linters
  use 'jayp0521/mason-null-ls.nvim' -- bridges gap b/w mason & null-ls

  -- auto closing
  use 'windwp/nvim-autopairs' -- autoclose parens, brackets, quotes, etc...
  use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' } -- autoclose tags

  -- git integration
  use 'lewis6991/gitsigns.nvim' -- show line modifications on left hand side

  if packer_bootstrap then
    require('packer').sync()
  end
end)
