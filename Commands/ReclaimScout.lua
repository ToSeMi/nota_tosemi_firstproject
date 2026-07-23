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
			-- @parameter chosenAtlas unitId - mapping unitID => positionIndex
			--[[ local example = {
				[14945] = 1,
				[5814] = 2,
				[126450] = 3,
			}
			]]--
			{ 
				name = "metalID",
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
	local metalID = parameter.metalID -- number
    
	if not Spring.ValidUnitID(scraperID) then
        return FAILURE
    end
    if not Spring.ValidFeatureID(metalID) then
        return FAILURE
    end
    
	if Spring.GetUnitTransporter(unit) ~= nil then
		return SUCCESS
	end	
	
	-- first time
	if not self.initialized then
		Spring.GiveOrderToUnit(atlas, CMD.RECLAIM,{metalID},{"shift"})
		self.initialized = true
	end
	
	return RUNNING

end


function Reset(self)
    self.initialized =false
end
