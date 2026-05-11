return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      { "<leader>zn", "<cmd>Telekasten new_note<cr>" },
      { "<leader>zf", "<cmd>Telekasten find_notes<cr>" },
    },
  },
}
