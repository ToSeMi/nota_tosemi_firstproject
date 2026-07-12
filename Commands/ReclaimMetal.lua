function getInfo()
	return {
		onNoUnits = SUCCESS, -- instant success
		tooltip = "Move custom group to defined position. Group is defined by table of unitID => formationIndex.",
		parameterDefs = {
			{ 
				name = "chosenAtlas",
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
				name = "selectedUnit",
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
	local atlas = parameter.chosenAtlas -- number
	local unit = parameter.selectedUnit -- number
    
	if not Spring.ValidUnitID(unit) then
        return FAILURE
    end
    if not Spring.ValidUnitID(atlas) then
        return FAILURE
    end
    
	if Spring.GetUnitTransporter(unit) ~= nil then
		return SUCCESS
	end	
	
	-- first time
	if not self.initialized then
		Spring.GiveOrderToUnit(atlas, CMD.RECLAIM,{unit},{"shift"})
		self.initialized = true
	end
	
	return RUNNING

end


function Reset(self)
    self.initialized =false
end
