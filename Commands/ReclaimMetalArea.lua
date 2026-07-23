function getInfo()
	return {
		onNoUnits = SUCCESS, -- instant success
		tooltip = "Move custom group to defined position. Group is defined by table of unitID => formationIndex.",
		parameterDefs = {
			{ 
				name = "scraperID",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			},
            { 
				name = "radius",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			}
		}
	}
end

-- speed-ups
local SpringGetUnitPosition = Spring.GetUnitPosition
local SpringGiveOrderToUnit = Spring.GiveOrderToUnit


function Run(self, units, parameter)
	local scraperID = parameter.scraperID -- number
	local radius = parameter.radius

	if not Spring.ValidUnitID(scraperID) then
        return FAILURE
    end
    
	-- first time
	if not self.initialized then
        local x,y,z = SpringGetUnitPosition(metalID)
		Spring.GiveOrderToUnit(atlas, CMD.RECLAIM,{x,y,z, radius},{"shift"})
		self.initialized = true
	end
	
	return RUNNING

end


function Reset(self)
    self.initialized =false
end
