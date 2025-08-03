vim.cmd(':command! Q :q')
vim.cmd(':command! W :w')
vim.cmd(':command! Qw :wq')
vim.cmd(':command! QW :wq')
vim.cmd(':command! Wq :wq')
vim.cmd(':command! WQ :wq')
vim.cmd(':command! Qa :qa')
vim.cmd(':command! QA :qa')



vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n"}, "<leader>pa", ":!pre-commit run --all-files<CR>")
vim.keymap.set({"n"}, "<leader>pd", ":!pre-commit run --files $(git ls-files -m)<CR>")
