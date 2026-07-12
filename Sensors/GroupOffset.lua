local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return positions of the units given their 
return function(listOfPositions, offset, wind)
    
    local group = {}
    local offsetMultiplier = 1
    local sgn = 1
    group[1] = Vec3(0,0,0)
    for i = 2, #listOfPositions do 
        group[i] = Vec3(sgn*offsetMultiplier*offset * wind["normDirZ"],sgn*offsetMultiplier*offset * wind["normDirY"],sgn*offsetMultiplier*offset * wind["normDirX"])
        sgn = -1 * sgn
        if i%2 == 1 then
            offsetMultiplier = offsetMultiplier + 1
        end    
    end
    return group
end