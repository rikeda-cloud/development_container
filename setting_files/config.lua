---- AUTO SAVE
lvim.format_on_save.enabled = true

---- LEADER
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

---- KEYMAP
vim.api.nvim_set_keymap('n', 'qq', ':q!<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', 'DD', ':%d<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'U', '<C-r>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-t>', '<Tab>', { noremap = true })

vim.api.nvim_set_keymap('n', '<S-k>', ':m -2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-j>', ':m +1<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '+', '<C-a>', { noremap = true })
vim.api.nvim_set_keymap('n', '-', '<C-x>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>h', '^', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>j', '}', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>k', '{', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>l', '$', { noremap = true })

-- tab jamp
vim.api.nvim_set_keymap('n', '<C-h>', ':bprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':bnext<CR>', { noremap = true })

-- window split
-- vim.api.nvim_set_keymap('n', '<Leader>\\', ':vs<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>-', ':sp<CR>', { noremap = true })

-- live_grep
vim.api.nvim_set_keymap('n', '<Leader><Leader>gr', '<CMD>Telescope live_grep<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>re', ":cdo s//g | update<left><left><left><left><left><left><left><left><left><left><left>",
	{})

-- rename
vim.api.nvim_set_keymap('n', '<Leader>ren', '<cmd>lua vim.lsp.buf.rename()<cr>', { noremap = true })

-- reload config.lua
vim.api.nvim_set_keymap('n', '<C-p>', ':source ~/.config/lvim/config.lua<CR>', { noremap = true })

-- treeToggle
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })

---- SETTING
--normal setting
vim.opt.expandtab = false
vim.opt.encoding = 'utf-8'
vim.opt.history = 100
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.showtabline = 2
vim.opt.matchtime = 1
vim.opt.laststatus = 2
vim.opt.cmdheight = 0
vim.opt.list = false
vim.opt.ignorecase = true
vim.opt.wrap = true
vim.opt.showcmd = true
vim.opt.ambiwidth = 'double'
vim.opt.display = 'lastline'
vim.opt.visualbell = true
vim.opt.showmatch = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.mouse = 'a'
vim.opt.swapfile = false
vim.opt.wildmenu = true
vim.opt.ruler = true
vim.opt.clipboard:append({ 'unnamedplus' })
--cursor
vim.opt.cursorline = true
--move
vim.opt.whichwrap = 'b,s,h,l,<,>,~,[,]'

--side number
vim.opt.number = true

vim.opt.background = 'dark'

--search
vim.opt.hlsearch = true
vim.opt.incsearch = true

--補完の透明度
vim.opt.winblend = 20
vim.opt.pumblend = 20

-- buffer
-- local bufnr = vim.api.nvim_get_current_buf()
-- vim.api.nvim_buf_set_option(bufnr, 'modifiable', true)

-- vim.cmd('syntax on')
vim.cmd('highlight VertSplit cterm=none')
vim.cmd('highlight Comment ctermfg=6')
vim.cmd('set clipboard=unnamed,unnamedplus')
vim.cmd('colorscheme tokyonight-night')

-- コメントにマゼンダを設定
vim.cmd("hi Comment guifg=#FF00FF ctermfg=5")
-- 行番号にレッドを設定
vim.cmd("hi LineNr guifg=#00FF00 ctermfg=5")
-- 行番号の今いる行番号を黒に設定
vim.cmd("hi CursorLineNr guifg=#FF0000 ctermfg=5")
-- カーソルの色を指定
vim.cmd("hi CursorLine guifg=#88FF88 ctermfg=5")
-- 文字列を黄緑に設定
vim.cmd("hi String guifg=#88FF88 ctermfg=5")

-- hexHighlightプラグインを有効にする
vim.g.colorizer_auto_filetype = 1
vim.g.colorizer_auto_refresh_by_updatetime = 0

lvim.colorscheme = "tokyonight-night"
vim.opt.timeoutlen = 800

---- lunarvimの設定の上書き

lvim.plugins = {
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false
	}
}
