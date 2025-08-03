local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.autoread = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.swapfile = false
opt.ignorecase = true
opt.smartcase = true
opt.ruler = true


vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.markdown_fenced_languages = {
	"ts=typescript"
}

opt.background = "dark"

require('plugins')

require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    operators = true,
    comments = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

vim.cmd([[ colorscheme gruvbox ]])


require('lsp')
require('keymaps')
require('telescope-config')
require('luasnip.loaders.from_lua').load({ paths = "./snippets" })
