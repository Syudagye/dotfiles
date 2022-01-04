--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "sonokai"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- custom buffer management keybinds
lvim.keys.normal_mode["<A-,>"] = ":BufferPrevious<CR>"
lvim.keys.normal_mode["<A-;>"] = ":BufferNext<CR>"
lvim.keys.normal_mode["<A-?>"] = ":BufferMovePrevious<CR>"
lvim.keys.normal_mode["<A-.>"] = ":BufferMoveNext<CR>"
lvim.keys.normal_mode["<A-c>"] = ":BufferClose<CR>"

-- lf startup
lvim.keys.normal_mode["<leader>E"] = ":Lf<CR>"

-- Plugins configuration 
lvim.builtin.dashboard.active = true

lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
lvim.lsp.automatic_servers_installation = false

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "shellcheck",
  },
  -- {
  --   exe = "codespell",
  -- },
}

-- Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

    -- colorschemes
  {'sainnhe/sonokai'},
  {'morhetz/gruvbox'},
  {'vim-scripts/wombat256.vim'},
  {'glepnir/oceanic-material'},

  -- Utilities
  {'ptzz/lf.vim'},
  {'voldikss/vim-floaterm'},
  {'liuchengxu/vista.vim'},
  {'chrisbra/Colorizer'},
  {'onsails/lspkind-nvim'},
  {'weilbith/nvim-code-action-menu'},

  -- Language specific
  {'saecki/crates.nvim'},
  {'rust-lang/rust.vim'},
  {'lervag/vimtex'},
  {'elkowar/yuck.vim'},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Additional configuration
vim.api.nvim_command("set guifont=iosevka:h10")
