-----------------------------------------------------------------------------------------
-- Title: DisplayShapesDzifa.A
-- Name: Dzifa Agbenyoh
-- course: ISC20/3C
-- This program displays three shapes and their names
-----------------------------------------------------------------------------------------

-- create my local variables
local textSize =50

local textObjectTriangle
local textObjectRectangle
local textObjectPentagon
local myTriangle
local myRoundedRectangle
local myPentagon
local myPentagonVertices = {-80, 0, -60, 40, 60, 40, 80, 0, 0, -60}
local textObjectsignature
local heightOfRectangle = 5
local widthOfRectangle = 3
local baseOfTriangle = 2
local heighOfTriangle = 13
local areaOfTriangle
local areaOfRoundedRectangle
-- Creates vertices for the Triangle
local myTriangleVertices = { -100, -75, 0, 150, 100, -75 }

-- set the background colour of my screen.Remember that colours are between 0 and 1.
display.setDefault("background", 204/255, 204/255, 255/255 )

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- Display a Triangle at ( 100, 100)
myTriangle = display.newPolygon(100, 100, myTriangleVertices)
myTriangle:setFillColor(179/255, 204/255, 255/255)
myTriangle.strokeWidth = 20
myTriangle:setStrokeColor (0, 0, 0)

-- anchor the Triangle in the top left corner of the screen ans set it (x,y) position
myTriangle.anchorX = 0
myTriangle.anchorY = 0
myTriangle.x = 60
myTriangle.y = 60

-- write the name of the shape on the screen.
--Take into consideration the size of the text font on the screen.
textObjectTriangle = display.newText("Triangle", 150, 350, Arial, textSize)

--sets the color of the text
textObjectTriangle:setTextColor(0, 0, 102)

-- create and display a rounded rectangle on the screen with and (x,y) value of (700,110).
myRoundedRect = display.newRoundedRect(700, 110, 300, 150, 60 )
myRoundedRect.strokeWidth = 20
myRoundedRect:setFillColor( 255/255, 204/255, 255/255 )
myRoundedRect:setStrokeColor( 0, 0, 0 )


-- write the name of the shape on the screen.Take into consideration the size of the text font on the screen.
textObjectRectangle = display.newText("Rounded Rectangle", 700, 230, Arial, textSize)
textObjectRectangle:setTextColor(0, 0, 102)



--Create and display a new shape which is a polygon with the ( x, y) of (700, 500)
myPentagon = display.newPolygon(700, 500, myPentagonVertices )
myPentagon.strokeWidth = 20
myPentagon:setFillColor( 128/255, 214/255, 214/255 )
myPentagon:setStrokeColor( 0, 0, 0 )


-- write the name of the shape on the screen.Take into consideration the size of the text font on the screen.
textObjectPentagon = display.newText("Pentagon", 700, 630, Arial, textSize)


textObjectPentagon:setTextColor(0, 0, 102)


-- display text on the screen at the position x = 300 and y = 400 with
-- a deafult font style and font size of 50
textObjectSignature = display.newText( "By: Dzifa", 200, 700, nil, 50)

-- set the color of the text
textObjectSignature:setTextColor( 153/255, 255/255, 204)

-- Formula for area of the rounded 
local areaOfRoundedRectangle = 3.14 * 15 + widthOfRectangle * heightOfRectangle

-- write the area of the Rounded Rectangle on the screen.
areaTextRect = display.newText( "The area of this rounded rectangle with the width of \n "..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRoundedRectangle .. " pixels².", 600, 300, Arial, 30)

