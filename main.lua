require("libraries")      -- Load libraries (load vendors)
require("globals")        -- Load globals variables and functions
require("input_bindings") -- Load input bindings
require("boot")           -- Load boot file (load helpers and locales)

function love.load()
  -- Set boot (load debug, auto-refresh and objects)
  Boot:load()

  -- Set i18n
  I18n.setLocale("en")

  -- Set loader and adding scene
  Loader:setPath("loaders")
  Loader:add("welcome")
end

function love.update(dt)
  -- Declare update methods
  Boot:update(dt)
  Timer.update(dt)
  Tween.update(dt)
  Loader:update(dt)
end

function love.draw()
  -- Declare draw methods
  Boot:draw()
  Loader:draw()
end
