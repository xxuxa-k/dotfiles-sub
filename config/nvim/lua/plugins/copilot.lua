return {
	{
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
			},
		})
	end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatClose",
			"CopilotChatToggle",
			"CopilotChatStop",
			"CopilotChatReset",
		},
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
			{ "hrsh7th/nvim-cmp" },
		},
		keys = {
			{
				"<leader>cc",
				"<Cmd>CopilotChat<CR>",
				mode = { "n", "x" },
				desc = "CopilotChat Open chat window",
			},
		},
		config = function()
			require("CopilotChat").setup()
		end,
	}
}
