-- vim.g.vsnip_snippet_dir = vim.fn.expand("~/.config/nvim/snippets")
require("config.lazy")
require("config.filetype")
require("config.keymaps")
require("config.colorscheme")
require("config.snippets")
require("config.shell")
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    require("config.neovide")
end
