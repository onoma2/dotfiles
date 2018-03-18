-- in ~/.hammerspoon/init.lua

function appShortcut(modifier, character, application)
    hs.hotkey.bind(modifier, character, function() hs.application.launchOrFocus(application) end)
  end
  
  local alt = {'alt'}
  
  appShortcut(alt, 'C', 'Google Chrome')
  appShortcut(alt, 'T', 'iTerm')
  appShortcut(alt, 'P', 'Spotify')
  appShortcut(alt, 'M', 'Messages')
  appShortcut(alt, 'N', 'nvALT')
  appShortcut(alt, 'A', 'Activity Monitor')
  appShortcut(alt, 'L', 'Slack')
  appShortcut(alt, 'D', 'Dash')