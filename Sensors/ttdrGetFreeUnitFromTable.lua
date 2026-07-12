local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return static position of the first unit
return function(table)
    for i=1,#table do
        if table[i] == -1 then
            table[i] = 1
            return i
        end
    end

    return -1 
end