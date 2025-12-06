return {

	{
		"saghen/blink.cmp",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		dependencies = { "rafamadriz/friendly-snippets" },

		version = "1.*",
		opts = {
			keymap = {
				preset = "default",
				["<Tab>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
			},

			appearance = {
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },

			completion = {
				menu = { auto_show = false },
				ghost_text = { enabled = true },
				documentation = { auto_show = true },
				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					},
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					sql = { "dadbod", "buffer" },
					mysql = { "dadbod", "buffer" },
					-- 		-- optionally inherit from the `default` sources
				},
				providers = {
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
					-- snippets = {
					-- 	opts={
					-- 		 friendly_snippets = true,
					-- 	}
					-- },
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
