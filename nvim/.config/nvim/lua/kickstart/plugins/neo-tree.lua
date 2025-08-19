-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		-- close_if_last_window = true,
		filesystem = {
			hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree in whatever position is specified in window.position
			-- "open_current",  -- netrw disabled, opening a directory opens within the window like netrw would, regardless of window.position
			-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
			follow_current_file = {
				enabled = true, -- This will find and focus the file in the active buffer every time -- the current file is changed while the tree is open.
				leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
			window = {
				position = "left",
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
