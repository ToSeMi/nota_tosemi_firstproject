local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return group definition of peewees
return function(listOfEnemyIndicies)
    local enemyPositions = {}
    for i = 1,#listOfEnemyIndicies do
        local x,y,z = SpringGetUnitPosition(listOfEnemyIndicies[i])
    end
end