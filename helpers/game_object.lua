GameObject = Class:extend()

function GameObject:new()
  self.id = Lume.uuid()
  self.class = "default"
  self.dead = false
end

function GameObject:update(dt)
  
end

function GameObject:draw()
  
end

function GameObject:destroy()
  self.id = nil
  self.class = nil
  self.dead = nil
  if self.group then self.group = nil end
end
