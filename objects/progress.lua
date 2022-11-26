Progress = GameObject:extend()

function Progress:new()
  self.super.new(self)
  self.class = "preload"
  self.n_progress = 0
  self.w_progress = 0
  self.width = 0
  self.height = 25
  self.x = 0
  self.y = 0
end

function Progress:update(dt)
  self.x = love.graphics.getWidth() * 0.15
  self.y = love.graphics.getHeight() / 2 - (self.height / 2)
  self.width = love.graphics.getWidth() * 0.70
  self.n_progress = math.floor(Assets.progress)
  self.w_progress = math.floor(self.width * self.n_progress / 100)
end

function Progress:draw()
  if not Assets.loaded then
    love.graphics.print("Progress " .. self.n_progress .. "%", self.x, self.y - 20)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    love.graphics.rectangle("fill", self.x, self.y, self.w_progress, self.height)
  end
end

function Progress:destroy()
  self.super.destroy(self)
  self.n_progress = nil
  self.w_progress = nil
  self.width = nil
  self.height = nil
  self.x = nil
  self.y = nil
end
