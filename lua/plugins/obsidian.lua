return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = "personal",
        -- path = "~/Documents/vaults/personal",
        path = vim.fn["expand"]('~/Documents/vault/personal'),
      },
      {
        name = "work",
        -- path = "~/Documents/vaults/work",
        path = vim.fn["expand"]('~/Documents/vault/work'),
      },
    },
  },
}
