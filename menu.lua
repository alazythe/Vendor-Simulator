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
		now = false,
		last = false,
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
		newButton(MenuButton, "New Game", function()
			print("New Game")
		end)
	)

	table.insert(
		buttons,
		newButton(MenuButton, "Load Game", function()
			print("Load Game")
		end)
	)

	table.insert(
		buttons,
		newButton(MenuButton, "Settings", function()
			print("Settings")
		end)
	)

	table.insert(
		buttons,
		newButton(MenuButton, "Exit Game", function()
			love.event.quit(0)
		end)
	)
end

local function drawButtons(screenWidth, screenHeight)
	local cursorY = 0
	local hoveredButton = nil

	for i, button in ipairs(buttons) do
		button.last = button.now

		local totalHeight = (button.image:getHeight() - MARGIN) * #buttons
		local buttonX = (screenWidth * 0.5) - (button.image:getWidth() * 0.5)
		local buttonY = (screenHeight * 0.5) - (button.image:getHeight() * 0.5) - (totalHeight * 0.5) + cursorY
		local textWidth = font:getWidth(button.text)
		local textHeight = font:getHeight(button.text)
		local mouseX, mouseY = love.mouse.getPosition()

		-- Check if hovering over button
		if
			mouseX > buttonX
			and mouseX < buttonX + button.image:getWidth()
			and mouseY > buttonY
			and mouseY < buttonY + button.image:getHeight()
		then
			-- Add padding on hover
			buttonY = buttonY + 5
			hoveredButton = i

			-- Play sound on hover
			if hoveredButton ~= currentButton then
				if not soundPlayed then
					ButtonHoverSound:stop()
					ButtonHoverSound:play()
					soundPlayed = true
				end
				currentButton = hoveredButton
			end

			-- Execute function on mouse click
			button.now = love.mouse.isDown(1)
			if button.now and not button.last then
				button.fn()
			end
		else
			soundPlayed = false
		end

		love.graphics.draw(button.image, buttonX, buttonY, 0)
		love.graphics.setShader() -- Deactivate CRT shader because it fucks up the text
		love.graphics.print(
			button.text,
			font,
			(screenWidth * 0.5) - (textWidth * 0.5),
			buttonY + (textHeight * 0.5) + MARGIN
		)
		love.graphics.setShader(crtShader) -- Re-activate shader

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
