local status_ok, bracketed = pcall(require, "mini.bracketed")
if not status_ok then
	return
end

bracketed.setup({
  -- First-level elements are tables describing behavior of a target:
  --
  -- - <suffix> - single character suffix. Used after `[` / `]` in mappings.
  --   For example, with `b` creates `[B`, `[b`, `]b`, `]B` mappings.
  --   Supply empty string `''` to not create mappings.
  --
  -- - <options> - table overriding target options.
  --
  -- See `:h MiniBracketed.config` for more info.

  buffer     = { suffix = 'b', options = {} },
  comment    = { suffix = '', options = {} },
  conflict   = { suffix = '', options = {} },
  diagnostic = { suffix = 'd', options = {} },
  file       = { suffix = 'f', options = {} },
  indent     = { suffix = '', options = {} },
  jump       = { suffix = 'j', options = {} },
  location   = { suffix = 'l', options = {} },
  oldfile    = { suffix = '', options = {} },
  quickfix   = { suffix = 'q', options = {} },
  treesitter = { suffix = 't', options = {} },
  undo       = { suffix = '', options = {} },
  window     = { suffix = 'w', options = {} },
  yank       = { suffix = '', options = {} },
})


