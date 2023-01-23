local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup({
  defaults = {

    prompt_prefix = ": ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
})

local builtin = require('telescope.builtin')

-- file pickers
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc="find_files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc="live_grep" })

-- vim pickers
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc="buffers" })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc="commands" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc="help_tags" })
vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc="jump list" })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc="keymaps" })
vim.keymap.set('n', '<leader>fl', builtin.loclist, { desc="location list" })
vim.keymap.set('n', '<leader>fm', builtin.marks, { desc="marks" })
vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc="quickfix" })
vim.keymap.set('n', '<leader>fr', builtin.registers, { desc="registers" })

-- lsp pickers
vim.keymap.set('n', '<leader>fdci', builtin.lsp_incoming_calls, { desc="list incoming calls" })
vim.keymap.set('n', '<leader>fdco', builtin.lsp_outgoing_calls, { desc="list outgoing calls" })
vim.keymap.set('n', '<leader>fdd', builtin.lsp_definitions, { desc="goto or list definitions" })
vim.keymap.set('n', '<leader>fdi', builtin.lsp_implementations, { desc="goto or list implementation" })
vim.keymap.set('n', '<leader>fdr', builtin.lsp_references, { desc="list references" })
vim.keymap.set('n', '<leader>fds', builtin.lsp_document_symbols, { desc="list symbols" })
vim.keymap.set('n', '<leader>fdt', builtin.lsp_type_definitions, { desc="goto or list type definitions" })
vim.keymap.set('n', '<leader>fdws', builtin.lsp_workspace_symbols, { desc="list workspace symbols" })

-- git pickers
vim.keymap.set('n', '<leader>fvc', builtin.git_commits, { desc="list git commits" })
vim.keymap.set('n', '<leader>fvb', builtin.git_branches, { desc="list git branches" })
vim.keymap.set('n', '<leader>fvs', builtin.git_status, { desc="list git status" })
vim.keymap.set('n', '<leader>fvh', builtin.git_stash, { desc="list git stashes" })

-- treesitter
vim.keymap.set('n', '<leader>ft', builtin.treesitter, { desc="treesitter" })


telescope.load_extension('project')
vim.keymap.set('n', '<leader>fp', telescope.extensions.project.project, { desc="project" })
