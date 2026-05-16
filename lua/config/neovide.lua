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
-- タイトルバー
vim.g.neovide_title_background_color = string.format(
    "%x",
    vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
)
vim.g.neovide_title_text_color = "pink"
-- ウィンドウコーナー処理
vim.g.neovide_corner_preference = "round"
-- skkeletonを使うためIMEはオフ
vim.g.neovide_input_ime = false
