-- stuff to always load/set first
hs.window.animationDuration = 0
hs.window.setShadows(false)


-- perhist console history across launches
hs.shutdownCallback = function() hs.settings.set('history', hs.console.getHistory()) end
hs.console.setHistory(hs.settings.get('history'))

-- helpful aliases
i = hs.inspect
fw = hs.window.focusedWindow
fmt = string.format
bind = hs.hotkey.bind
clear = hs.console.clearConsole
reload = hs.reload
pbcopy = hs.pasteboard.setContents
std = hs.stdlib and require("hs.stdlib")
aw = hs.window.all


-- useful keybindings
hyper = {'⌘', '⌥', '⌃'}
hyper_s = {'⌘', '⌥', '⌃', 'shift'}
bind(hyper, ",", hs.toggleConsole)
bind(hyper, '.', hs.hints.windowHints)



-- asm spaces DOESN'T SEEMT TO WORK

-- spaces = require("hs.spaces")
-- mts = hs.spaces.moveWindowToSpace DOESN'T WORK
-- bind(hyper_s, "2", mts(fw,5))

-- Layout
laptop = "Built-in Retina Display"

local layout_code= {
  {"Google Chrome", nil, laptop,    hs.layout.right50,   nil, nil},
  {"VSCodium",      nil, laptop,    hs.layout.left50,    nil, nil},
}

hs.hotkey.bind(hyper_s, '1', function()
  hs.application.launchOrFocus('Google Chrome')
  hs.application.launchOrFocus('VSCodium')

  hs.layout.apply(layout_code)
end)



-- vim sometimes


local function pressFn(mods, key)
	if key == nil then
		key = mods
		mods = {}
	end

	return function() hs.eventtap.keyStroke(mods, key, 1000) end
end

local function remapvim(mods, key, pressFn)
	hs.hotkey.bind(mods, key, pressFn, nil, pressFn)	
end


remapvim({'alt'}, 'h', pressFn('left'))
remapvim({'alt'}, 'j', pressFn('down'))
remapvim({'alt'}, 'k', pressFn('up'))
remapvim({'alt'}, 'l', pressFn('right'))


-- window management


-- define window movement/resize operation mappings
local arrowMap = {
    j = { half = { 0, 0, 1,.5}, movement = { 0,-20}, complement = "j", resize = "Shorter" }, -- Up
    k = { half = { 0,.5, 1,.5}, movement = { 0, 20}, complement = "l", resize = "Taller" },  -- Down
    h = { half = { 0, 0,.5, 1}, movement = {-20, 0}, complement = "k", resize = "Thinner" }, -- Left
    l = { half = {.5, 0,.5, 1}, movement = { 20, 0}, complement = "j", resize = "Wider" }, -- Right
  }
  
  -- compose screen quadrants from halves
  local function quadrant(t1, t2)
    return {t1[1] + t2[1], t1[2] + t2[2], .5, .5}
  end
  
  -- move and/or resize windows
  local function rect(rect)
    return function()
      undo:push()
      local win = fw()
      if win then win:move(rect) end
    end
  end
  
  -- center and enlarge current window; hold to maximize
  bind(hyper, "space", rect({1/8, 1/8, 3/4, 3/4}), nil, rect({0, 0, 1, 1}))
  
  -- arrow-based window movement/resize operations
  hs.fnutils.each({"h", "l", "j", "k"}, function(arrow)
  
      bind(hyper, arrow, -- set to screen halves; hold for quadrants
        rect(arrowMap[arrow].half),
        nil,
        rect(quadrant(arrowMap[arrow].half, arrowMap[arrowMap[arrow].complement].half))
      )
     
      bind({"ctrl", "cmd"}, arrow, -- move windows incrementally
        rect(arrowMap[arrow].movement),
        nil,
        rect(arrowMap[arrow].movement)
      )
  
      bind({"ctrl", "alt"}, arrow, -- move windows by grid increments
        function() undo:push(); hs.grid['pushWindow'..arrow](fw()) end
      )
  
      bind({"ctrl", "alt", "shift"}, arrow, -- resize windows by grid increments
        function() undo:push(); hs.grid['resizeWindow'..arrowMap[arrow].resize](fw()) end
      )
  
    end)
  
  -- window grid configuration
  hs.grid.setGrid("6x4")
  hs.grid.setMargins({5, 5})
  bind(hyper, '/', function()
      local gridSize = hs.grid.getGrid()
      hs.grid.setGrid("3x3")
      hs.grid.show(function() hs.grid.setGrid(gridSize) end)
    end)
  
  -- undo for window operations
  undo = {}
  
  function undo:push()
    local win = fw()
    if win and not undo[win:id()] then
      self[win:id()] = win:frame()
    end
  end
  
  function undo:pop()
    local win = fw()
    if win and self[win:id()] then
      win:setFrame(self[win:id()])
      self[win:id()] = nil
    end
  end
  
  bind({"ctrl", "alt"}, "z", function() undo:pop() end)

  -- bind application hotkeys
hs.fnutils.each({
    { key = "q", app = "kitty" },
    { key = "w", app = "VSCodium" },
    { key = "e", app = "Google Chrome" },
    
    { key = "s", app = "Spotify" },
    { key = "a", app = "Whatsapp" },
    { key = "d", app = "Telegram" },
    { key = "f", app = "Finder" }
  }, function(item)

    local appActivation = function()
      hs.application.launchOrFocus(item.app)

      local app = hs.appfinder.appFromName(item.app)
      if app then
        app:activate()
        app:unhide()
      end
    end

    hs.hotkey.bind(hyper, item.key, appActivation)
  end)

-----------------------------
--- Show ALL FINDER WINDOWS -
-----------------------------

function applicationWatcher(appName, eventType, appObject)
  if (eventType == hs.application.watcher.activated) then
    if (appName == "Finder") then
      -- Bring all Finder windows forward when one gets activated
      appObject:selectMenuItem({"Window", "Bring All to Front"})
    end
  end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()




-----------------------------
--  Customization Options  --
-----------------------------

local delay = 0.1 -- In seconds


-- Press Cmd+Q twice to quit. Closw Window reminder

local quitModal = hs.hotkey.modal.new('cmd','q')

function quitModal:entered()
    hs.alert.show("Cmd+Quit. Cmd+Window. Cmd+minimizE", 1)
    hs.timer.doAfter(1, function() quitModal:exit() end)
end

local function doQuit()
    local app = hs.application.frontmostApplication()
    app:kill()
end

local function closeW()
    local wind = hs.window.focusedWindow()
    wind:close()
end

local function minW()
  local wind = hs.window.focusedWindow()
  wind:minimize()
end

quitModal:bind('cmd', 'q', doQuit)
quitModal:bind('cmd', 'w', closeW)
quitModal:bind('cmd', 'e', minW)

quitModal:bind('', 'escape', function() quitModal:exit() end)


-- Auto reload Hammerspoon config

local module = {}

module.reload = function()
  module.configFileWatcher:stop()
  hs.reload()
end

module.configFileWatcher = hs.pathwatcher.new(
    os.getenv("HOME") .. "/.hammerspoon/",
    module.reload
)
module.configFileWatcher:start()

return module

