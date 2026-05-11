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

