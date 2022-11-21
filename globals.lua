--[[    Globals variables   ]]--

LOVE_ENV = 'development'

DEBUG_MODE_ON = false

DEBUG_SHOW_CONSOLE = false -- Only Windows OS
DEBUG_SHOW_FPS = true
DEBUG_SHOW_MEM = true
DEBUG_SHOW_WEB = false
DEBUG_SHOW_WEB_PORT = 8000

--[[    Globals functions   ]]--

function RecursiveEnumerate(folder, file_list)
  local items = love.filesystem.getDirectoryItems(folder)
  for _, item in ipairs(items) do
      local file = folder .. '/' .. item
      local type = love.filesystem.getInfo(file).type
      if type == "file" then
        table.insert(file_list, file)
      elseif type == "directory" then
        RecursiveEnumerate(file, file_list)
      end
  end
end

function RequireFiles(files)
  for _, file in ipairs(files) do
      local file = file:sub(1, -5)
      require(file)
  end
end
