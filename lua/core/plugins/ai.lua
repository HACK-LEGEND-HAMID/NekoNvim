return {
    {
        "Exafunction/codeium.vim",
        event = "BufEnter",
        cond = function()
            local ok, result = pcall(vim.fn.system, { "uname", "-m" })
            if not ok then return false end
            return result:find("x86_64") ~= nil
        end,
    },
}
