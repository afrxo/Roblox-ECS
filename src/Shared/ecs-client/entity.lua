return {
	new = function()
		local entity = {
			components = {},
			remove = false,
			loaded = false,
		}

		function entity:AddComponent(component)
			assert(component.__id ~= nil, "Only Components can be added to entities and Components must have an id")
			self.components[component.__id] = component
		end

		function entity:Destroy()
			self.remove = true
		end

		function entity:GetComponent(id)
			return self.components[id]
		end

		return entity
	end,
}
