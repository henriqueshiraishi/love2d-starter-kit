local Preload = Scene:extend()

-- Need to be require because the objects folder is only load after assets loaded
require("objects.progress")

function Preload:new()
  self.progress = GroupObject(self)
  self.progress:add(Progress())
end

function Preload:update(dt)
  self.progress:update(dt)
end

function Preload:draw()
  self.progress:draw()
end

function Preload:destroy()
  self.super.destroy(self)
  self.progress:destroy()
  self.progress = nil
end

return Preload
