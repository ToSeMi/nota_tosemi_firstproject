local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return static position of the first unit
return function(listOfUnits)
    local groupDefinition = {}
    local counter = 2
    for i = 1, #listOfUnits do 
        local unitID = listOfUnits[i]
        local unitDefID = Spring.GetUnitDefID(unitID)
        local unitDefName = UnitDefs[unitDefID].name
        if unitDefName == "armmav" then
            groupDefinition[unitID] = 1
        else
            groupDefinition[unitID] = counter
            counter = counter + 1
        --groupDefinition[listOfUnits[i]] = i
        end
    end
    return groupDefinition
end