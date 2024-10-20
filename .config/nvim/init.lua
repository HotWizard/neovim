vim.cmd([[set number
set whichwrap+=h,l,<,>,[,]
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set guicursor=n-v-c-i:block
]])

require("config.coc")
require("config.lazy")
require("config.bufferline")
require("config.lualine")
require("config.vscode")
require("config.noice")
