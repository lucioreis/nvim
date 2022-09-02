local opt = vim.opt

local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "Fira Code:h14",               -- the font used in graphical neovim applications
  laststatus = 3,
  -- spelllang = "ptbr",
  spell = false,
  showcmd = true,
}

opt.shortmess:append "c"
opt.formatoptions = opt.formatoptions
  - "a" -- turn off auto formatting of paragraphs
  - "t" -- Auto-wrap text using 'textwidth': nope
  + "c" -- Auto-wrap comments using 'textwidtAuto-wrap comments using 'textwidth': nope
  + "r" -- keep the comments going on enter
  - "o" -- Autpmatically insert the coment leader after hitting o: nope
  + "n" -- Make ident lists great again
  - "2" -- I could'n care less
  + "1" -- Don't brake a line after a one-letter word
  + "p" -- Don't break 'Mr.' and 'Feyman!'
  + "q"

for k, v in pairs(options) do
  opt[k] = v
end

local g = {
  do_filetype_lua = 1, -- use filetype.lua
  did_load_filetypes = 0, -- don't use filetype.vim
  highlighturl_enabled = true, -- highlight URLs by default
  mapleader = " ", -- set leader key
  zipPlugin = false, -- disable zip
  load_black = false, -- disable black
  loaded_2html_plugin = true, -- disable 2html
  loaded_getscript = true, -- disable getscript
  loaded_getscriptPlugin = true, -- disable getscript
  loaded_gzip = true, -- disable gzip
  loaded_logipat = true, -- disable logipat
  loaded_matchit = true, -- disable matchit
  loaded_netrwFileHandlers = true, -- disable netrw
  loaded_netrwPlugin = true, -- disable netrw
  loaded_netrwSettngs = true, -- disable netrw
  loaded_remote_plugins = true, -- disable remote plugins
  loaded_tar = true, -- disable tar
  loaded_tarPlugin = true, -- disable tar
  loaded_zip = true, -- disable zip
  loaded_zipPlugin = true, -- disable zip
  loaded_vimball = true, -- disable vimball
  loaded_vimballPlugin = true, -- disable vimball
  Illuminate_delay = 500, -- define Illuminate highlight delay(milliseconds)
}

for key, value in pairs(g) do
  vim.g[key] = value
end


vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
