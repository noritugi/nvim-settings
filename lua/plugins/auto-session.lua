return {
  {
    "rmagatti/auto-session",
    enabled = false,

    lazy = false,

    opts = {
      auto_restore_enabled = true,

      post_restore_cmds = {
        function()
          vim.defer_fn(function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_buf_is_loaded(buf) then
                local name = vim.api.nvim_buf_get_name(buf)

                -- ファイルを持つ通常バッファのみ対象
                if name ~= "" then
                  vim.api.nvim_buf_call(buf, function()
                    vim.cmd("filetype detect")
                    vim.cmd("doautocmd BufRead")
                    vim.cmd("doautocmd BufEnter")
                  end)
                end
              end
            end
          end, 100)
        end,
      },

      auto_session_suppress_dirs = {
        "~/",
        "~/Downloads",
        "/",
      },

      session_lens = {
        load_on_setup = true,
      },
    },

    keys = {
      {
        "<leader>fs",
        "<cmd>AutoSession search<CR>",
        desc = "Search sessions",
      },

      {
        "<leader>fw",
        "<cmd>AutoSession save<CR>",
        desc = "Save session",
      },

      {
        "<leader>fW",
        "<cmd>AutoSession delete<CR>",
        desc = "Delete session",
      },
    },
  },
}
