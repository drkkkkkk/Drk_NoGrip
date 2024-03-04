
-- Don't touch anything in here unless You know what You are doing.

local ragdoll_chance = Config.Ragdoll_Chance
local Shake_Intensity = Config.CameraShakeIntensity

print("Script successfully started, Here are the Configs")
print("Shake Intensity: ", Shake_Intensity)
print("Ragdoll Chance: ", ragdoll_chance)
print("ShakeSize:", Config.ShakeSize)

if Config.CameraShakeIntensity <= 0.2 then

	   
	  print("Shake Intensity Is Too Low, Setting it To 0.6")
	  Config.CameraShakeIntensity = 0.6

	  print("New Shake Intensity: ", Config.CameraShakeIntensity)



end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100) 
		local ped = PlayerPedId()
		if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
			local chance_result = math.random()
			if chance_result < ragdoll_chance then 
				Citizen.Wait(600)
                ShakeGameplayCam(Config.ShakeSize, Shake_Intensity)
				SetPedToRagdoll(ped, 5000, 1, 2)
				print('falling!')
			else
				Citizen.Wait(2000)
			end
		end
	end
end)

