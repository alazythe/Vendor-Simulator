-- window.lua
local window = {}

function window.init(title, fullscreen)
	love.window.setTitle(title)
	love.window.setFullscreen(fullscreen)
end

return window
