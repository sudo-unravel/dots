return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
		"nvim-telescope/telescope.nvim",
	},
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	opts = {
		cmdline = {
			view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim", conceal = false },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex", conceal = false },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex", conceal = false },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash", conceal = false },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖", conceal = false },
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	},
}
