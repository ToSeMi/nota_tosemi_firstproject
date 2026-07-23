local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return static position of the first unit
return function(pathPoints)
    local previous = nil
    for i=1,#pathPoints do
        local corridorPoint = pathPoints[i]
        if corridorPoint.ownerAllyID ~= 0 then
            break
        end
        previous = corridorPoint
    end
    return previous
end