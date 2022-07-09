--------------------------------------------------------------------------------
--
-- main.lua
--
--------------------------------------------------------------------------------

-- Your code here
-- Set unit of a meter
local minContentMeasure = math.min(display.contentWidth, display.contentHeight)
local meter = minContentMeasure / 10
-- Draw a spring
local spring = display.newGroup()
-- set the group origin at the center of the screen
spring.x = display.contentCenterX
spring.y = display.contentCenterY
local O = {}
O.x = 0
O.y = 0
local A = {}
A.x = 0
A.y = meter/2
local B = {}
B.x = 0
B.y = -meter/2
local wall = display.newLine( spring, A.x, A.y, B.x, B.y )
wall.strokeWidth = 8
local C = {}
C.x = O.x+meter/4
C.y = O.y
local springPart = display.newLine( spring, O.x, O.y, C.x, C.y )
-- the spring
local precision = 100
local curls = 10

local function drawCurl(start)
  for i = 1, precision do
    B.x = start.x + meter/curls * i / precision
    B.y = start.y + meter/3 * math.sin(2 * math.pi * i / precision)
    springPart:append(B.x, B.y)
  end
  return B
end

-- make a curl
local curl

-- make spring
for i=1,curls do
  curl = drawCurl(C)
  C.x = curl.x
end
-- make hooking
C.x = C.x + meter/4
springPart:append(C.x,C.y)
springPart.strokeWidth = 2
