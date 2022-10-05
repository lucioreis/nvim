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
  use({ "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }) -- Easily comment stuff
  use({ "kyazdani42/nvim-web-devicons", commit = "a8cf88cbdb5c58e2b658e179c4b2aa997479b3da" })
  use({ "akinsho/bufferline.nvim", commit = "88c742f4af988c98aee5ac1c92f056905c636aae" })
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
  use({ "p00f/nvim-ts-rainbow", commit = "837167f63445821c55e6eed9dbdac1b0b29afa92" })
  use({ "windwp/nvim-ts-autotag", commit = "0339338316c7e0d62b03191d81cc68ca8101fc02" })
  use({ "ThePrimeagen/harpoon", commit = "d3d3d22b6207f46f8ca64946f4d781e975aec0fc" })
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

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    commit = "da61737d860ddc12f78e638152834487eabf0ee5",
  })
  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use({ "lunarvim/darkplus.nvim", commit = "fe67a1a1663e65ac4fbd3e9a18874d6990a4f6e5" })
  -- cmp plugins
  use({ "hrsh7th/nvim-cmp", commit = "0e65333c7fdc284d53a489ed2cef7219289ea0fe" }) -- The completion plugin
  use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
  use({ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }) -- path completions
  use({ "hrsh7th/cmp-cmdline", commit = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252" }) -- cmdline completions
  use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp"})
  use({ "hrsh7th/cmp-nvim-lua"})
  use({ "RRethy/vim-illuminate", commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5" })

  -- snippets
  use({ "L3MON4D3/LuaSnip", commit = "96433350b55794977d1794913b28417550dd1601" }) --snippet engine
  use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- a bunch of snippets to use

  -- LSP
  use({ "williamboman/mason.nvim", commit = "45606b0e9b01a1565bfc8b57a52ec04f58f5f295" })
  use({ "williamboman/mason-lspconfig.nvim", commit = "b364c98644b53e351d27313dfdab809df7fde1d3" })
  use({ "neovim/nvim-lspconfig", commit = "fc2f44dc6024bddb75b82e471c642ad1f4483094" }) -- enable LSP
  use({ "williamboman/nvim-lsp-installer", commit = "23820a878a5c2415bfd3b971d1fe3c79e4dd6763" }) -- simple to use language server installer
  use({ "tamago324/nlsp-settings.nvim", commit = "5c3a63fb88eaed15b62e8159ca67fd1d208fbdd0" }) -- language server settings defined in json for
  use({ "jose-elias-alvarez/null-ls.nvim", commit = "c333ecce37ee5f096f17754901e4ec4827041166" }) -- for formatters and linters
  use({ "ray-x/lsp_signature.nvim", commit = "e65a63858771db3f086c8d904ff5f80705fd962b" })
  use({ 'MunifTanjim/prettier.nvim', commit = "f27e94f81c9cd5b0925bf46eabb5570c832bd6a7" })

  -- DAP
  use({ "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" })
  use({ "rcarriga/nvim-dap-ui", commit = "52f4840cb95e6638f18a74b71b536c3bd12e9fd8" })
  use({ "theHamsta/nvim-dap-virtual-text", commit = "10368a11d175633f00ee6afb49708e42ae70ae7d" })
  use({ "nvim-telescope/telescope-dap.nvim", commit = "b4134fff5cbaf3b876e6011212ed60646e56f060" })

  -- Telescope
  use({ "nvim-telescope/telescope.nvim", tag = "0.1.0", commit = "6bddc38c25af7b50f99cb0c035248d7272971810" })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" })

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
    commit = "c552119ff0c81ff55c8d7900e618612c05d9192e",
  })

  -- Elixir
  use({
    "mhanberg/elixir.nvim",
    requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" },
    commit = "3327e15ff46028ef01aa9d908224779c60012687",
  })

  use({
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    commit = "a864a79c8e024d4f5d95915210188c9c3430b160",
  })

  use("MattesGroeger/vim-bookmarks")

  use({
    "crusj/bookmarks.nvim",
    branch = "main",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
