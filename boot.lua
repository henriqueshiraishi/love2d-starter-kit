local BootModule = Classic:extend()

function BootModule:new()
  -- Load global helpers files
  local helpers_files = {}
  RecursiveEnumerate('helpers', helpers_files)
  RequireFiles(helpers_files)

  -- Load global locales files
  local locales_files = {}
  RecursiveEnumerate('locales', locales_files)
  RequireFiles(locales_files)
end

function BootModule:load()
  if DEBUG_MODE_ON then
    -- Load debug module
    if DEBUG_SHOW_CONSOLE and love.system.getOS() == "Windows" then love._openConsole() end
    if DEBUG_SHOW_FPS then self.fpsGraph = DebugGraph:new("fps", 0, 0) end
    if DEBUG_SHOW_MEM then self.memGraph = DebugGraph:new("mem", 0, 30) end
    if DEBUG_SHOW_WEB then
      LoveBird.port = DEBUG_SHOW_WEB_PORT or 8000
      love.system.openURL("http://127.0.0.1:" .. LoveBird.port)
    end
  end

  if LOVE_ENV == 'development' then
    -- Reload loader when a file is modified
    Lurker.postswap = function() Loader:reload() end
    Lurker.interval = 0.5
  end

  -- Load global locales files
  local objects_files = {}
  RecursiveEnumerate('objects', objects_files)
  RequireFiles(objects_files)
end

function BootModule:update(dt)
  -- Declare update methods
  if DEBUG_MODE_ON then
    if DEBUG_SHOW_FPS then self.fpsGraph:update(dt) end
    if DEBUG_SHOW_MEM then self.memGraph:update(dt) end
    if DEBUG_SHOW_WEB then LoveBird.update() end
  end

  if LOVE_ENV == 'development' then
    Lurker.update()
  end
end

function BootModule:draw()
  -- Declare draw methods
  if DEBUG_MODE_ON then
    if DEBUG_SHOW_FPS then self.fpsGraph:draw() end
    if DEBUG_SHOW_MEM then self.memGraph:draw() end
  end
end

Boot = BootModule()
