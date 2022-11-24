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
