local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    { trig = "uni", name = "Pleromaメディアリンク", desc = "メディアリンクを生成するショートコード" },
    fmt("{{{{< pleroma instance=\"uni.vuwuv.com\" id=\"{}\" >}}}}", { i(1, "") })
  ),
}
