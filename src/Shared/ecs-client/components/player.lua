local basecomponent = require(script.Parent.Parent.component)


return {
  new = function(playerInstance: Player)
    -- We are simply extracting data from the player instance
    -- and copying it into a component
    local playercomponent = basecomponent.new('player')
    playercomponent.Instance = playerInstance
    playercomponent.Name = playerInstance.Name
    playercomponent.UserId = playerInstance.UserId
    playercomponent.Character = playerInstance.CharacterAdded:Wait()
    return playercomponent
  end
}





