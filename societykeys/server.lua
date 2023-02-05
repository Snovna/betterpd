ESX = exports['es_extended']:getSharedObject()

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