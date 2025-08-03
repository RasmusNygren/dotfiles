local lsp = require('lsp-zero')

vim.g['conjure#filetypes'] = {'clojure'}


lsp.preset("recommended")

lsp.ensure_installed({
    'rust_analyzer',
    'lua_ls',
})

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
})

local custom_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, opts)
end

lsp.on_attach(custom_attach)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').gopls.setup{
    settings = {
        gopls = {
            gofumpt = true,
            env = {
                GOFLAGS = "-tags=linux,integration"
            }
        }
    }
}

lsp.setup()


require('luasnip.loaders.from_vscode').lazy_load()
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require('cmp')
local cmp_action = require('lsp-zero.cmp').action()

cmp.setup({
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp_action.toggle_completion(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
})

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
    ensure_installed = {
        'python',
        'lua',
        'go',
        'rust',
        'clojure'
    }
}
