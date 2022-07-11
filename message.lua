--------------------------------------------------------------------------------
--
-- message.lua
--
--------------------------------------------------------------------------------

local message = {}
message.message = "Hello!"

function message:setMessage(message)
  self.message = "Hello World!"
end

function message:sayMessage()
  print(self.message)
end

return message
