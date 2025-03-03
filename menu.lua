-- menu.lua
local menu = {}
local buttons = {}

local MARGIN = 16

local font = nil
local currentButton = nil
local soundPlayed = false

local function newButton(image, text, fn)
	return {
		image = image,
		text = text,
		fn = fn,
	}
end

local function drawBackground(screenWidth, screenHeight)
	love.graphics.draw(
		MenuBackground,
		0,
		0,
		0,
		screenWidth / MenuBackground:getWidth(),
		screenHeight / MenuBackground:getHeight()
	)
end

local function generateButtons()
	font = MenuFont

	table.insert(
		buttons,
		newButton(MenuButton, "New Game", {
			function()
				print("New Game")
			end,
		})
	)

	table.insert(
		buttons,
		newButton(MenuButton, "Load Game", {
			function()
				print("Load Game")
			end,
		})
	)

	table.insert(
		buttons,
		newButton(MenuButton, "Settings", {
			function()
				print("Settings")
			end,
		})
	)

	table.insert(
		buttons,
		newButton(MenuButton, "Exit Game", {
			function()
				love.event.exit(0)
			end,
		})
	)
end

function drawButtons(screenWidth, screenHeight)
	local cursorY = 0
	local hoveredButton = nil

	for i, button in ipairs(buttons) do
		local totalHeight = (button.image:getHeight() - MARGIN) * #buttons
		local buttonX = (screenWidth * 0.5) - (button.image:getWidth() * 0.5)
		local buttonY = (screenHeight * 0.5) - (button.image:getHeight() * 0.5) - (totalHeight * 0.5) + cursorY
		local textWidth = font:getWidth(button.text)
		local textHeight = font:getHeight(button.text)
		local mouseX, mouseY = love.mouse.getPosition()

		if
			mouseX > buttonX
			and mouseX < buttonX + button.image:getWidth()
			and mouseY > buttonY
			and mouseY < buttonY + button.image:getHeight()
		then
			buttonY = buttonY + 5
			hoveredButton = i
		end

		if hoveredButton and hoveredButton ~= currentButton then
			if not soundPlayed then
				ButtonHoverSound:stop()
				ButtonHoverSound:play()
				soundPlayed = true
			end
			currentButton = hoveredButton
		else
			soundPlayed = false
		end

		love.graphics.draw(button.image, buttonX, buttonY, 0)
		love.graphics.setShader()
		love.graphics.print(
			button.text,
			font,
			(screenWidth * 0.5) - (textWidth * 0.5),
			buttonY + (textHeight * 0.5) + MARGIN
		)
		love.graphics.setShader(crtShader)

		cursorY = cursorY + (button.image:getHeight() + MARGIN)
	end
end

function menu.init()
	generateButtons()
end

function menu.load()
	local screenWidth, screenHeight = love.graphics.getDimensions()

	drawBackground(screenWidth, screenHeight)
end

function menu.draw()
	local screenWidth, screenHeight = love.graphics.getDimensions()

	drawBackground(screenWidth, screenHeight)
	drawButtons(screenWidth, screenHeight)
end

return menu
