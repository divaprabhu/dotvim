local status_ok, statusline = pcall(require, "lualine")
if not status_ok then
	return
end

statusline.setup({
	options = {
		icons_enabled = false,
		theme = "tokyonight",
		-- component_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
		component_separators = "",
		section_separators = "",
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "swenv", cond = function() return vim.bo.filetype == "python" end }, "filename" },
		lualine_x = { "progress", "location" },
		lualine_y = { "encoding", "fileformat", "filetype" },
		lualine_z = { "datetime" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
