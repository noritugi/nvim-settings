return {
  {
    "saghen/blink.cmp",
    version = "*",

    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },

    opts = {
      keymap = {
        preset = "default",

        -- ["<C-n>"] = { "select_next" },
	      -- ["<C-p>"] = { "select_prev" },

        ["<Tab>"] = {
	        "accept",
          "select_next",
          "snippet_forward",
          "fallback",
        },

        ["<S-Tab>"] = {
          "select_prev",
          "snippet_backward",
          "fallback",
        },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = {
          auto_show = true,
        },
      },

      snippets = {
        preset = "luasnip",
      },

      -- lazyvimだとsources.default = {} にしても無効にはならないらしい
      -- https://github.com/saghen/blink.cmp/discussions/613#discussioncomment-11631943
      sources = {
        per_filetype = {
          lua = { "lsp", "buffer", "path", "snippets" },
          markdown = { "lsp", "path", "snippets" },
        },
        transform_items = function(ctx, items)
          -- Remove the "Text" source from lsp autocomplete
          return vim.tbl_filter(function(item)
            return item.kind ~= vim.lsp.protocol.CompletionItemKind.Text
          end, items)
        end,
      },

      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },

    opts_extend = { "sources.default" },
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",

    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
