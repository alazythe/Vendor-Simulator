local window = require("window.window")
local moonshine = require("moonshine")

function love.load()
	background = love.graphics.newImage("intro.png")

	effect = moonshine(moonshine.effects.filmgrain).chain(moonshine.effects.vignette)
	effect.filmgrain.size = 2

	window.Init("Showtime", true)
end

function love.draw()
	local screenWidth, screenHeight = love.graphics.getDimensions()

	love.graphics.draw(background, 0, 0, 0, screenWidth / background:getWidth(), screenHeight / background:getHeight())
end
