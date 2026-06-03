return {
  "mrjones2014/smart-splits.nvim",
  opts = {},
  keys = {
    -- resizing splits
    { "<A-h>", function() require("smart-splits").resize_left() end, desc = "Resize Left" },
    { "<A-j>", function() require("smart-splits").resize_down() end, desc = "Resize Down" },
    { "<A-k>", function() require("smart-splits").resize_up() end, desc = "Resize Up" },
    { "<A-l>", function() require("smart-splits").resize_right() end, desc = "Resize Right" },

    -- moving between splits
    { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move Left" },
    { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move Down" },
    { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move Up" },
    { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move Right" },
    { "<C-\\>", function() require("smart-splits").move_cursor_previous() end, desc = "Move Previous" },

    -- swapping buffers
    {
      "<leader><leader>h",
      function() require("smart-splits").swap_buf_left() end,
      desc = "Swap Buffer Left",
    },
    {
      "<leader><leader>j",
      function() require("smart-splits").swap_buf_down() end,
      desc = "Swap Buffer Down",
    },
    {
      "<leader><leader>k",
      function() require("smart-splits").swap_buf_up() end,
      desc = "Swap Buffer Up",
    },
    {
      "<leader><leader>l",
      function() require("smart-splits").swap_buf_right() end,
      desc = "Swap Buffer Right",
    },
  },
}
