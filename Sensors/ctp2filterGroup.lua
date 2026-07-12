local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- speedups
local SpringGetUnitPosition = Spring.GetUnitPosition

-- @description return group definition of peewees
return function(group, endLen)
    local groupDefinition = {}
    local counter = 1
    for unitID, posIndex in pairs(group) do 
        group[unitID] = posIndex
        if counter >= endLen then
            break
        end
        counter = counter+1
        --groupDefinition[unitID] = counter
        --groupDefinition[listOfUnits[i]] = i
    
    end
    return groupDefinition
end