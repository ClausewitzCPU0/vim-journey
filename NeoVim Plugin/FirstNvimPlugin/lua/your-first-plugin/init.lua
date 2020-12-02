local function printWindowSize()
    print(vim.fn.nvim_win_get_width(0),
        vim.fn.nvim_win_get_height(0))
    print(vim.g["your_global_var_name"])
    print(vim.g["your_global_var_name2"])
end

return{
    printWindowSize = printWindowSize
}

