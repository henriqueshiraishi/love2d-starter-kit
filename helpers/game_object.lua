GameObject = Class:extend()

function GameObject:new()
  self.id = Lume.uuid()
  self.class = "default"
end

function GameObject:update(dt)
  
end

function GameObject:draw()
  
end
