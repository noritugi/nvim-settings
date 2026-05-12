--
-- Neovide用の設定ファイル
--
-- クリップボード
vim.keymap.set({ "n", "x" }, "<C-S-C>", '"+y', { desc = "システムのクリップボードをコピー" })
vim.keymap.set({ "n", "x" }, "<C-S-V>", '"+p', { desc = "システムのクリップボードをペースト" })
-- フォント
vim.o.guifont = "HackGen Console NF:h12"
