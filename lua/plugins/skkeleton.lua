return {
  {
    "vim-skk/skkeleton",
    dependencies = {
      "vim-denops/denops.vim",
    },
    event = "InsertEnter",
    config = function()
      vim.fn["skkeleton#config"]({
        globalDictionaries = {
          vim.fn["expand"]('~/.skk/SKK-JISYO.L'),
        },
        userDictionary = vim.fn["expand"]('~/.skk/user/SKK-JISYO.user'),
        eggLikeNewline = true,
        registerConvertResult = true, 
        showCandidatesCount = 2,
        keepState = true,
      })
    end,
  },
}
