-- バッファを切り替えた時にそのバッファのファイルのプロジェクトルートに移動する
-- .git以外にも対応したい場合は例として
-- local root = vim.fs.root(file, {
--   ".git",
--   "lazy-lock.json",
--   "package.json",
--   "Cargo.toml",
--   ".obsidian",
-- })
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)

    if file == "" then
      return
    end

    local root = vim.fs.root(file, { ".git" })

    if root then
      vim.cmd.lcd(root)
    end
  end,
})
