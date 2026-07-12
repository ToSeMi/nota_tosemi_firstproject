local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return group definition of peewees
return function(listOfUnits)
    local groupPosition = {}
    local counter = 1
    for i = 1, #listOfUnits do 
        local unitID = listOfUnits[i]
        local unitDefID = Spring.GetUnitDefID(unitID)
        if unitDefID ~= nil then
        local unitDefName = UnitDefs[unitDefID].name
        end
        local x,y,z = SpringGetUnitPosition(unitID)
        groupPosition[counter] = Vec3(x,y,z)
        counter = counter + 1
        
        --groupDefinition[unitID] = counter
        --groupDefinition[listOfUnits[i]] = i
    
    end
    return groupPosition
end