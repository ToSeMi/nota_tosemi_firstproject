function getInfo()
	return {
		onNoUnits = SUCCESS, -- instant success
		tooltip = "Move custom group to defined position. Group is defined by table of unitID => formationIndex.",
		parameterDefs = {
			{ 
				name = "table",
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
				name = "usedUnitIndex",
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
	local table = parameter.table -- table
	local usedUnitIndex = parameter.usedUnitIndex -- number
    
	table[usedUnitIndex] = -1
	
	return SUCCESS

end


function Reset(self)
    self.initialized =false
end
