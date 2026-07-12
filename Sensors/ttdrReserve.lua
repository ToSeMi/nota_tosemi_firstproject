local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return static position of the first unit
return function(unitToRescueMyID, atlasMyID)
    bb.transports[atlasMyID] = 0
    bb.units[unitToRescueMyID] = 0
end