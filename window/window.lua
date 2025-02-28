-- window.lua
local window = {}

function window.Init(title, fullscreen)
	love.window.setTitle(title)
	love.window.setFullscreen(fullscreen)
end

return window
