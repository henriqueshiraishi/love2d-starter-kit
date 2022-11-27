# LÖVE: Starter Kit

Purpose of this repository is to deliver a structure of folders and files to start with LÖVE.

### Project directory structure

`\_LÖVE` include a portable LÖVE 64-bit

`\helpers` includes files that can be useful for the whole project ***(all files inside this folder are loded automatic)***

`\helpers\class.lua` a simple file that extend from Classic to represent a Class

`\helpers\game_object.lua` a simple file that extend from Class to represent a GameObject (use on objects folder)

`\helpers\group_object.lua` a simple file that extend from Class to represent a GroupObject (object management)

`\helpers\scene.lua` a simple file that extend from Class to represent a Scene (use on loaders folder)

`\loaders` folder used by [love2d-loader](https://github.com/henriqueshiraishi/love2d-loader) library to manager scenes

`\loaders\preload.lua` a simple example file

`\loaders\welcome.lua` a simple example file

`\locales` includes files that work with internationalization ***(all files inside this folder are loded automatic)***

`\locales\en.lua` a simple example file

`\objects` folder used to store GameObjects like enemies, level, etc ***(all files inside this folder are loded automatic)***

`\objects\love_heart.lua` a simple example file

`\objects\progress.lua` a simple example file

`\resources` folder used to store assets like image, font, shader, videos, etc

`\resources\love2d.png` a simple example file

`\vendors` folder used to store all project libraries

`assets_loader.lua` file used to configurate assets loader

`boot.lua` file that load helpers, locales, debug, auto-refresh, assets and objects ***(it's not necessary to change)***

`conf.lua` love configuration - [Wiki](https://love2d.org/wiki/Config_Files)

`global.lua` file used to declare all global variables and functions

`libraries.lua` file used to require all libraries from vendors folder

`main.lua` root file - [Wiki](https://love2d.org/wiki/Getting_Started)

#### Project file cycle:

1. conf.lua
2. main.lua
3. libraries.lua (loading vendors)
4. global.lua
5. boot.lua (loading helpers and locales)
6. assets_loader.lua
7. main.lua: boot load debug, auto-refresh, assets and objects
8. main.lua: set i18n
9. main.lua: set input callbacks
10. main.lua: set loaders
11. main.lua: start preload
12. main.lua: Execute afterAssetsLoaded callback (purging preload and adding welcome scene)

### Included libraries

`OO` Classic - https://github.com/rxi/classic

`Loader` Love2d-loader - https://github.com/henriqueshiraishi/love2d-loader

`tools` Lume - https://github.com/rxi/lume

`Timer` Tick - https://github.com/rxi/tick

`Tween` Flux - https://github.com/rxi/flux

`Signal` Hump.signal - https://github.com/vrld/hump

`Input` Input - https://github.com/xiejiangzhi/input

`Degub` DebugGraph - https://github.com/Mechazawa/Love-Debug-Graph

`Debug` LoveBird - https://github.com/rxi/lovebird

`Development` Lurker - https://github.com/rxi/lurker

`i18n` I18n - https://github.com/kikito/i18n.lua 

`Assets` Love-assets-loader - https://github.com/kikito/love-loader

### Recommended libraries

`Animation` - Anim8 - https://github.com/kikito/anim8

`Camera` Hump.camera - https://github.com/vrld/hump

`Debug` Editgrid - https://github.com/bakpakin/Editgrid

`Draw` Draft - https://github.com/pelevesque/draft

`Light` Lighter - https://github.com/speakk/lighter

`Physics` Breezefield - https://github.com/HDictus/breezefield

`Collision` Bump - https://github.com/kikito/bump.lua

`GUI` SUIT - https://github.com/vrld/suit
