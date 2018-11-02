-----------------------------------------------------------------------------------------
-- Title: Math Quiz
-- Name: Dzifa
-- Course: ICS2O/3C
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background color
display.setDefault("background", 255/255, 229/255,  255/255)

----------------------------------------------------------------------------------------++=
-- LOCAL VARIABLES
----------------------------------------------------------------------------------------

-- variables for the timer
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2
local heart3


-- create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject
local incorrectAnswer
local randomOperater
local numberPoints = 0
local YouWin
local CheckPoints


-------------------------------------------------------------------------------------
-- SOUNDS
--------------------------------------------------------------------------------------
-- Correct sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" ) -- Setting a variable to an mp3 file
local correctSoundChannel
local wrongSound = audio.loadSound( "Sounds/wrongSound.mp3" ) -- Setting a variable to an mp3 file
local wrongSoundChannel
local gameSound = audio.loadSound("Sounds/game.mp3")
local gameSoundChannel 
local WinSound = audio.loadSound("Sounds/Win.mp3")
local WinSoundChannel 


---------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------

local function UpdateHearts()

-- If lives are 3 then all hearts are visible
	if (lives == 3) then
   			heart1.isVisible = true
   			heart2.isVisible = true
   			heart3.isVisible = true
   			

-- If lives are 2 then display 2 hearts and make one heart disappear
   		elseif (lives == 2) then
   			heart1.isVisible = true
   			heart2.isVisible = true
   			heart3.isVisible = false

-- If lives are 1 then display 1 hearts and make two hearts disappear
   		elseif (lives == 1) then
   			heart1.isVisible = true
   			heart2.isVisible = false
   			heart3.isVisible = false
   			

-- If lives are 0 then make all the hearts disappear
   		elseif (lives == 0) then
   			heart1.isVisible = false
   			heart2.isVisible = false
   			heart3.isVisible = false
   			
   			
-- Display the game over image and play background music
   			gameOver.isVisible = true
   			gameSoundChannel = audio.play(gameSound)
   			clockText.isVisible = false
   			
   			

   			numericField.isVisible = false
   			pointsTextObject.isVisible = false
   			questionObject.isVisible = false
   		end
end


local function CheckPoints( )
-- monitor points till they reach 5
 if (numberOfPoints == 5) then
-- display the you win screen
  youWin.isVisible = true

 end
end
  
local function UpdateTime()
-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
-- It makes the seconds equal to the total amount of seconds left.
		secondsLeft = totalSeconds
		lives = lives - 1
		UpdateHearts()

	end
end

-- function that calls the timer
local function startTimer()
-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end




local function AskQuestion()
-- generate 2 random numbers between a max. and a min. number
	randomOperator = math.random(1,5)
	randomNumber1 = math.random(1,20)
	randomNumber2 = math.random(1,20)
	randomNumber3 = math.random(1,10)
	randomNumber4 = math.random(1,100)
	

-- if the random operator is one then do addition
	if (randomOperator == 1) then
 		
 		correctAnswer = randomNumber1 + randomNumber2

	
--create question text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

-- If it is 2 the do subtraction
	elseif (randomOperator == 2) then
	

		if (randomNumber1 < randomNumber2) then
			questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
	 	    correctAnswer = randomNumber2 - randomNumber1

		else
	 		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
	 	    correctAnswer = randomNumber1 - randomNumber2

	 	end
		


	elseif (randomOperator == 3) then
	 	correctAnswer = randomNumber1 * randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	elseif (randomOperator == 4) then
	 	correctAnswer = randomNumber1 / randomNumber2


		--create question in text object
		questionObject.text = randomNumber1 .. " /" .. randomNumber2 .. " = "


	end	

end


-- Hide correct object
local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

-- Hide incorrect object
local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end


local function NumericFieldListener( event )

-- User begins editing " numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then


-- when the answer is submitted( enter key is pressed ) set user input to user's answer
			userAnswer = tonumber(event.target.text)


-- if the users answer and the correct answer are the same:
			if (userAnswer == correctAnswer) then
				correctObject.isVisible = true		
				UpdateTime()

				correctSoundChannel = audio.play(correctSound)	
				timer.performWithDelay(2000, HideCorrect)
				numberPoints = numberPoints + 1

				    -- create increasing points in the text object
			 	pointsTextObject.text = "Points = ".. numberPoints

-- If the users answer is incorrect, Incorrect is displayed
			else			
				incorrectObject.isVisible = true
				wrongSoundChannel = audio.play(wrongSound)
				lives = lives - 1
				UpdateHearts()	
				timer.performWithDelay(2000, HideIncorrect)

			end

		event.target.text = ""
     end
end


---------------------------------------------------------------------
-- OBJECT CREATION
---------------------------------------------------------------------

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

-- Display the game over screen
gameOver = display.newImageRect("Images/gameOver.png", display.contentWidth, display.contentHeight)
gameOver.anchorX = 0
gameOver.anchorY = 0
gameOver.isVisible = false

-- Display the YouWin screen
YouWin = display.newImageRect("Images/YouWin.png", display.contentWidth, display.contentHeight)
YouWin.anchorX = 0
YouWin.anchorY = 0
YouWin.isVisible = false

-- display a question and sets the color 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/1.5, nil, 70 )
questionObject:setTextColor(155/255, 42/255, 198/255)  


-- Create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*1/3, nil, 50 )
correctObject:setTextColor(0,0,0)
correctObject.isVisible = false

-- Create the correct text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*1/3, nil, 50 )
incorrectObject:setTextColor(0,0,0)
incorrectObject.isVisible = false

-- create a points box and make it visible
pointsTextObject = display.newText( "Points = ".. numberPoints, 800, 385, nil, 50 )
pointsTextObject:setTextColor(155/255, 42/255, 198/255)


-- Create numeric field
numericField = native.newTextField( display.contentWidth/1.5, display.contentHeight/1.5, 200, 200 )
numericField.inputType = "default"

-- add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener )

-- add a clock
clockText = display.newText(secondsLeft, 100, 650, native.systemFontBold, 100)
clockText:setFillColor( 0/255, 0/255, 153/255 )


-------------------------------------------------------------------------------------
-- FUNCTION CALLS
-------------------------------------------------------------------------------------

-- call the function to ask question
AskQuestion()

-- call the function to start timer
startTimer()