-----------------------------------------------------------------------------------------
-- Title: DisplayShapesDzifa.A
-- Name: Dzifa Agbenyoh
-- course: ISC20/3C
-- This program displays multiple shapes and their names
-----------------------------------------------------------------------------------------

-- create my local variables
local textSize =50

local myTriangle
local myRhombus
local myPentagon

local perimeterOfTriangle = 200
local perimeterOfRhombus = 200
local perimeterOfSquare = 200

-- set the background colour of my screen.Remember that colours are between 0 and 1.
display.setDefault("background", 255/255, 255/255, 204/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the sqaure that has a side of 5
local sqaure = display.newRect(200, 200, 200, 200);
sqaure.strokeWidth = 10
sqaure:setFillColor(20/255, 20/255, 20/255)