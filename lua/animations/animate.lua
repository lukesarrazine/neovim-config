local function animate(dashboard, alpha, frames)
	local index = 1
	vim.fn.timer_start(200, function()
		dashboard.section.header.val = frames[index]
		alpha.redraw()
		index = (index % #frames) + 1
	end, { ["repeat"] = -1 })
end

return animate
