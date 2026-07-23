local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return group definition of the attack group
return function(listOfUnits)
    local groupDefinition = {}
    local counter = 1
    for i = 1, #listOfUnits do 
        local unitID = listOfUnits[i]
        local unitDefID = Spring.GetUnitDefID(unitID)
        local unitDefName = UnitDefs[unitDefID].name
        if unitDefName ~= "armpw" then
            if unitDefName == "armthovr" then
                groupDefinition[unitID] = counter
                counter = counter + 1
            end
        end
        --groupDefinition[unitID] = counter
        --groupDefinition[listOfUnits[i]] = i
    
    end
    return groupDefinition
end