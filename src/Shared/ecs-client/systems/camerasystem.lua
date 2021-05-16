local UserInputService = game:GetService("UserInputService")

local camerasystem = {}

-- Constants
local THIRD_PERSON_CAM_OFFSET = CFrame.new(2, 0, 8.5)

function camerasystem:Update(step, entity)
  -- Querying our components again
	local Player = entity:GetComponent("player")
	local States = entity:GetComponent("state")

  -- Checking to see if the player is in cam mide
	if States.inCamMode and States.bindingsloaded then
		workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
    -- Here we can use Player.Character since we
    -- have that defined in our player component
		workspace.CurrentCamera.CFrame = Player.Character.PrimaryPart.CFrame * THIRD_PERSON_CAM_OFFSET
		UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
	else
    -- If we are not in cam mode we want to go back to normal camera
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	end
end

return camerasystem
