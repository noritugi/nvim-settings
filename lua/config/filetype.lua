--
-- ファイルタイプの設定
--
-- 全般的なインデント幅、タブ幅の設定
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- filetype毎のインデント幅
-- https://qiita.com/321shoot/items/bf25a5312cd98e3bfe4f
local filetype_tabstop = {lua=2, markdown=2} -- filetype毎のインデント幅
local usrftcfg = vim.api.nvim_create_augroup("UserFileTypeConfig", { clear = true})
vim.api.nvim_create_autocmd("FileType", {
  group = usrftcfg,
  callback = function (args)
    local ftts = filetype_tabstop[args.match]
    if ftts then
      vim.bo.tabstop = ftts
      vim.bo.shiftwidth = ftts
    end
  end
})

-- PowerShell(.ps1) を開いた時、
-- BOM が無ければ UTF-8 with BOM に設定する
-- 保存はしない
local group = vim.api.nvim_create_augroup("PowerShellUtf8Bom", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = group,
  pattern = "*.ps1",
  callback = function(args)
    local buf = args.buf

    -- 既に BOM 付きなら何もしない
    if vim.bo[buf].bomb then
      return
    end

    -- UTF-8 with BOM に設定
    vim.bo[buf].fileencoding = "utf-8"
    vim.bo[buf].bomb = true

    -- buffer を変更済みにしない
    vim.bo[buf].modified = false
  end,
})
