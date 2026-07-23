local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return static position of the first unit
return function(pathPoints, enemyID, radius, unitCountTreshold)
    for i=1,#pathPoints do
        local pathPoint = pathPoints[i].position
        local center_x = pathPoint[1]
        local center_z = pathPoint[3]
        local units = Spring.GetUnitsInRectangle(center_x-radius,center_z-radius, center_x+radius,center_z+radius, enemyID)
        if units >= unitCountTreshold then
            return pathPoints[i]
        end
    end
    return previous
end