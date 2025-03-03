-- menu.lua
local menu = {}

local menuWidth, menuHeight = 1024, 512

function menu.draw()
	screenWidth, screenHeight = love.graphics.getDimensions()
	love.graphics.draw(Background, 0, 0, 0, screenWidth / Background:getWidth(), screenHeight / Background:getHeight())

	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle(
		"fill",
		(screenWidth / 2) - (menuWidth / 2),
		(screenHeight / 2) - (menuHeight / 2),
		menuWidth,
		menuHeight
	)
	love.graphics.setColor(255, 255, 255)
end

return menu
