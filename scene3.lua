---------------------------------------------------------------------------------
--
-- scene.lua
--
---------------------------------------------------------------------------------

local sceneName = ...

local composer = require( "composer" )
local physics=require("physics")
local widget=require("widget")
-- Load scene with same root filename as this file
 local scene = composer.newScene( scene4 )

---------------------------------------------------------------------------------

--local nextSceneButton

function scene:create( event )
    local sceneGroup = self.view

    -- Called when the scene's view does not exist
    -- 
    -- INSERT code here to initialize the scene
    -- e.g. add display objects to 'sceneGroup', add touch listeners, etc
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
	
	
	--Runtime:removeEventListener("onEvent",handleplayButtonEvent)
	
	
		
        --[[ Called when the scene is still off screen and is about to move on screen
        local title = self:getObjectByTag( "Title" )
		title.x = display.contentWidth / 2
		title.y = display.contentHeight / 2
        title.size = display.contentWidth / 10
        local goToScene1Btn = self:getObjectByTag( "GoToScene1Btn" )
        goToScene1Btn.x = display.contentWidth - 95
        goToScene1Btn.y = display.contentHeight - 35
        local goToScene1Text = self:getObjectByTag( "GoToScene1Text" )
        goToScene1Text.x = display.contentWidth - 92
        goToScene1Text.y = display.contentHeight - 35--]]
    elseif phase == "did" then
	physics.start()
	physics.setDrawMode("normal")
	
	
	rightWall=display.newRect(display.contentWidth-(display.contentWidth/20),0,1,display.contentHeight+display.contentHeight)
	leftWall=display.newRect(display.contentWidth/20,0,1,display.contentHeight+display.contentHeight)
	bottomWall=display.newRect(0, display.contentHeight-(display.contentHeight/16), display.contentWidth+display.contentWidth,1)
	cellingWall=display.newRect(0, display.contentHeight/9-55, display.contentWidth+display.contentWidth, 1)
	
	physics.addBody ( rightWall, "static", { bounce = 0.1 })
	physics.addBody ( leftWall, "static", { bounce = 0.1 })
	physics.addBody ( bottomWall, "static", { bounce = 0.1 })
	physics.addBody ( cellingWall, "static", { bounce = 0.1 })
	
	
	main_background=display.newImageRect("Desert.jpg",display.contentWidth,display.contentHeight)
	main_background.x=display.contentWidth/2
	main_background.y=display.contentHeight/2
	
	ball=display.newImageRect("ball.png",display.contentWidth/4,display.contentHeight/4)
	ball.x=display.contentWidth/2
	ball.y=display.contentHeight/2
	physics.addBody(ball,"dynamic",{bounce=0.1,friction=0.1,density=0.1,radius=25})
	
	barB=display.newImageRect("bar.png",display.contentWidth/4,display.contentHeight/8)
	barB.surfaceType="bounce"
	barB.x=display.contentWidth/2
	barB.y=display.contentHeight/2+display.contentHeight/2.5
	physics.addBody(barB,"static",{bounce=0.5})
	
	barU=display.newImageRect("bar.png",display.contentWidth/4,display.contentHeight/8)
	barU.surfaceType="bounce"
	barU.x=display.contentWidth/2
	barU.y=display.contentHeight/2-display.contentHeight/2.5
	physics.addBody(barU,"static",{bounce=0.5})
	
	
	counter1 = 0
		function onCollision(self,barB)	
			local collideObject = barB.other
			if ( collideObject.surfaceType == "bounce" ) then
				if barB.contact ~= nil then
					barB.contact.bounce =2  --magnify bounce for this specific collision
				end
				counter1 = counter1 + 1
				counterText=counter1
				
				display.newText(counterText,200,200,native.systemFont,16)
				--display.remove(counterText)
			end
		end

		ball.collision = onCollision
		ball:addEventListener( "collision", ball )
	
	
	
	--[[if ball.y>bar.y then
	local game_over=display.newText("gameover",200,100,native,systemFont,16)
	end
	
	barPosition = display.contentWidth/2;
	
	function handleRightButtonEvent(event)
		
		if(event.phase)then
			barPosition = barPosition + 10
			if(barPosition>280)then
			barPosition=279
			
			end
			transition.moveTo(bar,{x=barPosition,0})
		end
	
	
	
	end
	rightButton=widget.newButton
	
	{
		width = 100,
		height = 40,
		defaultFile = "back-button-world1.png",
		overFile = "back-button-world1-clicked.png",
		onEvent = handleRightButtonEvent
	
	}
	    rightButton.x = display.contentWidth/2+display.contentWidth/3
		rightButton.y = display.contentHeight/2+display.contentHeight/2
	
	
	function handleLeftButtonEvent(event)
		barPosition = barPosition -10
		if(barPosition<35)then
		barPosition=36--cont. here
		end
		if(event.phase)then
		
		transition.moveTo(bar,{x=barPosition,0})
		end


	end

	leftButton=widget.newButton
	
	{
		width = 100,
		height = 40,
		defaultFile = "back-button-world1.png",
		overFile = "back-button-world1-clicked.png",
		onEvent = handleLeftButtonEvent
	
	}
	
	leftButton.x=display.contentWidth/2-display.contentWidth/3
	leftButton.y=display.contentHeight/2+display.contentHeight/2
	
	
	--]]
        
    end 
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
        
    elseif phase == "did" then
        
    end 
end


function scene:destroy( event )
    local sceneGroup = self.view

   
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
