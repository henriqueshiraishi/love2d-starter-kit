--[[
  Check full documentation https://github.com/kikito/love-loader

  Assets.newImage(holder, key, path) -- Adds a new image to the list of images to load
  Assets.newSource(holder, key, path, sourceType) -- Adds a new source to the list of sources to load
  Assets.newFont(holder, key, path) -- Adds a new font to the list of fonts to load

  sourceType: 'static' or 'stream'

  Assets.progress -- Return progress percentage
  Assets.loaded -- Return a boolean is the load finished or not
  Assets.loadedCount -- Assets quantity was loaded
  Assets.resourceCount -- Assets quantity to be loaded

  Example of use:

  -- Adding assets to holder
  Images = {}
  Assets.newImage(Images, "love2d", "resources/love2d.png")

  -- Calling loaded assets
  Images.love2d

]]--

-- Holders (you can manage the holder)
Images = {}
Sounds = {}
Fonts  = {}

-- Adding assets to holder
Assets.newImage(Images, "love2d", "resources/love2d.png")

----- Just forcing to show progress bar working
for i = 1, 25, 1 do
  Assets.newImage(Images, "love2d" .. i, "resources/love2d.png")
end
