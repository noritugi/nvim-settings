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

      sources = {
        default = {
          "path",
          "lsp",
          "snippets",
          "buffer",
        },
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
