return {
  'nvim-treesitter/nvim-treesitter',
  -- 'neovim-treesitter/nvim-treesitter', -- ときどき見る
  branch = "main",
  event = { "BufReadPre", "BufNewFile" },
  build = ':TSUpdateSync',
  config = function()
    local ts = require('nvim-treesitter')

    ts.install({
      "astro",
      "css",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "hcl",
      "html",
      "javascript",
      "json",
      "json5",
      "markdown",
      "markdown_inline",
      "mermaid",
      "svelte",
      "terraform",
      "dockerfile",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "kotlin",
      "lua",
      "python",
      "rust",
      "tsx",
      "typescript",
      "vento",
      "vim",
      "vimdoc",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "vento",
      callback = function(args)
        vim.treesitter.start(args.buf)
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "astro", "yaml", "yaml.ansible" },
      callback = function(args)
        vim.treesitter.stop(args.buf)
      end,
    })
  end
}
