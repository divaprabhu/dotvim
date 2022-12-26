local status_ok, buf = pcall(require, "cmp-buffer")
if not status_ok then
	return
end
local status_ok, path = pcall(require, "cmp-path")
if not status_ok then
	return
end
local status_ok, cmd = pcall(require, "cmp-cmdline")
if not status_ok then
	return
end

buf.setup({
  sources = {
    {
      name = 'buffer',
      option = {
        -- Options go into this table
	keyword_length = 2,
      },
    },
  },
})

path.setup({
  sources = {
    {
      name = 'path',
      option = {
        -- Options go into this table
      },
    },
  },
})

nvimcmp.setup.cmdline(':', {
  mapping = nvimcmp.mapping.preset.cmdline(),
  sources = nvimcmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})
