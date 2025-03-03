local window = require("window.window")
local menu = require("menu")

local gameState = "load"

function love.load()
	Background = love.graphics.newImage("intro.png")
	Start = love.graphics.newImage("assets/Start.png")
	menu.init()
	--Leaf = love.graphics.newImage("assets/leaf.png")

	window.init("Showtime", true)
end

function love.draw()
	if gameState == "load" then
		menu.draw()
	end
end
