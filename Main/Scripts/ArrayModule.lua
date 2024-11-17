local module = {}

function module.has_element(array, element)
	for _, v in ipairs(array) do
		if v == element then
			return true
		end
	end
	return false
end

function module.CountElements(array)
	local counts = {}
	for _, v in ipairs(array) do
		counts[v] = (counts[v] or 0) + 1
	end
	return counts
end

function module.removeDuplicates(array)
	local result = {}
	for i,v in pairs(module.CountElements(array)) do
		table.insert(result,i)
	end
	return result
end

local function RemoveArray(array,toremove)
	local removeSet = {}
	for _, v in ipairs(toremove) do
		removeSet[v] = (removeSet[v] or 0) + 1
	end
	local result = {}
	for _, v in ipairs(array) do
		if removeSet[v] and removeSet[v] > 0 then
			removeSet[v] = removeSet[v] - 1
		else
			table.insert(result, v)
		end
	end
	return result
end

local function HasArray(array, toremove)
	local arrayCounts = module.CountElements(array)
	local removeCounts = module.CountElements(toremove)
	for value, count in pairs(removeCounts) do
		if not arrayCounts[value] or arrayCounts[value] < count then
			return false
		end
	end
	return true
end

function module.FlatArray(arr)
	local result = {}
	local function flatten(t)
		for _, value in ipairs(t) do
			if type(value) == "table" then
				flatten(value)
			else
				table.insert(result, value)
			end
		end
	end
	flatten(arr)
	return result
end

return module
