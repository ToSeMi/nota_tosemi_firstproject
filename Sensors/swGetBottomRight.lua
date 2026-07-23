local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return static position of the first unit
return function()
    local x = Game.mapSizeX - 150
    local z = Game.mapSizeZ - 150
    return Vec3(x,682,z)
end