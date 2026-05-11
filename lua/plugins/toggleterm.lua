return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "float",
      start_in_insert = true,
      persist_mode = true,
    },
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<CR>", desc = "Terminal" },
    },
  },
}
