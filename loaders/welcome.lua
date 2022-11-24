local Welcome = Scene:extend()

function Welcome:new()
  self.LoveHeart = LoveHeart()
end

function Welcome:update(dt)
  self.LoveHeart:update(dt)
end

function Welcome:draw()
  self.LoveHeart:draw()
end

return Welcome
