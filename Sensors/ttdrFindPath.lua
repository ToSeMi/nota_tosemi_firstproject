local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return static position of the first unit
return function(startPosition, endPosition, enemyPositions)
    local mapX = Game.mapSizeX / Game.squareSize
    local mapZ = Game.mapSizeZ / Game.squareSize
    local map = {}
    local counter = 1
    for i = 1, mapX do 
        for j = 1, mapZ do 
            map[i][j] = 1
        end 
    end
    return groupDefinition
end