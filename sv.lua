ESX.RegisterServerCallback("xCraft:getItem", function(source, cb, itemRemove, cbMin, cbMax)
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end
    local randomItem = itemRemove[math.random(#itemRemove)]
    local randomCb = math.random(cbMin, cbMax)

    if xPlayer.getInventoryItem(randomItem).count >= randomCb then
        xPlayer.removeInventoryItem(randomItem, randomCb)
        cb(true)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, ('(~r~Erreur~s~)\nVous n\'avez pas assez de/d\' ~r~%s~s~ sur vous.'):format(ESX.GetItemLabel(randomItem)))
    end
end)

RegisterNetEvent("xCraft:giveItem")
AddEventHandler("xCraft:giveItem", function(itemGive, countMin, countMax)
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end
    local randomItem = itemGive[math.random(#itemGive)]
    local randomCb = math.random(countMin, countMax)

    xPlayer.addInventoryItem(randomItem, randomCb)
end)

ESX.RegisterServerCallback("xCraft:farm", function(source, cb, v)
    local xPlayer = ESX.GetPlayerFromId(source)
    local result = 0

    if (not xPlayer) then return end
    for a,b in pairs(v.Need) do
        if xPlayer.getInventoryItem(b.Item).count >= b.Nb then
            result = result + 1
        else
            TriggerClientEvent('esx:showNotification', source, ('(~r~Erreur~s~)\nVous avez assez de ~r~%s~s~.'):format(ESX.GetItemLabel(b.Item)))
        end
    end
    if result == #v.Need then
        for a,b in pairs(v.Need) do
            if xPlayer.getInventoryItem(b.Item).count >= b.Nb then
                xPlayer.removeInventoryItem(b.Item, b.Nb)
            end
        end
        cb(true)
        Wait(v.Time)
        for a,b in pairs(v.Result) do
            xPlayer.addInventoryItem(b.Item, b.Nb)
        end
    end
end)

--- Xed#1188 | https://discord.gg/HvfAsbgVpM