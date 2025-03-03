-- menu.lua
local menu = {}
local buttons = {}

local MENU_WIDTH, MENU_HEIGHT = 1024, 512
local BUTTON_HEIGHT = 64
local MARGIN = 16

local function newButton(image, fn)
	return {
		image = image,
		fn = fn,
	}
end

local function drawBackground(sW, sH)
	love.graphics.draw(Background, 0, 0, 0, sW / Background:getWidth(), sH / Background:getHeight())
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle(
		"fill",
		(sW * 0.5) - (MENU_WIDTH * 0.5),
		(sH * 0.5) - (MENU_HEIGHT * 0.5),
		MENU_WIDTH,
		MENU_HEIGHT
	)
	love.graphics.setColor(255, 255, 255)
end

local function generateButtons()
	table.insert(
		buttons,
		newButton(Start, {
			function()
				print("Start Game")
			end,
		})
	)
end

function drawButtons(sW, sH)
	local totalHeight = (BUTTON_HEIGHT + MARGIN) * #buttons
	local cursorY = 0

	for _, button in ipairs(buttons) do
		local bX = (sW * 0.5) - (button.image:getWidth() * 0.5)
		local bY = (sH * 0.5) - (BUTTON_HEIGHT * 0.5) - (totalHeight * 0.5) + cursorY

		love.graphics.draw(button.image, bX, bY, 0)

		cursorY = cursorY + (BUTTON_HEIGHT + MARGIN)
	end
end

function menu.init()
	generateButtons()
end

function menu.draw()
	local screenWidth, screenHeight = love.graphics.getDimensions()

	drawBackground(screenWidth, screenHeight)
	drawButtons(screenWidth, screenHeight)
end

return menu
