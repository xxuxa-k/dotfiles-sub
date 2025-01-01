return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	keys = {
		{
			"<leader>ff",
			":Telescope find_files --hidden=false<CR>",
			silent = true,
			desc = "Find files",
		},
		{
			"<leader>fg",
			":Telescope live_grep<CR>",
			silent = true,
			desc = "grep files",
		},
		{
			"<leader>fs",
			":Telescope grep_string<CR>",
			silent = true,
			desc = "Find string under cursor in cwd",
		},
		{
      "<leader>fb",
      ":Telescope buffers<CR>",
      desc = "buffers",
    },
		{
      "<leader>fr",
      ":Telescope registers<CR>",
      desc = "registers",
    },
	},
	config = function()
		local telescope = require('telescope')
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".git",
					"dist",
					"yarn.lock",
				},
			},
			pickers = {
				find_files = {
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob",
						"!**/.git/*",
					},
				},
			},
		})
	end,
}
