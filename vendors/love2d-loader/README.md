# Love2d Loader

This library is based on [StackingSceneMgr](https://gitlab.com/V3X3D/love-libs/-/tree/master/StackingSceneMgr), but with a few more functions and only works if you are using [Classic](https://github.com/rxi/classic) in your project.

## Getting Started

Add the library to your project and then required the library in `main.lua`.

```lua
Loader = require "love2d-loader"
```

Loaders are just .lua files, so we need a folder to be stored in. In the example below a folder called `loaders/` has been created. 

We tell Loader to set the path to our `loaders/` folder.

```lua
Loader:setPath("loaders/")
```

## Making a loader file

A loader file must extend from the Classic library and can have :new(), :update() and :draw() methods declared.

Below is an example trailer.lua file.

```lua
local Trailer = Classic:extend()

function Trailer:new()
end

function Trailer:update(dt)
end

function Trailer:draw()
end

return Trailer
```

## Adding and running your loader

Once you have a loader file and your path set you can add the file to Loader table with the :add() function. It takes one parameter that being the loader name without the extension. It is recommended to add your first loader in main.lua's load() function.

```lua
function love.load()
  Loader:add("trailer")
end
```

Once our loader is added we can now update and draw it, this is simple enough, just call the :update() and :draw() function of Loader inside of our main.lua's update and draw functions.

```lua
function love.update(dt)
  Loader:update(dt)
end

function love.draw()
  Loader:draw()
end
```
## Removing a loader, and purging a loader

Loader contains the notion of loader removal and loader purging, lets look at the former first.

Loader removal is simply taking a loader out of Loader table, so it will no longer be updating or rendering.

```lua
Loader:remove("trailer")
```

Loader purging also does this, but takes it a step further buy garbage collecting the loader state.

```lua
Loader:purge("trailer")
```

You can also call `:removeAll()`, and `:purgeAll()` to target all loaders with these commands.

## Extras methods

```lua
-- resetAndAdd(reset, loader) removeAll or purgeAll and then add a loader
-- reset argument can be "remove" or "purge"
-- loader argument is the file loader without extension .lua
Loader:resetAndAdd("purge", "menu")

-- :reload() purgeAll and then is added all loaders again
Loader:reload()

-- :isFrozen(loader) check if a loader are freeze
Loader:isFrozen("menu")

-- :setFrozen(laoder, toggle) toggle loader's freeze
-- when a loader is frozen, :update() is not executed for that loader
Loader:setFrozen("menu", true)
```
