return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			{
				-- https://nvimdev.github.io/lspsaga/
				"nvimdev/lspsaga.nvim",
				config = function()
					require('lspsaga').setup({
						symble_in_winbar = { enable = false },
						ui = { code_action = "" },
					})
				end,
			},
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = { library = { "lazy.nvim" } },
			},
		},
		config = function()
			local nvim_lsp = require("lspconfig")
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					local bufopts = { noremap = true, silent = true, buffer = ev.buf }
					vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
					vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
					vim.keymap.set("n", "<C-]>", "<cmd>Lspsaga goto_definition<CR>", bufopts)
					vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
					vim.keymap.set("n", "<LocalLeader>k", vim.lsp.buf.hover, bufopts)
					vim.keymap.set("n", "<localleader>e", "<cmd>Lspsaga outline<CR>", bufopts)
					vim.keymap.set("n", "<LocalLeader>c", "<cmd>Lspsaga code_action<CR>", bufopts)
				end,
			})

			local function is_deno_project()
				return vim.fn.filereadable("deno.json") == 1 or vim.fn.filereadable("deno.jsonc") == 1
			end

			if not is_deno_project() then
				nvim_lsp.ts_ls.setup({
					root_dir = nvim_lsp.util.root_pattern("package.json"),
				})
			end

			nvim_lsp.denols.setup({
				root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
			})
			nvim_lsp.gopls.setup({
				root_dir = nvim_lsp.util.root_pattern("go.mod"), -- go.workとかいらない
			})
			nvim_lsp.lua_ls.setup({
				on_init = function(client)
					client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
						runtime = {
							version = 'LuaJIT',
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							}
						}
					})
				end,
				settings = {
					Lua = {}
				},
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {
			win = {
				wo = {
					wrap = true,
				},
			},
		},
		keys = {
			{
				"<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)",
			}
		},
	},
}
