return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	keys = {
		{ "<leader><leader>", "<cmd>Noice dismiss<CR>", desc = "Dismiss Noice messages" },
	},
	config = function()
		require("noice").setup({
			messages = {
				-- view = "mini",
			},
		})
	end,
}
