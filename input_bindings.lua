--[[
  
  Full documentation: https://github.com/a327ex/boipushy
  Example to create a key bind:
    
    -- Input:bind(key, action)
    Input:bind("space", "fire")
    Input:bind("mouse1", "fire")
    Input:bind("s", "shield")
    Input:bind("mouse2", "shield")

  Example to check if an action is pressed/released/down:

    if Input:pressed("fire") then print("The space or mouse1 was pressed!") end
    if Input:released("fire") then print("The space or mouse1 was released!") end
    if Input:down("shield") then print("The s or mouse2 was down!") end

  Example to unbind a key:

    -- Input:unbind(key)
    Input:unbind("space")
    Input:unbind("mouse1")
    Input:unbind("s")
    Input:unbind("mouse2")

  Full list constant key: https://www.love2d.org/wiki/KeyConstant
  Some constant key was modified: https://github.com/a327ex/boipushy#keymousegamepad-constants

]]--
