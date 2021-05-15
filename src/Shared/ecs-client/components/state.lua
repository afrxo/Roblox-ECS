local basecomponent = require(script.Parent.Parent.component)

return {
  new = function()
    local states = basecomponent.new('state')
    -- We are going to be using the inCamMode state
    -- to check wether the player is in cam mode
    -- and the bindingsloaded to avoid camera simulation
    -- before the bindings are loaded
    states.inCamMode = false
    states.bindingsloaded = false
    return states
  end
}