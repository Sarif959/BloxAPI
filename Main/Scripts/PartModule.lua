local module = {}

function module.TakeHealthOnTouch (part,Health)
	part.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") then
			hit.Parent.Humanoid.Health -= Health
		end
	end)
end

return module
