function getInfo()
	return {
		onNoUnits = SUCCESS, -- instant success
		tooltip = "Move to defined position",
		parameterDefs = {
			{ 
				name = "group",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "<group>",
			},
			{ 
				name = "positions", -- relative formation
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "<positions>",
			}
		}
	}
end

-- constants
local THRESHOLD_STEP = 25
local THRESHOLD_DEFAULT = 0
local positionTable = {}

-- speed-ups
local SpringGetUnitPosition = Spring.GetUnitPosition
local SpringGiveOrderToUnit = Spring.GiveOrderToUnit

local function ClearState(self)
	self.threshold = THRESHOLD_DEFAULT
	self.lastPointmanPosition = Vec3(0,0,0)
end

function Run(self, units, parameter)
	local positions = parameter.positions -- array of Vec3
	local group = parameter.group -- array of Vec3
	
	--Spring.Echo(dump(parameter.formation))
	
	-- validation
	--if (#positions-1 > #group) then
	--	return FAILURE
	--end
    local cmdID = CMD.MOVE
    local counter = 0
    for i = 1, #group do
        local currUnit = group[i]
        local endPosition = positions[i]
        if Spring.ValidUnitID(currUnit) then
            
            local x,y,z = SpringGetUnitPosition(currUnit)
            local currUnitPosition = Vec3(x,y,z)
            
        if math.sqrt(x*x+z*z) < 25 then
            counter = counter + 1
        else
            SpringGiveOrderToUnit(currUnit, cmdID, endPosition:AsSpringVector(), {})
        end
        end
    end
    if counter >= #units - 1 then 
        return SUCCESS 
    else
        return RUNNING
    end
	--[[
	-- pick the spring command implementing the move
	if (fight) then cmdID = CMD.FIGHT end

	local pointman = units[1] -- while this is running, we know that #units > 0, so pointman is valid
	local pointX, pointY, pointZ = SpringGetUnitPosition(pointman)
	local pointmanPosition = Vec3(pointX, pointY, pointZ)
	
	-- threshold of pointan success
	if (pointmanPosition == self.lastPointmanPosition) then 
		self.threshold = self.threshold + THRESHOLD_STEP 
	else
		self.threshold = THRESHOLD_DEFAULT
	end
	self.lastPointmanPosition = pointmanPosition
	
	-- check pointman success
	-- THIS LOGIC IS TEMPORARY, NOT CONSIDERING OTHER UNITS POSITION
	if (pointmanPosition:Distance(position) < self.threshold) then
		return SUCCESS
	else
		SpringGiveOrderToUnit(pointman, cmdID, position:AsSpringVector(), {})
		
		for i=2, #units do
			local thisUnitWantedPosition = pointmanPosition + formation[i]
			SpringGiveOrderToUnit(units[i], cmdID, thisUnitWantedPosition:AsSpringVector(), {})
		end
		
		return RUNNING
	end
    ]]--
end

function Reset(self)
	ClearState(self)
end
