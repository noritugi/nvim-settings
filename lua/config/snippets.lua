--
-- スニペットを置くディレクトリ
--
require("luasnip.loaders.from_lua").load({
  paths = {
    vim.fn.expand("~/.config/nvim/snippets"),
    vim.fn.expand("~/.config/local-snippets"),
  },
})
