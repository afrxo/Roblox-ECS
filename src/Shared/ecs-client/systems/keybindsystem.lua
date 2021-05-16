-- Services
local UserInputService = game:GetService("UserInputService")

local keybindsystem = {
  bindings = {}
}

-- loading in entities with keybinds into the keybind system
function keybindsystem:Load(entity)
  -- sice we have a keybind component, we can query that
  local keybind = entity:get('keybind')
  -- we can also query our states to determine if binds are loaded
  local states = entity:get('state')
  table.insert(self.bindings, keybind)
  states.bindingsloaded = true
end

-- Using the inputobject to pair up the keybinds with the pressed key
UserInputService.InputBegan:Connect(function(inputObject: InputObject)
  for _, bind in pairs(keybindsystem.bindings) do
    if bind.key == inputObject.KeyCode then
      -- we can simply call the callback method since we have that
      -- defined in the keybind
      bind.callback()
    end
  end
end)

return keybindsystem