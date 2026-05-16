return {
  --------------------------------------------------------------------------
  -- Telescope
  --------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",

    dependencies = {
      "nvim-lua/plenary.nvim",

      ----------------------------------------------------------------------
      -- Telescope extensions
      ----------------------------------------------------------------------
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      -- telescope zoxide
      "jvgrootveld/telescope-zoxide",

      ----------------------------------------------------------------------
      -- fzf native
      ----------------------------------------------------------------------
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },

    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "smart" },

          -- 検索除外するファイル
          -- Windows環境は"/"ではなく"\\"
          -- https://github.com/AstroNvim/AstroNvim/issues/184#issuecomment-1896421457
          file_ignore_patterns = {
            -- Files
            "%.a",
            "%.class",
            "%.jpg",
            "%.jpeg",
            "%.JPG",
            "%.png",
            "%.PNG",
            "%.webp",
            "%.WEBP",
            "%.ico",
            "%.mkv",
            "%.mp4",
            "%.o",
            "%.out",
            "%.pdf",
            "%.zip",
            -- Directories
            ".cache",
            ".git\\",
            ".github\\",
            ".node_modules\\",
          },

          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },

        pickers = {
          find_files = {
            hidden = true,
          },
        },

        extensions = {
          ------------------------------------------------------------------
          -- fzf
          ------------------------------------------------------------------
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },

          ------------------------------------------------------------------
          -- project
          ------------------------------------------------------------------
          project = {
            base_dirs = {
              "~/projects",
              "~/work",
              "~/.config",
            },

            hidden_files = true,

            theme = "dropdown",

            order_by = "asc",

            sync_with_nvim_tree = false,
          },

          ------------------------------------------------------------------
          -- file browser
          ------------------------------------------------------------------
          file_browser = {
            theme = "dropdown",

            hijack_netrw = true,

            hidden = true,
            grouped = true,

            previewer = false,

            initial_mode = "normal",

            layout_config = {
              height = 40,
            },
          },
        },
      })

      ----------------------------------------------------------------------
      -- extensions load
      ----------------------------------------------------------------------
      telescope.load_extension("fzf")
      telescope.load_extension("project")
      telescope.load_extension("file_browser")
      telescope.load_extension("zoxide")

      ----------------------------------------------------------------------
      -- keymaps
      ----------------------------------------------------------------------

      -- find files
      vim.keymap.set("n", "<leader>ff", function()
        require("telescope.builtin").find_files()
      end, {
        desc = "Find files",
      })

      -- grep
      vim.keymap.set("n", "<leader>fg", function()
        require("telescope.builtin").live_grep()
      end, {
        desc = "Live grep",
      })

      -- buffers
      vim.keymap.set("n", "<leader>fb", function()
        require("telescope.builtin").buffers()
      end, {
        desc = "Buffers",
      })

      -- recent files
      vim.keymap.set("n", "<leader>fr", function()
        require("telescope.builtin").oldfiles()
      end, {
        desc = "Recent files",
      })

      ----------------------------------------------------------------------
      -- project
      ----------------------------------------------------------------------
      vim.keymap.set("n", "<leader>fp", function()
        telescope.extensions.project.project({})
      end, {
        desc = "Projects",
      })

      ----------------------------------------------------------------------
      -- file browser
      ----------------------------------------------------------------------
      vim.keymap.set("n", "<leader>fe", function()
        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          select_buffer = true,
        })
      end, {
        desc = "File browser",
      })

      vim.keymap.set("n", "<leader>fE", function()
        telescope.extensions.file_browser.file_browser({
          path = vim.loop.cwd(),
        })
      end, {
        desc = "File browser cwd",
      })

      vim.keymap.set("n", "<leader>fz", function()
        require("telescope").extensions.zoxide.list()
      end, {
        desc = "Zoxide",
      })

      ----------------------------------------------------------------------
      -- TelescopePromptでskkeleton入力
      ----------------------------------------------------------------------
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "TelescopePrompt",
        callback = function()
          -- insert mode に入ったら <C-j>でskkeleton ON
          vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-toggle)", {
            buffer = true,
          })
          -- Telescopeを開いた瞬間に有効化したい場合
          -- vim.fn["skkeleton#enable"]()
        end,
      })
    end,
  },

  --------------------------------------------------------------------------
  -- auto-session
  --------------------------------------------------------------------------
  {
    "rmagatti/auto-session",

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

  --------------------------------------------------------------------------
  -- zoxide
  --------------------------------------------------------------------------
  -- {
  --   "nanotee/zoxide.vim",
  --
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --
  --   keys = {
  --     {
  --       "<leader>fz",
  --       "<cmd>Telescope zoxide list<CR>",
  --       desc = "Zoxide",
  --     },
  --   },
  --
  --   config = function()
  --     ----------------------------------------------------------------------
  --     -- zoxide command exists check
  --     ----------------------------------------------------------------------
  --     if vim.fn.executable("zoxide") == 0 then
  --       vim.notify("zoxide command not found", vim.log.levels.WARN)
  --     end
  --   end,
  -- },
}
