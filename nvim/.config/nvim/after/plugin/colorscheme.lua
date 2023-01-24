function color(colorscheme)
	colorscheme = colorscheme or "everforest"

	vim.o.background = "dark"
	vim.g.everforest_background="soft"
	vim.g.everforest_enable_italic=1


	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
	  return
	end
end

color()

