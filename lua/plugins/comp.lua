return {

	{
		"saghen/blink.cmp",
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
				["<C-c>"] = { "cancel" },
				-- ["<C-y>"] = false,
				-- ["<C-n>"] = false,
				-- ["<C-p>"] = false,
			},

			appearance = {
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },

			completion = { documentation = { auto_show = true } },

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					sql = { "dadbod", "buffer" },
					mysql = { "dadbod", "buffer" },
					-- 		-- optionally inherit from the `default` sources
				},
				providers = {
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
