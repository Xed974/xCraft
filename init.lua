local cooldown = false

CreateThread(function()
    while true do
        local wait = 1000
        for _,v in pairs(Config.Craft) do
            local pPos = GetEntityCoords(PlayerPedId())
            local dst = Vdist(pPos.x, pPos.y, pPos.z, v.pos.x, v.pos.y, v.pos.z)

            if v.MarkerEnable then
                if dst <= v.MarkerDistance then
                    wait = 0
                    DrawMarker(v.MarkerType, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, v.MarkerSizeLargeur, v.MarkerSizeEpaisseur, v.MarkerSizeHauteur, v.MarkerColorR, v.MarkerColorG, v.MarkerColorB, 200, v.MarkerSaute, true, p19, v.MarkerTourne)
                end
            end
            if dst <= v.InteractionDistance then
                wait = 0
                ESX.ShowHelpNotification(v.HelpNotification)
                if not cooldown then
                    if IsControlJustPressed(1, 51) then
                        if v.JobRequired == nil then
                            if v.Remove then
                                ESX.TriggerServerCallback("xCraft:getItem", function(can) 
                                    if can then
                                        if v.Add then
                                            cooldown = true
                                            Wait(v.TimeCooldown * 1000)
                                            TriggerServerEvent("xCraft:giveItem", v.itemGive, v.countMin, v.countMax)
                                            cooldown = false
                                        else
                                            cooldown = true
                                            Wait(v.TimeCooldown * 1000)
                                            cooldown = false
                                        end
                                    end
                                end, v.itemRemove, v.cbMin, v.cbMax)
                            else
                                if v.Add then
                                    cooldown = true
                                    Wait(v.TimeCooldown * 1000)
                                    TriggerServerEvent("xCraft:giveItem", v.itemGive, v.countMin, v.countMax)
                                    cooldown = false
                                end
                            end
                        else
                            if v.JobRequired == ESX.PlayerData.job.name then
                                if v.Remove then
                                    ESX.TriggerServerCallback("xCraft:getItem", function(can) 
                                        if can then
                                            if v.Add then
                                                cooldown = true
                                                Wait(v.TimeCooldown * 1000)
                                                TriggerServerEvent("xCraft:giveItem", v.itemGive, v.countMin, v.countMax)
                                                cooldown = false
                                            else
                                                cooldown = true
                                                Wait(v.TimeCooldown * 1000)
                                                cooldown = false
                                            end
                                        end
                                    end, v.itemRemove, v.cbMin, v.cbMax)
                                else
                                    if v.Add then
                                        cooldown = true
                                        Wait(v.TimeCooldown * 1000)
                                        TriggerServerEvent("xCraft:giveItem", v.itemGive, v.countMin, v.countMax)
                                        cooldown = false
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        for _,v in pairs(Config.Craft2) do
            if v.Job == nil then
                local pPos = GetEntityCoords(PlayerPedId())
                local dst = Vdist(pPos.x, pPos.y, pPos.z, v.pos.x, v.pos.y, v.pos.z)            

                if v.MarkerEnable then
                    if dst <= v.MarkerDistance then
                        wait = 0
                        DrawMarker(v.MarkerType, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, v.MarkerSizeLargeur, v.MarkerSizeEpaisseur, v.MarkerSizeHauteur, v.MarkerColorR, v.MarkerColorG, v.MarkerColorB, 200, v.MarkerSaute, true, p19, v.MarkerTourne)
                    end
                end
                if dst <= v.InteractionDistance then
                    wait = 0
                    if not cooldown then
                        ESX.ShowHelpNotification(v.helpNotif)
                        if IsControlJustPressed(1, 51) then
                            ESX.TriggerServerCallback("xCraft:farm", function(result) 
                                if result then
                                    cooldown = true
                                    Wait(v.TimeCooldown * 1000)
                                    cooldown = false
                                end
                            end, v)
                        end
                    end
                end
            else
                if v.Job == ESX.PlayerData.job.name then
                    local pPos = GetEntityCoords(PlayerPedId())
                    local dst = Vdist(pPos.x, pPos.y, pPos.z, v.pos.x, v.pos.y, v.pos.z)            

                    if v.MarkerEnable then
                        if dst <= v.MarkerDistance then
                            wait = 0
                            DrawMarker(v.MarkerType, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, v.MarkerSizeLargeur, v.MarkerSizeEpaisseur, v.MarkerSizeHauteur, v.MarkerColorR, v.MarkerColorG, v.MarkerColorB, 200, v.MarkerSaute, true, p19, v.MarkerTourne)
                        end
                    end
                    if dst <= v.InteractionDistance then
                        wait = 0
                        if not cooldown then
                            ESX.ShowHelpNotification(v.helpNotif)
                            if IsControlJustPressed(1, 51) then
                                ESX.TriggerServerCallback("xCraft:farm", function(result) 
                                    if result then
                                        cooldown = true
                                        Wait(v.TimeCooldown * 1000)
                                        cooldown = false
                                    end
                                end, v)
                            end
                        end
                    end
                end
            end
        end
        Wait(wait)
    end
end)

--- Xed#1188 | https://discord.gg/HvfAsbgVpM