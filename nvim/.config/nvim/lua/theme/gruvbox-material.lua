return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_foreground = "material"
		vim.g.gruvbox_material_background = "medium"
		vim.g.gruvbox_material_float_style = "blend"
		vim.g.gruvbox_material_statusline_style = "default" -- "material"
		vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
		vim.g.gruvbox_material_disable_terminal_colors = 1
		vim.g.gruvbox_material_transparent_background = 1

		vim.cmd.colorscheme("gruvbox-material")
	end,
}
