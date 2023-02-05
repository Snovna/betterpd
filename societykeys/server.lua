ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

    ESX.RegisterServerCallback('betterpd:getFactionVehiclePlates', function(src, cb, ownerString)
        MySQL.Async.fetchAll('SELECT plate FROM owned_vehicles WHERE owner = @owner', {
            ['@owner'] = ownerString,
        }, function(result)
            ret = {}
            for i, v in ipairs(result) do
                ret[i] = v
            end
            cb(ret)
        end)
    end)
end)


