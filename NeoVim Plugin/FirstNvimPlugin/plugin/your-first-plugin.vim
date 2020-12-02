fun! YourFirstPlugin()
    lua for k in pairs(package.loaded) do if k:match("^your%-first%-plugin") then package.loaded[k] = nil end end
    lua require("your-first-plugin").printWindowSize()
endfun

let g:your_global_var_name = 42
let g:your_global_var_name2 = 41
augroup YourFirstPlugin
    autocmd!
augroup END
    
