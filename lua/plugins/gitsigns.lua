local status_ok, git = pcall(require, "gitsigns")
if not status_ok then
	return
end

git.setup {
	signs                             = {
		add          = { text = '┃' },
		change       = { text = '┃' },
		delete       = { text = '_' },
		topdelete    = { text = '‾' },
		changedelete = { text = '~' },
		untracked    = { text = '┆' },
	},
	signcolumn                        = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl                             = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl                            = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff                         = true, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir                      = {
		follow_files = true
	},
	auto_attach                       = true,
	attach_to_untracked               = false,
	current_line_blame                = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts           = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
	},
	current_line_blame_formatter      = '<author>, <author_time:%Y-%m-%d> - <summary>',
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority                     = 6,
	update_debounce                   = 100,
	status_formatter                  = nil, -- Use default
	max_file_length                   = 40000, -- Disable if file is longer than this (in lines)
	preview_config                    = {
		-- Options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
	on_attach                         = function(bufnr)
		local gitsigns = require('gitsigns')

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']c', function()
			if vim.wo.diff then
				vim.cmd.normal({ ']c', bang = true })
			else
				gitsigns.nav_hunk('next')
			end
		end)

		map('n', '[c', function()
			if vim.wo.diff then
				vim.cmd.normal({ '[c', bang = true })
			else
				gitsigns.nav_hunk('prev')
			end
		end)

		-- Actions
		map('n', '<leader>gs', gitsigns.stage_hunk, { desc = "Stage Hunk" })
		map('n', '<leader>gr', gitsigns.reset_hunk, { desc = "Reset Hunk" })
		map('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
			{ desc = "Stage Hunk Current Line" })
		map('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
			{ desc = "Reset Hunk Current Line" })
		map('n', '<leader>gS', gitsigns.stage_buffer, { desc = "Stage Buffer" })
		map('n', '<leader>gR', gitsigns.reset_buffer, { desc = "Reset Buffer" })
		map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
		map('n', '<leader>gp', gitsigns.preview_hunk, { desc = "Preview Hunk" })
		map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = "Blame Toggle" })
		map('n', '<leader>gd', gitsigns.diffthis, { desc = "Diff Index" })
		map('n', '<leader>gD', function() gitsigns.diffthis('~') end, { desc = "Diff Last Commit" })
		-- map('n', '<leader>gd', gitsigns.toggle_deleted)

		-- Text object
		map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end
}
