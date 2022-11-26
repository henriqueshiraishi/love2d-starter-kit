GameObject = Class:extend()

function GameObject:new()
  self.id = Lume.uuid()
  self.class = "default"
  self.dead = false
  self.depth = 100
  self.created_at = love.timer.getTime()
  self.x = 0
  self.y = 0
  self.w = 0
  self.h = 0
end

function GameObject:update(dt)
  
end

function GameObject:draw()
  
end

function GameObject:destroy()
  self.id = nil
  self.class = nil
  self.dead = nil
  self.depth = nil
  self.created_at = nil
  self.x = nil
  self.y = nil
  self.w = nil
  self.h = nil
  if self.group then self.group = nil end
end
