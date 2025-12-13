return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		scope = { enabled = true, show_start = true, show_end = false },
	},
	config = function(_, opts)
		-- pick from this mini gruvbox-material palette
		local gb = {
			red = "#ea6962",
			orange = "#e78a4e",
			yellow = "#d8a657",
			green = "#a9b665",
			aqua = "#89b482",
			blue = "#7daea3",
			purple = "#d3869b",
		}

		-- choose ONE color for the active scope line:
		vim.api.nvim_set_hl(0, "IblScope", { fg = gb.purple, nocombine = true })

		-- use the single group for scope highlighting
		local merged = vim.tbl_deep_extend("force", opts or {}, {
			scope = { highlight = "IblScope" },
		})
		require("ibl").setup(merged)
	end,
}
