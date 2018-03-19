-- in ~/.hammerspoon/init.lua


-- disable animation
hs.window.animationDuration = 0

-- hotkey mash
local mash       = {"ctrl", "alt"}
local mash_app 	 = {"cmd", "alt", "ctrl"}
local mash_shift = {"ctrl", "alt", "shift"}
local mash_test	 = {"cntrl", "shift"}	

local appCuts = {
  d = 'Dictionary',
  i = 'iterm',
  c = 'Google chrome',
  k = 'kitty',
  v = 'Visual Studio Code',
  f = 'Finder',
  -- 4 reserved for dash shortcut 
  s = 'Spotify',
  -- e = 'sublime text',
  -- r = 'cool-retro-term',
  -- k = 'itunes',
  --z = 'Zim',
  r = 'Rambox',
  -- k = 'Chicken'
  -- = 'openWMail'
}


-- Display Help
local function display_help()
  local t = {}
  str = "Keyboard shortcuts\n"
  table.insert(t, str)
  str = "--------------------\n"
  table.insert(t, str)
  for key, app in pairs(appCuts) do
    str = "^-Alt-Meta-"..key.."\t :\t"..app.."\n"
    --hs.alert.show(str)
    table.insert(t,str)
  end
  t = table.concat(t)
  hs.alert.show(t, 2)
end





-- Init Launch applications bindings
local function init_app_binding()
	for key, app in pairs(appCuts) do
	  hs.hotkey.bind(mash_app, key, function () hs.application.launchOrFocus(app) end)
	end
end	

local function init()
	init_app_binding()
  hs.hotkey.bind(mash_app, '/', function() display_help() end)
	-- start app launch watcher
end

init()


-- function appShortcut(modifier, character, application)
--     hs.hotkey.bind(modifier, character, function() hs.application.launchOrFocus(application) end)
--   end
  
--   local alt = {'alt'}
  
--   appShortcut(alt, 'C', 'Google Chrome')
--   appShortcut(alt, 'T', 'iTerm')
--   appShortcut(alt, 'P', 'Spotify')
--   appShortcut(alt, 'M', 'Messages')
--   appShortcut(alt, 'N', 'nvALT')
--   appShortcut(alt, 'A', 'Activity Monitor')
--   appShortcut(alt, 'L', 'Slack')
--   appShortcut(alt, 'D', 'Dash')

