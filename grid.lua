--------------------------------------------------------------------------------
--
-- main.lua grid
--
--------------------------------------------------------------------------------
-- color palette: https://colorhunt.co/palette/2c36393f4e4fa27b5cdcd7c9
-- background : rgb(44, 54, 57)
-- object backGround: rgb(63, 78, 79)
-- text bold : rgb(162, 123, 92)
-- text : rgb(220, 215, 201)
-- Your code here
-- initial settings
-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )
-- set the color of the backGround
local backGround = {}
backGround.key = "background"
backGround.color = {}
backGround.color.r = 44/255
backGround.color.g = 54/255
backGround.color.b = 57/255
backGround.color.alpha = 1
display.setDefault( backGround.key, backGround.color.r, backGround.color.g, backGround.color.b, backGround.color.alpha )
-- set unit of measure
local measureInMeters = 20
local minContentMeasure = math.min(display.contentWidth, display.contentHeight)
local meter = minContentMeasure / measureInMeters

local gameArea = backGround
gameArea.group = display.newGroup()
gameArea.group.x = display.contentCenterX
gameArea.group.y = display.contentCenterY
gameArea.backGround = display.newRect(gameArea.group, 0, 0, minContentMeasure, minContentMeasure )
gameArea.color.r = 63/255
gameArea.color.g = 78/255
gameArea.color.b = 79/255
gameArea.backGround:setFillColor(gameArea.color.r,gameArea.color.g,gameArea.color.b)



local function gridLine(group, x1,y1,x2,y2, strokeWidth, strokeColor)
  local principalLine = display.newLine(group, x1, y1, x2, y2)
  principalLine.strokeWidth = strokeWidth
  principalLine:setStrokeColor(unpack( strokeColor))
  local perpendicolarLine = display.newLine(group, -y1, x1, -y2, x2)
  perpendicolarLine.strokeWidth = strokeWidth
  perpendicolarLine:setStrokeColor(unpack( strokeColor))

end

local function grid(group,measure, count, unit, strokeWidth, strokeColor)
  -- vertical lines
  local A = {}
  A.x = -measure / 2
  A.y = -measure / 2

  local B = {}
  B.x = -measure / 2
  B.y = measure / 2
  gridLine(group, A.x,A.y,B.x,B.y, strokeWidth,strokeColor)
  for i=1,count do
    A.x = A.x + unit
    B.x = A.x
    gridLine(group, A.x,A.y,B.x,B.y, strokeWidth,strokeColor)
  end
end
 grid(gameArea.group,minContentMeasure,measureInMeters,meter,2,{162/255,123/255,92/255,0.5})
