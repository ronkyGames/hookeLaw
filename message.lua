--------------------------------------------------------------------------------
--
-- main.lua
--
--------------------------------------------------------------------------------

-- Your code here
-- initial settings
-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

local test = {}
test.message = "Hello!"

function test:setMessage(message)
  self.message = "Hello World!"
end

function test:sayMessage()
  print(self.message)
end

test:sayMessage()

test:setMessage("Hello World!")
test:sayMessage()
