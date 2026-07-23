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
    local counter = 1
    local transported = {}
    bb.transportedReserve = {}
    bb.transportedIndex = {}
    for i = 1, #listOfUnits do 
        local unitID = listOfUnits[i]
        local unitDefID = Spring.GetUnitDefID(unitID)
        local unitDefName = UnitDefs[unitDefID].name
        if unitDefName == "armbox" or unitDefName == "armseer" or unitDefName == "armmart" then
            if bb.transportedIndex[unitID] == nil then 
                bb.transportedReserve[counter] = -1
                transported[counter] = unitID
                bb.transportedIndex[unitID] = true
            end
            counter = counter +1
        end
    end
    return transported
end