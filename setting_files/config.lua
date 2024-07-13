---- AUTO SAVE
lvim.format_on_save.enabled = true

---- KEYMAP
lvim.leader = "space"
lvim.keys.normal_mode["qq"] = ":q!<CR>"
lvim.keys.insert_mode["jj"] = "<ESC>"
lvim.keys.normal_mode["DD"] = ":%d<CR>"
lvim.keys.normal_mode["U"] = "<C-r>"
lvim.keys.insert_mode["<C-t>"] = "<Tab>"
lvim.keys.normal_mode["+"] = "<C-a>"
lvim.keys.normal_mode["-"] = "<C-x>"
lvim.builtin.which_key.mappings["h"] = {}
lvim.builtin.which_key.mappings["l"] = {}
lvim.keys.normal_mode["<Leader>h"] = "^"
lvim.keys.normal_mode["<Leader>j"] = "}"
lvim.keys.normal_mode["<Leader>k"] = "{"
lvim.keys.normal_mode["<Leader>l"] = "$"
lvim.keys.normal_mode["<C-h>"] = ":bprev<CR>"
lvim.keys.normal_mode["<C-l>"] = ":bnext<CR>"
lvim.keys.normal_mode["<Leader><Leader>gr"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<Leader>ren"] = ":lua vim.lsp.buf.rename()<CR>"
lvim.keys.normal_mode["<Leader>re"] =
":cdo s//g | update<left><left><left><left><left><left><left><left><left><left><left>"
lvim.keys.normal_mode["<C-p>"] = ":source ~/.config/lvim/config.lua<CR>"
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<CR>"

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
vim.opt.cursorline = true
vim.opt.whichwrap = 'b,s,h,l,<,>,~,[,]'
vim.opt.number = true
vim.opt.background = 'dark'
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.winblend = 20
vim.opt.pumblend = 20

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

---- lunarvimの設定の上書き&プラグインの追加
lvim.plugins = {
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false
	},
	{
		"tpope/vim-surround",
		enabled = true
	},
	{
		"junegunn/rainbow_parentheses.vim",
		enabled = true

	},
	{
		"jorengarenar/vim-SQL-UPPER",
		enabled = true
	}
}

lvim.transparent_window = true

---- lualineの設定
lvim.builtin.lualine.options.theme = "onedark"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch", "diff", "diagnostics" }
lvim.builtin.lualine.sections.lualine_c = { "filename" }
lvim.builtin.lualine.sections.lualine_x = { "searchcount", "selectioncount" }
lvim.builtin.lualine.sections.lualine_y = { "filetype" }
lvim.builtin.lualine.sections.lualine_z = { "location" }
lvim.builtin.lualine.inactive_sections.lualine_a = {}
lvim.builtin.lualine.inactive_sections.lualine_b = {}
lvim.builtin.lualine.inactive_sections.lualine_c = { "filename" }
lvim.builtin.lualine.inactive_sections.lualine_x = { "location" }
lvim.builtin.lualine.inactive_sections.lualine_y = {}
lvim.builtin.lualine.inactive_sections.lualine_z = {}
lvim.builtin.lualine.options.icons_enabled = true
lvim.builtin.lualine.options.component_separators = { left = "", right = "" }
lvim.builtin.lualine.options.section_separators = { left = "◣", right = "◢" }
