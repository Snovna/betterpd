
Citizen.CreateThread(function()
    while true do
        DistantCopCarSirens(false)
        SetAudioFlag("PoliceScannerDisabled", true)
        Citizen.Wait(1000)
    end
end)



print("Core client ready")
TriggerEvent("betterpd:clientReady")