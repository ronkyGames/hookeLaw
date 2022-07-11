--------------------------------------------------------------------------------
--
-- main.lua
--
--------------------------------------------------------------------------------

-- Your code here
-- initial settings
-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

local test = require("message")

test:sayMessage()

test:setMessage("Hello World!")
test:sayMessage()
