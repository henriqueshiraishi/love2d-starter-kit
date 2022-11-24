# LÖVE: Starter Kit

Purpose of this repository is to deliver a structure of folders and files to start with LÖVE.

### Project directory structure

`\_love` include a portable LÖVE 64-bit

`\helpers` includes files that can be useful for the whole project ***(all files inside this folder are loded automatic)***

`\helpers\class.lua` a simple file that extend from Classic to represent a Class

`\helpers\game_object.lua` a simple file that extend from Class to represent a GameObject (use on objects folder)

`\helpers\scene.lua` a simple file that extend from Class to represent a Scene (use on loaders folder)

`\helpers\color.lua` a simple file that include some methods to love.color to treat color

`\loaders` folder used by [love2d-loader](https://github.com/henriqueshiraishi/love2d-loader) library to manager scenes

`\loaders\welcome.lua` a simple example file

`\locales` includes files that work with internationalization ***(all files inside this folder are loded automatic)***

`\locales\en.lua` a simple example file

`\objects` folder used to store GameObjects like enemies, level, etc ***(all files inside this folder are loded automatic)***

`\objects\love_heart.lua` a simple example file

`\resources` folder used to store assets like image, font, shader, videos, etc

`\resources\love2d.png` a simple example file

`\vendors` folder used to store all project libraries

`boot.lua` file that load helpers, locales, debug, auto-refresh and objects ***(it's not necessary to use)***

`conf.lua` love configuration - [Wiki](https://love2d.org/wiki/Config_Files)

`global.lua` file used to declare all global variables and functions

`input_bindings.lua` file used to declare all input bindings

`libraries.lua` file used to require all libraries from vendors folder

`main.lua` root file - [Wiki](https://love2d.org/wiki/Getting_Started)

#### Project file cycle:

1. conf.lua
2. main.lua
3. libraries.lua (loading vendors)
4. global.lua
5. input_bindings.lua
6. boot.lua (loading helpers and locales)
7. main.lua: boot load debug, auto-refresh and objects
8. main.lua: set i18n
9. main.lua: set loaders
10. main.lua: execute game (welcome.lua loader using love_heart.lua game object)

### Included libraries

`OO` Classic - https://github.com/rxi/classic

`Loader` Love2d-loader - https://github.com/henriqueshiraishi/love2d-loader

`tools` Lume - https://github.com/rxi/lume

`Timer` Tick - https://github.com/rxi/tick

`Tween` Flux - https://github.com/rxi/flux

`Signal` Hump.signal - https://github.com/vrld/hump

`Input` Boipushy - https://github.com/a327ex/boipushy

`Degub` DebugGraph - https://github.com/Mechazawa/Love-Debug-Graph

`Debug` LoveBird - https://github.com/rxi/lovebird

`Development` Lurker - https://github.com/rxi/lurker

`i18n` I18n - https://github.com/kikito/i18n.lua 
