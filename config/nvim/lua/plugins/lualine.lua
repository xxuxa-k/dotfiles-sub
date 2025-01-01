return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	lazy = false,
	config = function()
		require('lualine').setup({
			options = {
				icons_enabled = true,
				theme = 'gruvbox',
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					"filename",
				},
				lualine_b = {
					"branch",
				},
				lualine_c = { "diff", "diagnostics" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = { "filename" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
