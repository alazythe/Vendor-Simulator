-- helper.lua
local helper = {}

function helper.loadAssets()
	-- NOTE: Images
	MenuBackground = love.graphics.newImage("assets/images/MenuBackground.png")
	MenuButton = love.graphics.newImage("assets/images/ui/MenuButton.png")

	-- NOTE: Sounds
	ButtonHoverSound = love.audio.newSource("assets/sounds/ui/MP3/Retro11.mp3", "static")

	-- NOTE: Fonts
	MenuFont = love.graphics.newFont("assets/fonts/Jersey15-Regular.ttf", 62)
end

return helper
