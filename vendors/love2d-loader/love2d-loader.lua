--
-- love2d-loader
--
-- Copyright (c) 2022, henriqueshiraishi
--
-- This module is free software; you can redistribute it and/or modify it under
-- the terms of the MIT license. See LICENSE for details.
--

local Loader = {
  dir       = nil,
  scenes    = {},
  boots     = {},
  current   = nil,
  previous  = nil
}

--                      --
-- Configuration Scenes --
--                      --

function Loader:setPath(path)
  assert(type(path) == "string", "Function 'setPath': parameter must be a string.")

  if path ~= "" then
    if string.byte(path, #path) ~= 47 then
      path = path .. "/"
    end
    self.dir = path
  end
end

--                       --
-- Add and Remove Scenes --
--                       --

function Loader:add(scene)
  assert(type(scene) == "string", "Function 'add': parameter must be a string.")

  if scene ~= "" and not self:sceneDefined(scene) then
    table.insert(self.scenes, scene)
    self.previous = self.current
    self.current  = scene
    if not self.boots[scene] then
      local path = self.dir .. scene
      self.boots[scene] = require(path)()
      self.boots[scene].frozen = false
    end
  end
end

function Loader:remove(scene)
  assert(type(scene) == "string", "Function 'remove': parameter must be a string.")

  for index, value in ipairs(self.scenes) do
    if value == scene then
      table.remove(self.scenes, index)
    end
  end
end

function Loader:removeAll()
  self.scenes   = {}
  self.previous = nil
  self.current  = nil
end

function Loader:purge(scene)
  assert(type(scene) == "string", "Function 'purge': parameter must be a string.")

  local path = self.dir .. scene

  self:remove(scene)
  self.boots[scene] = nil
  package.loaded[path] = nil
end

function Loader:purgeAll()
  local scenes = self.scenes
  self:removeAll()
  self.boots = {}
  for _, scene in ipairs(scenes) do
    local path = self.dir .. scene
    package.loaded[path] = nil
  end
end

function Loader:resetAndAdd(reset, scene)
  assert(type(reset) == "string", "Function 'resetAndAdd': parameter must be a string.")
  assert(type(scene) == "string", "Function 'resetAndAdd': parameter must be a string.")

  if reset == 'purge' then
    self:purgeAll()
  elseif reset == 'remove' then
    self:removeAll()
  end
  self:add(scene)
end

function Loader:reload()
  local scenes = self.scenes
  self:purgeAll()
  for _, scene in ipairs(scenes) do
    self:add(scene)
  end
end

--                             --
-- Freeze and Unfreeze a Scene --
--                             --

function Loader:isFrozen(scene)
  assert(type(scene) == "string", "Function 'isFrozen': parameter must be a string.")

  return self.boots[scene].frozen
end

function Loader:setFrozen(scene, toggle)
  assert(type(scene) == "string", "Function 'setFrozen': first parameter must be a string.")
  assert(type(toggle) == "boolean", "Function 'setFrozen': second parameter must be a boolean.")

  self.boots[scene].frozen = toggle
end

--                   --
-- Game (scene) Loop --
--                   --

function Loader:update(dt)
  assert(type(dt) == "number", "Function 'update': parameter must be a number.")

  for _, scene in ipairs(self.scenes) do
    local boot = self.boots[scene]
    if boot and not boot.frozen and self:funcDefined('update', scene) then
      boot:update(dt)
    end
  end
end

function Loader:draw()
  for _, scene in ipairs(self.scenes) do
    local boot = self.boots[scene]
    if boot and self:funcDefined('draw', scene) then
      boot:draw()
    end
  end
end

--                   --
--  Extras Function  --
--                   --

function Loader:sceneDefined(scene)
  assert(type(scene) == "string", "Function 'sceneDefined': parameter must be a string.")

  for _, value in ipairs(self.scenes) do
    if value == scene then
      return true
    end
  end
  return false
end

function Loader:funcDefined(func, scene)
  assert(type(func) == "string", "Function 'funcDefined': parameter must be a string.")
  assert(type(scene) == "string", "Function 'funcDefined': parameter must be a string.")

  if type(self.boots[scene][func]) == 'function' then
    return true
  end
  return false
end

return Loader
