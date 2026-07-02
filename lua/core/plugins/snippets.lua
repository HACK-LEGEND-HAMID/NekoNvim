return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
            local ls = require("luasnip")
            local s = ls.s
            local t = ls.t
            local i = ls.i

            -- ====== HTML ======
            ls.add_snippets("html", {
                s("!", {
                    t({ "<!DOCTYPE html>", '<html lang="en">', "<head>",
                        '\t<meta charset="UTF-8">',
                        '\t<meta name="viewport" content="width=device-width, initial-scale=1.0">',
                        '\t<title>', }),
                    i(1, "Document"),
                    t({ "</title>", "</head>", "<body>", "\t" }),
                    i(0),
                    t({ "", "</body>", "</html>" }),
                }),
            })

            -- ====== C ======
            ls.add_snippets("c", {
                s("inc", {
                    t({ "#include <stdio.h>", "#include <stdlib.h>", "",
                        "int main() {", "\t" }),
                    i(0),
                    t({ "", "\treturn 0;", "}" }),
                }),
            })

            -- ====== C++ ======
            ls.add_snippets("cpp", {
                s("inc", {
                    t({ "#include <iostream>", "using namespace std;", "",
                        "int main() {", "\t" }),
                    i(0),
                    t({ "", "\treturn 0;", "}" }),
                }),
            })

            -- ====== Python ======
            ls.add_snippets("python", {
                s("def", {
                    t({ "def " }), i(1, "name"), t({ "(" }), i(2, "args"),
                    t({ "):", "\t" }), i(0),
                }),
                s("class", {
                    t({ "class " }), i(1, "Name"), t({ ":", "\tdef __init__(self):",
                        "\t\t" }), i(0),
                }),
            })

            -- ====== Lua ======
            ls.add_snippets("lua", {
                s("pr", { t("print("), i(1), t(")") }),
                s("func", {
                    t({ "local function " }), i(1, "name"), t({ "(", ")", "",
                        "\t" }), i(0), t({ "", "end" }),
                }),
            })

            -- ====== JavaScript ======
            ls.add_snippets("javascript", {
                s("clg", { t("console.log("), i(1), t(");") }),
                s("func", {
                    t({ "function " }), i(1, "name"), t({ "(", ")", " {",
                        "\t" }), i(0), t({ "", "}" }),
                }),
            })

            -- ====== TypeScript ======
            ls.add_snippets("typescript", {
                s("clg", { t("console.log("), i(1), t(");") }),
            })

            -- ====== Rust ======
            ls.add_snippets("rust", {
                s("fn", {
                    t({ "fn " }), i(1, "name"), t({ "(", ")", " {", "\t" }),
                    i(0), t({ "", "}" }),
                }),
            })

            -- ====== Go ======
            ls.add_snippets("go", {
                s("main", {
                    t({ "package main", "", "import \"fmt\"", "", "func main() {",
                        "\t" }), i(0), t({ "", "}" }),
                }),
            })

            -- ====== Bash ======
            ls.add_snippets("sh", {
                s("sh", {
                    t({ "#!/usr/bin/env bash", "", "set -euo pipefail", "",
                        "" }), i(0),
                }),
            })

            -- ====== All Languages ======
            ls.add_snippets("all", {
                s("date", { t(os.date("%Y-%m-%d")) }),
                s("time", { t(os.date("%H:%M:%S")) }),
            })

            -- ====== Expand with Ctrl+E ======
            vim.keymap.set({ "i", "s" }, "<C-e>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })
        end,
    },
}
