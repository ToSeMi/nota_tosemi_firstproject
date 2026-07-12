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
    local counter = 1
    bb.transports = {}
    for i = 1, #listOfUnits do 
        local unitID = listOfUnits[i]
        local unitDefID = Spring.GetUnitDefID(unitID)
        local unitDefName = UnitDefs[unitDefID].name
        if unitDefName == "armatlas" then
            bb.transports[counter] = -1 --empty
            groupDefinition[counter] = unitID
            counter = counter +1
        
        end
    end
    return groupDefinition
end