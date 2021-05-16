local Player = game:GetService("Players").LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local ECS = ReplicatedStorage:WaitForChild("ecs-client")

-- Loading in all our systems (i would make a sys-loader for this!)

local camerasystem = require(ECS.systems.camerasystem)
local keybindsystem = require(ECS.systems.keybindsystem)

-- Loading in all our components (again i would make a comp-loader for this!)

local playerComponent = require(ECS.components.player)
local keybindComponent = require(ECS.components.keybinds)
local stateComponent = require(ECS.components.state)
local entity = require(ECS.entity)

-- Creating our PlayerEntity

local PlayerEntity = entity.new()

-- Here we are adding the player component to the player entity
-- the player component stores information about the player
PlayerEntity:AddComponent(playerComponent.new(Player))

-- Here we are adding a  stateful-component to the player entity
PlayerEntity:AddComponent(stateComponent.new())

-- Here we are binding creating keybinds
PlayerEntity:AddComponent(keybindComponent.new(Enum.KeyCode.E, function()
  -- we can simply query our player state since by using PlayerEntity:get('state')
  -- and change the state

	local state = PlayerEntity:GetComponent("state")
	state.inCamMode = not state.inCamMode
end))

-- Loading our keybinds into the keybind system to avoid any weird behaviours
keybindsystem:Load(PlayerEntity)

-- Here we are updating our player entity before every frame for smooth camera movement
RunService.RenderStepped:Connect(function(step)
	camerasystem:Update(step, PlayerEntity)
end)
