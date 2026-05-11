return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- 共通設定
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      --------------------------------------------------
      -- Lua
      --------------------------------------------------
      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
      })
      vim.lsp.enable("lua_ls")

      --------------------------------------------------
      -- Python
      --------------------------------------------------
      vim.lsp.config("pyright", {
        on_attach = on_attach,
        capabilities = capabilities,
      })
      vim.lsp.enable("pyright")

      --------------------------------------------------
      -- TypeScript
      --------------------------------------------------
      vim.lsp.config("tsserver", {
        on_attach = on_attach,
        capabilities = capabilities,
      })
      vim.lsp.enable("tsserver")

      --------------------------------------------------
      -- Bash
      --------------------------------------------------
      vim.lsp.config("bashls", {
        on_attach = on_attach,
        capabilities = capabilities,
      })
      vim.lsp.enable("bashls")
    end,
  },
}
