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
local measureInMeters = 10
local minContentMeasure = math.min(display.contentWidth, display.contentHeight)
local meter = minContentMeasure / measureInMeters

local gameArea = display.newGroup()
gameArea.x = display.contentCenterX
gameArea.y = display.contentCenterY
local backGround = display.newRect(gameArea, 0, 0, minContentMeasure, minContentMeasure )

local function gridLine(group, x1,y1,x2,y2, strokeWidth, strokeColor)
  local principalLine = display.newLine(gameArea, x1, y1, x2, y2)
  principalLine.strokeWidth = strokeWidth
  principalLine:setStrokeColor(unpack( strokeColor))
  local perpendicolarLine = display.newLine(gameArea, -y1, x1, -y2, x2)
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
 grid(gameArea,minContentMeasure,measureInMeters,meter,2,{0,1,0,0.5})
