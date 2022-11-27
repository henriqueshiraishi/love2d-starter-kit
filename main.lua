require("libraries")      -- Load libraries (load vendors)
require("global")         -- Load global variables and functions
require("boot")           -- Load boot file (set assets loader and load helpers and locales)
require("assets_loader")  -- Load assets settings

-- After assets loaded callback (useful to start the first scene game after load)
Assets.afterAssetsLoaded = function()
  -- Purge and adding scene
  Loader:purge("preload")
  Loader:add("welcome")
end

function love.load()
  -- Set boot (load debug, auto-refresh, assets and objects)
  Boot:load()

  -- Set i18n
  I18n.setLocale("en")

  -- Set input callbacks
  Input.bind_callbacks()

  -- Set loader and adding load scene
  Loader:setPath("loaders")
  Loader:add("preload")
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
