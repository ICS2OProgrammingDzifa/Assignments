-----------------------------------------------------------------------------------------
-- Title: Company Logo Animation
-- Name: Dzifa
-- Course: ICS2O/3C
-- This program animates the company logo on the screen
-----------------------------------------------------------------------------------------

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

--Make local function
local vampire = display.newImageRect("Images/vampire.png", 300, 200)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/pastel.jpg", 2048, 1536)
local cutedog = display.newImageRect("Images/cutedog.png", 300, 200)

-- set the initial x and y position of cutedog.
cutedog.x = 100
cutedog.y = display.contentHeight/3

local rocketship = display.newImageRect("Images/rocketship.png", 300, 200)

-- set the initial x and y position of cutedog.
rocketship.x = 600
rocketship.y = display.contentHeight*1/3

-- Creat a local image for a cat
local cat = display.newImageRect("Images/cat.png", 300, 200)


-- set the initial x and y position of cutedog.
cat.x = 900
cat.y = display.contentHeight*2/3

-- Function: MoveCuteDog
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the CuteDog
local function MoveCuteDog(event)
	-- add the scroll speed to the x-value of the cutedog
	cutedog.x = cutedog.x + scrollSpeed

	print(cutedog.x)

	-- change the transparency of the cutedog every time it moves
	-- so that it fades out.
	cutedog.alpha = cutedog.alpha + 0.01
end

-- MoveCuteDog will be called over and over again
Runtime:addEventListener("enterFrame", MoveCuteDog)

 
-- Function: MoveCat
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the cat
local function MoveCat(event)
	-- add the scroll speed to the x-value of the cat
	cat.x = cat.x - scrollSpeed
	-- change the transparency of the cat every time it moves
	-- so that it fades out.
	cat.alpha = cat.alpha - 0.00000000001
end
