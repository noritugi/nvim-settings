--
-- キーマップの設定
--
-- ダーク、ライトテーマのトグル
local colors = require("config.colorscheme")
-- 初期適用
colors.apply()
-- トグル
vim.keymap.set("n", "<leader>ut", function()
  colors.toggle()
end, { desc = "Toggle light/dark theme" })
-- skkeleton起動
vim.keymap.set({ "i", "c" }, "<C-j>", "<Plug>(skkeleton-enable)")
-- 中ボタンクリックでペーストを無効化
vim.keymap.set({ "n", "i", "v", "x", "s", "o" }, "<MiddleMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v", "x", "s", "o" }, "<2-MiddleMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v", "x", "s", "o" }, "<3-MiddleMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v", "x", "s", "o" }, "<4-MiddleMouse>", "<Nop>")
