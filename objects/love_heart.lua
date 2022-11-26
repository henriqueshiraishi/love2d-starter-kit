LoveHeart = GameObject:extend()

function LoveHeart:new()
  self.super.new(self)
  self.class = "my-class"
  self.image = Images.love2d
  self.r = 0
  self.ox = self.image:getWidth() / 2
  self.oy = self.image:getHeight() / 2
  self.sx = 0.5
  self.sy = 0.5
  self.timer = 1
end

function LoveHeart:update(dt)
  self.r = self.r + dt * .5
  self.timer = self.timer - dt
  if math.floor(self.timer) < 0 then
    if self.sx == 0.6 then
      Tween.to(self, 1, { sx = 0.5, sy = 0.5 })
    else
      Tween.to(self, 1, { sx = 0.6, sy = 0.6 })
    end
    self.timer = 1
  end
end

function LoveHeart:draw()
  love.graphics.draw(self.image, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, self.r, self.sx, self.sy, self.ox, self.oy)
end

function LoveHeart:destroy()
  self.super.destroy(self)
  self.image = nil
  self.r = nil
  self.ox = nil
  self.oy = nil
  self.sx = nil
  self.sy = nil
  self.timer = nil
end
