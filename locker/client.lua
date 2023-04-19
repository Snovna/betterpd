for i=1,#Config.Lockers do
    exports.ox_target:addSphereZone({
        coords = vec3(Config.Lockers[i].location),
        radius = 1,
        debug = drawZones,
        options = {
            {
                name = 'betterpd:changeUniform',
                icon = 'fa-solid fa-shirt',
                label = 'Umziehen',
                onSelect = function()
                    lib.showContext('betterpd_clothes')
                end,
                canInteract = function()
                    local enabled = false
                    for j=1,#Config.Lockers[i].jobs do 
                        if(Config.Lockers[i].jobs[j] == ESX.GetPlayerData().job.name) then
                            enabled = true
                        end
                    end
                    return enabled
                end,
            },
            {
                name = 'betterpd:openLocker',
                icon = 'fa-solid fa-box',
                label = 'Spind öffnen',
                onSelect = function()
                    print(json.encode(ESX.GetPlayerData()))
                    TriggerServerEvent ("inventory:server:OpenInventory", "stash", Config.Lockers[i].name.."_"..ESX.GetPlayerData().firstName..'_'..ESX.GetPlayerData().lastName,{maxweight = 10000, slots = 10})
                    TriggerEvent ("inventory:client:SetCurrentStash", Config.Lockers[i].name.."_"..ESX.GetPlayerData().firstName..'_'..ESX.GetPlayerData().lastName)
                end,
                canInteract = function()
                    local enabled = false
                    for j=1,#Config.Lockers[i].jobs do 
                        if(Config.Lockers[i].jobs[j] == ESX.GetPlayerData().job.name) then
                            enabled = true
                        end
                    end
                    return enabled
                end,
            },
        }
    })
end

local clothesOptions = {
    {
        title = 'Privatkleidung',
        description = 'Es ist schön, Feierabend zu haben',
        icon = 'shirt',
        event = 'rcore_clothes:openOutfits',
        arrow = true,
    }
};

for i=1,#Config.Uniforms do
    table.insert(clothesOptions,{
        title = Config.Uniforms[i].name,
        description = Config.Uniforms[i].description,
        icon = 'shirt',
        onSelect = function()
            local skin = copy(Config.Uniforms[i].skin)
            local grade = ESX.GetPlayerData().job.grade
            local overrides = Config.Uniforms[i].skinGrades[grade]
            if(overrides ~= nil) then 
                for k, v in pairs(overrides) do
                    skin[k] = v
                end
            end
            if(Config.Uniforms[i].male) then
                skin.sex = 0
            else
                skin.sex = 1
            end
            TriggerEvent('skinchanger:loadSkin', skin)
            TriggerEvent('skinchanger:getSkin', function(changedSkin)
                TriggerServerEvent('esx_skin:save', changedSkin)
            end)
        end,
        canInteract = function()
            local jobCheck = false
            for j=1,#Config.Uniforms[i].jobs do 
                if(Config.Uniforms[i].jobs[j] == ESX.GetPlayerData().job.name) then
                    jobCheck = true
                end
            end
            return (jobCheck and (Config.Uniforms[i].male == IsPedMale(PlayerPedId())))
        end
    })
end
lib.registerContext({
    id = 'betterpd_clothes',
    title = 'Umkleide',
    options = clothesOptions,
})
  
function copy(obj, seen)
    if type(obj) ~= 'table' then return obj end
    if seen and seen[obj] then return seen[obj] end
    local s = seen or {}
    local res = setmetatable({}, getmetatable(obj))
    s[obj] = res
    for k, v in pairs(obj) do res[copy(k, s)] = copy(v, s) end
    return res
end
