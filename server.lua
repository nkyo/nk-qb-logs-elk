local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('elk-log:server:elk', function(player, citizenid, action, message, danger)
    local citizenid = citizenid or 'Unknown'
    local danger = danger or false
    local player = player or "System"
    local detail = message
    local webHook = "Your-Discord-Web-Hook" -- Change this to your Discord Web Hook for danger logs tagged with @everyone
    PerformHttpRequest("ELK HTTP Request Link", function(err, text, headers) end, 'POST', json.encode({citizenid = citizenid, player = player, action = action, detail = detail}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if danger then
        PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ text = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)