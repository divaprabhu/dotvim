local colorscheme = "tokyonight"

local status_ok, theme = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
