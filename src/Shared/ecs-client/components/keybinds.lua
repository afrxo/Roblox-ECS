local basecomponent = require(script.Parent.Parent.component)

return {
  new = function(key, callback)
    -- We are passing in a keycode and a callback
    -- that gets invoked when the key is pressed
    local keybind = basecomponent.new('keybind')
    keybind.key = key
    keybind.callback = callback
    return keybind
  end
}