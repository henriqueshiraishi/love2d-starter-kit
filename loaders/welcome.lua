local Welcome = Scene:extend()

function Welcome:new()
  self.mySpace = GroupObject(self)
  self.mySpace:add(LoveHeart())
end

function Welcome:update(dt)
  self.mySpace:update(dt)
end

function Welcome:draw()
  self.mySpace:draw()
end

return Welcome
