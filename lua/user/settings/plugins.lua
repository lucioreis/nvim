local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- Have packer manage itself
  use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }) -- An implementation of the Popup API from vim in Neovim
  use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used ny lots of plugins
  use({ "windwp/nvim-autopairs", commit = "4a95b3982be7397cd8e1370d1a09503f9b002dbf" }) -- Autopairs, integrates with both cmp and treesitter
  use({ "kyazdani42/nvim-web-devicons", commit = "9061e2d355ecaa2b588b71a35e7a11358a7e51e1" })
  use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
  use({ "nvim-lualine/lualine.nvim", commit = "5113cdb32f9d9588a2b56de6d1df6e33b06a554a" })
  use({ "akinsho/toggleterm.nvim", commit = "8f2e78d0256eba4896c8514aa150e41e63f7d5b2" })
  use({ "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" })
  use({ "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" })
  use({ "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" })
  use({ "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" })
  use({ "antoinemadec/FixCursorHold.nvim", commit = "1bfb32e7ba1344925ad815cb0d7f901dbc0ff7c1" }) -- This is needed to fix lsp doc highlight
  use({ "folke/which-key.nvim", commit = "6885b669523ff4238de99a7c653d47b081b5506d" })
  use({ "phaazon/hop.nvim", commit = "a3cf6684bcb9fc974609ae81424f285f05280d90" })
  use({ "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" })
  use({ "p00f/nvim-ts-rainbow", commit = "1ec3f880585c644ddd50a51502c59f4e36f03e62" })
  use({ "windwp/nvim-ts-autotag", commit = "fdefe46c6807441460f11f11a167a2baf8e4534b" })
  use({ "j-hui/fidget.nvim", commit = "2cf9997d3bde2323a1a0934826ec553423005a26" })
  --use({ "windwp/nvim-ts-autotag", commit = "0339338316c7e0d62b03191d81cc68ca8101fc02" })
  use({ "ThePrimeagen/harpoon", commit = "f4aff5bf9b512f5a85fe20eb1dcf4a87e512d971" })
  use({ "drybalka/tree-climber.nvim", commit = "9c943b85f44d3064e8f42ee8b3aacad3959a5a75" })
  -- match-up is a plugin that lets you highlight, navigate, and operate on sets
  -- of matching text. It extends vim's % key to language-specific words instead of
  --just single characters.
  use({ "andymass/vim-matchup", commit = "3fa1b2283e957784922fe891de361a2342b90bca" })
  use({ "karb94/neoscroll.nvim", commit = "71c8fadd60362383e5e817e95f64776f5e2737d8" })
  use({ "nacro90/numb.nvim", commit = "453c50ab921fa066fb073d2fd0f826cb036eaf7b" })
  use({ "tversteeg/registers.nvim", commit = "f354159d34bc17553ad772c633fd7caff8ecb35c" })
  use({ "filipdutescu/renamer.nvim", commit = "4a4707992a79f481f4882bab9b3823ac6455c942" })
  use({ "Shatur/neovim-session-manager", commit = "4f9129a6fd80dc0a5111349bfb447ff243c7d504" })
  use({ "tpope/vim-surround", commit = "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea" })
  use({ "stevearc/dressing.nvim", commit = "af179837e1cdddfb164f0296883951b2255c46d2" })
  use({ "simrat39/symbols-outline.nvim", commit = "15ae99c27360ab42e931be127d130611375307d5" })
  use({ "lunarvim/horizon.nvim", commit = "0a2b44d9a8debfbefb104b58635e689c88be6848" })
  use("nathom/filetype.nvim")
  --[[ use('Maan2003/lsp_lines.nvim') -- is a simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code. ]]
  use({ "TimUntersberger/neogit",
    requires = "sindrets/diffview.nvim",
    commit = "66030fc1c3b7b6d5bc31ece188bc472ee2d91ee1" })
  use("folke/neodev.nvim") -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
  use({ "folke/noice.nvim" }) -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    commit = "da61737d860ddc12f78e638152834487eabf0ee5",
  })
  -- cmp plugins
  use({ "RRethy/vim-illuminate" })

  -- snippets
  use({ "L3MON4D3/LuaSnip" }) --snippet engine
  use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

  -- LSP
  use({ "jose-elias-alvarez/null-ls.nvim", commit = "c51978f546a86a653f4a492b86313f4616412cec" }) -- for formatters and linters
  use({ 'MunifTanjim/prettier.nvim', commit = "918b99f5ddd7a56395fd393767ab6a3c15a50789" })
  use({
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' }, -- cmdline completions
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "saadparwaiz1/cmp_luasnip" } -- snippet completions

    }
  })

  -- DAP
  use({ "mfussenegger/nvim-dap", commit = "0b320f5bd4e5f81e8376f9d9681b5c4ee4483c25" })
  use({ "rcarriga/nvim-dap-ui", commit = "c8ce83a66deb0ca6f5af5a9f9d5fcc05a6d0f66b" })
  use({ "theHamsta/nvim-dap-virtual-text", commit = "2971ce3e89b1711cc26e27f73d3f854b559a77d4" })

  -- Telescope
  use({ "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" })
  use({ "nvim-telescope/telescope-dap.nvim", commit = "b4134fff5cbaf3b876e6011212ed60646e56f060" })
  use({ 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make' })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    commit = "c6a5a412831a967acda8f45072763e2783e9505b"
  })
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" })
  use({ "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" })

  -- Git
  use({ "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" })

  -- Neo-Tree
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  })

  use({
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    commit = "a864a79c8e024d4f5d95915210188c9c3430b160",
  })

  use({ "mbbill/undotree", commit = "bd60cb564e3c3220b35293679669bb77af5f389d" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
