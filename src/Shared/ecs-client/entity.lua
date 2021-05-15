return {
	new = function()
		local entity = {
			components = {},
			tags = {},
			remove = false,
			loaded = false,
		}

		function entity:add(component)
			assert(component.__id ~= nil, "Only Components can be added to entities and Components must have an id")
			self.components[component.__id] = component
		end

		function entity:addtag(tag)
			self.tags[#self.tags + 1] = tag
		end

		function entity:destroy()
			self.remove = true
		end

		function entity:get(id)
			return self.components[id]
		end

		function entity:hastag(tag)
			for i = 1, #self.tags do
				if self.tags[i] == tag then
					return true
				end
			end
			return false
		end

		return entity
	end,
}
