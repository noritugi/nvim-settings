--
-- ダーク、ライトテーマをトグル設定できるようにする。
--
local M = {}

-- 好きなテーマをここで指定
M.dark_theme = "tokyonight"
M.light_theme = "tokyonight-day"

-- 現在状態を保持（初期値）
M.is_dark = true

function M.apply()
  if M.is_dark then
    vim.o.background = "dark"
    vim.cmd.colorscheme(M.dark_theme)
  else
    vim.o.background = "light"
    vim.cmd.colorscheme(M.light_theme)
  end
end

function M.toggle()
  M.is_dark = not M.is_dark
  M.apply()
end

return M
