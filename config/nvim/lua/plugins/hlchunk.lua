return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({})
		require("hlchunk.mods.chunk")({
			line_num = {
				enable = true,
			},
			duration = 0,
			delay = 0,
		}):enable()
		require("hlchunk.mods.indent")({}):enable()
	end,
}
