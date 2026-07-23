local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return get the list of the visible units
return function(listOfEnemies, teamID)
    local visibleEnemies = Spring.GetVisibleUnits(teamID)
    for i = 1, #visibleEnemies do
            local x,y,z=SpringGetUnitPosition(visibleEnemies[i])
            listOfEnemies[visibleEnemies[i]] = Vec3(x,y,z)
    end
    return listOfEnemies
end