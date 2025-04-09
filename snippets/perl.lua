local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("debug", {
        t('Educativa::Debug::show("'),
        i(1, "message"),
        t('");'),
    }),
}
