local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

comment.setup({
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = '<C-/>',
        ---Block-comment toggle keymap
        block = '<C-M-/>',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = '<C-/>',
        ---Block-comment keymap
        block = '<C-M-/>',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = '',
        ---Add comment on the line below
        below = '',
        ---Add comment at the end of line
        eol = '',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = false,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
})
