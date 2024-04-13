local status_ok, git = pcall(require, "gitsigns")
if not status_ok then
	return
end

git.setup {
	on_attach = function(bufnr)
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
		map('n', '<leader>gs', gitsigns.stage_hunk, { desc="Stage Hunk" })
		map('n', '<leader>gr', gitsigns.reset_hunk, { desc="Reset Hunk" })
		map('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc="Stage Hunk Current Line" })
		map('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc="Reset Hunk Current Line" })
		map('n', '<leader>gS', gitsigns.stage_buffer, { desc="Stage Buffer" })
		map('n', '<leader>gR', gitsigns.reset_buffer, { desc="Reset Buffer" })
		map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc="Undo Stage Hunk" })
		map('n', '<leader>gp', gitsigns.preview_hunk, { desc="Preview Hunk" })
		map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc="Blame Toggle" })
		map('n', '<leader>gd', gitsigns.diffthis, { desc="Diff Index" })
		map('n', '<leader>gD', function() gitsigns.diffthis('~') end, { desc="Diff Last Commit" })
		-- map('n', '<leader>gd', gitsigns.toggle_deleted)

		-- Text object
		map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end
}
