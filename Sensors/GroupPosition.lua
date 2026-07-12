local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return position of the maverick + the wind. 
return function(listOfUnits, wind, offset)
    for i = 1, #listOfUnits do
        local unitID = listOfUnits[i]
        local unitDefID = Spring.GetUnitDefID(unitID)
        local unitDefName = UnitDefs[unitDefID].name
        if unitDefName == "armmav" then
            local x,y,z = SpringGetUnitPosition(unitID)
            local returnable = Vec3(x + wind["dirX"] * offset,y,z + wind["dirZ"] * offset)    
            return returnable
        end
    end
    return Vec3(0,0,0)
end