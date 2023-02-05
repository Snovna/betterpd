ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterNetEvent('esx:playerLoaded', function()
    ESX.TriggerServerCallback('betterpd:getFactionVehiclePlates', function(data)
		for i, v in ipairs(data) do
			TriggerEvent('cd_garage:AddKeys', v.plate)
			print("added plate : "..v.plate)
		end
    end, ESX.GetPlayerData().job.name)
end)


RegisterNetEvent('sqz_duty:ToggleDuty', function(duty)
	jobName = ESX.GetPlayerData().job.name
	if not duty then
		jobName = string.sub(jobName, 4)
	end
    ESX.TriggerServerCallback('betterpd:getFactionVehiclePlates', function(data)
		if duty then
			for i, v in ipairs(data) do
				TriggerEvent('cd_garage:AddKeys', v.plate)
				print("added plate : "..v.plate)
			end
		else
			for i, v in ipairs(data) do
				TriggerEvent('cd_garage:RemoveKeys', v.plate)
				print("removed plate : "..v.plate)
			end
		end
    end, jobName)
end)