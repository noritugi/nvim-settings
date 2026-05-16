--
-- Neovide用の設定ファイル
--
-- クリップボードとCtrl-Sで保存
local function save() vim.cmd.write() end
local function copy() vim.cmd([[normal! "+y]]) end
local function paste() vim.api.nvim_paste(vim.fn.getreg("+"), true, -1) end
vim.keymap.set({ "n", "i", "v" }, "<C-s>", save, { desc = "Save" })
vim.keymap.set("v", "<C-c>", copy, { silent = true, desc = "Copy" })
vim.keymap.set({ "n", "i", "v", "c", "t" }, "<C-v>", paste, { silent = true, desc = "Paste" })
-- フォント
vim.o.guifont = "HackGen Console NF:h12"
