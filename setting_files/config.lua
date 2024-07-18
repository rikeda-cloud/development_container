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
---- NvimTree
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<CR>"
---- SymbolsOutline
lvim.keys.normal_mode["<Leader>ss"] = ":SymbolsOutline<CR>"

---- SETTING
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
vim.opt.timeoutlen = 300
-- vim.cmd('syntax on')
vim.cmd('set clipboard=unnamed,unnamedplus')

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
		"mrjones2014/nvim-ts-rainbow",
	},
	{
		"jorengarenar/vim-SQL-UPPER",
		enabled = true
	},
	{
		"MTDL9/vim-log-highlighting",
		enabled = true
	},
	{
		"norcalli/nvim-colorizer.lua",
		enabled = true,
		config = function()
			require("colorizer").setup({ "*" }, {
				RGB = true,
				RRGGBB = true,
				RRGGBBAA = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
			})
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require('symbols-outline').setup({
				width = 40,
			})
		end
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}

-- enable treesitter integration
lvim.builtin.treesitter.rainbow.enable = true

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

---- ColorSchemeのカスタマイズ設定
lvim.colorscheme = "tokyonight-night"
lvim.autocommands = {
	{
		{ "ColorScheme" },       -- ColorScheme イベントに対する設定
		{
			pattern = "tokyonight-night", -- tokyonight-night カラースキームがロードされた際に適用
			callback = function()
				vim.cmd("highlight Comment guifg=#FF00FF ctermfg=5")
				vim.cmd("hi LineNr guifg=#00FFFF ctermfg=5")
				vim.cmd("hi CursorLineNr guifg=#FF0000 ctermfg=5")
				vim.cmd("hi String guifg=#88FF88 ctermfg=5")
				vim.cmd("hi rainbowcol1 guifg=Orange") -- Orange
				vim.cmd("hi rainbowcol2 guifg=#66FF66") -- Light Green
				vim.cmd("hi rainbowcol3 guifg=#6699FF") -- Light Blue
				vim.cmd("hi rainbowcol4 guifg=#FF66FF") -- Light Purple
				vim.cmd("hi rainbowcol5 guifg=#FFCC33") -- Yellow
				vim.cmd("hi rainbowcol6 guifg=#66CCCC") -- Light Cyan
				vim.cmd("hi rainbowcol7 guifg=#FF9966") -- Coral
			end,
		},
	},
}

---- alphaのカスタマイズ設定
lvim.builtin.alpha.dashboard.section.buttons.entries = {
	{ "ft", lvim.icons.ui.FindText .. "  Find Text", "<CMD>Telescope live_grep <CR>" },
	{ "ff", lvim.icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files <CR>" },
	{ "p", lvim.icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>" },
	{ "r", lvim.icons.ui.History .. "  Recently files", ":Telescope oldfiles <CR>" },
	{ "cl", lvim.icons.ui.Gear .. "  edit config.lua", ":e ~/.config/lvim/config.lua<CR>" },
	{ "new", lvim.icons.ui.NewFile .. "  New file", "<CMD>ene!<CR>" },
	{ "q", "💣  Quit", "<CMD>quit<CR>" },
}


lvim.builtin.which_key.mappings['m'] = {
	name = "LSP",
	a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
	d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
	w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
	f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
	i = { "<cmd>LspInfo<cr>", "Info" },
	I = { "<cmd>Mason<cr>", "Mason Info" },
	j = {
		"<cmd>lua vim.diagnostic.goto_next()<cr>",
		"Next Diagnostic",
	},
	k = {
		"<cmd>lua vim.diagnostic.goto_prev()<cr>",
		"Prev Diagnostic",
	},
	l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
	q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
	r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
	S = {
		"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		"Workspace Symbols",
	},
	e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
}
