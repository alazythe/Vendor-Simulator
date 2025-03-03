-- graphics.lua
graphics = {}

function drawRectanle(mode, width, height, color)
	local screenWidth, screenHeight = love.graphics.getDimensions()

	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", (screenWidth / 2) - (200 / 2), (screenHeight / 2) - (100 / 2), 200, 100)
	love.graphics.setColor(255, 255, 255)
end

return graphics
