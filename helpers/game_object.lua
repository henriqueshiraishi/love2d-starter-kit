GameObject = Class:extend()

function GameObject:new(args)
  self.x = 0
  self.y = 0
  self.w = 0
  self.h = 0
  self.depth = 100
  self.class = "default"
  for k, v in pairs(args) do self[k] = v end
  self.id = Lume.uuid()
  self.created_at = love.timer.getTime()
  self.dead = false
end

function GameObject:update(dt)
  
end

function GameObject:draw()
  
end

function GameObject:destroy()
  self.x = nil
  self.y = nil
  self.w = nil
  self.h = nil
  self.depth = nil
  self.class = nil
  self.id = nil
  self.created_at = nil
  self.dead = nil
  if self.group then self.group = nil end
end
