local window = require("window.window")
local menu = require("menu")
local crt = require("shaders.crt")
local helper = require("helper")

local gameState

function love.load()
	-- NOTE: Load all resources
	gameState = "load"

	crtShader = crt.crt
	helper.loadAssets()

	gameState = "menu"

	menu.init()

	window.init("Showtime", true)
end

function love.draw()
	love.graphics.setShader(crtShader)
	if gameState == "load" then
		menu.load()
	elseif gameState == "menu" then
		menu.draw()
	end
	love.graphics.setShader()
end
