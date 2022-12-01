Progress = GameObject:extend()

function Progress:new(args)
  args = args or {}
  self.super.new(self, args)

  self.class = "preload"
  self.n_progress = 0
  self.w_progress = 0
  self.w = 0
  self.x = 0
  self.y = 0
end

function Progress:update(dt)
  self.x = love.graphics.getWidth() * 0.15
  self.y = love.graphics.getHeight() / 2 - (self.h / 2)
  self.w = love.graphics.getWidth() * 0.70
  self.n_progress = math.floor(Assets.progress)
  self.w_progress = math.floor(self.w * self.n_progress / 100)
end

function Progress:draw()
  if not Assets.loaded then
    local info = I18n("loading") .. ": " .. self.n_progress .. "% (" .. Assets.loadedCount .. "/" .. Assets.resourceCount .. ")"
    love.graphics.print(info, self.x, self.y - 20)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    love.graphics.rectangle("fill", self.x, self.y, self.w_progress, self.h)
  end
end

function Progress:destroy()
  self.super.destroy(self)
  self.n_progress = nil
  self.w_progress = nil
  self.w = nil
  self.h = nil
  self.x = nil
  self.y = nil
end
