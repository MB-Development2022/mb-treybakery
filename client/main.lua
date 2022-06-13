local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}
local onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "trey" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('mb-treybakery:client:duty', function()
    onDuty = not onDuty
    TriggerServerEvent("QBCore:ToggleDuty")
end)

function OnDuty()
    return onDuty
end exports('OnDuty', OnDuty)

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do 
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end

AddEventHandler('onResourceStop', function(resource)
   if resource == GetCurrentResourceName() then
      for k,v in pairs(Locations) do 
        exports['qb-target']:RemoveZone(v.name)
      end
   end
end)

-- Blip
Citizen.CreateThread(function()
    Trey = AddBlipForCoord(55.33, -125.67, 55.46)
    SetBlipSprite (Trey, 621)
    SetBlipDisplay(Trey, 4)
    SetBlipScale  (Trey, 0.5)
    SetBlipAsShortRange(Trey, true)
    SetBlipColour(Trey, 8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Trey")
    EndTextCommandSetBlipName(Trey)
end) 

-- Toggle Duty
RegisterNetEvent("mb-treybakery:client:toggleduty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

-- Item Crafting 
RegisterNetEvent("mb-treybakery:client:craftstation")
AddEventHandler("mb-treybakery:client:craftstation", function(data)
    QBCore.Functions.TriggerCallback("mb-treybakery:server:ingredients", function(HasItems)
        if HasItems then
            LoadAnimDict(data.dictionary)
            TaskPlayAnim(PlayerPedId(), data.dictionary, data.animname, 6.0, -6.0, -1, 46, 0, 0, 0, 0)
            FreezeEntityPosition(PlayerPedId(), true)
            QBCore.Functions.Progressbar("pickup_sla", data.progressbar, data.progresstime, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
            }, {}, {}, {}, function() -- Done
                Working = false
                TriggerEvent('inventory:client:busy:status', false)
                ClearPedTasksImmediately(PlayerPedId())
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerServerEvent('mb-treybakery:server:craft', data.required, data.item, data.amount)
            end, function()
                TriggerEvent('inventory:client:busy:status', false)
                Working = false
            end, data.item)   
        else
            QBCore.Functions.Notify("You're missing ingredients!", "error")
        end
    end, data.required)
end)

-- Storage
RegisterNetEvent("mb-treybakery:client:storage", function(data)
    if data == "front" then
        TriggerEvent("inventory:client:SetCurrentStash", "Trey Storage")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "TreyStorage", {maxweight = StashWeight, slots = StashSlots})
    elseif data.location == "back" then 
        TriggerEvent("inventory:client:SetCurrentStash", "Trey Storage Shelf")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Trey Storage Shelf", {maxweight = StashWeight, slots = StashSlots})
    end
end)

-- Crafting Menus
RegisterNetEvent("mb-treybakery:client:openmenu", function(Station)
    local MBTreyMenu = {}
    for k, v in pairs(Station) do
        table.insert(MBTreyMenu, {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items[v.item].image.." width=30px>".. QBCore.Shared.Items[v.item].label,
            txt = "-".. v.txt,
            params = {
                event = 'mb-treybakery:client:craftstation',
                args = {
                    item = v.item,
                    required = v.required,
                    progressbar = v.pbmsg, 
                    progresstime = v.pbtime,
                    dictionary = v.animDict,
                    animname = v.anim,
                    amount = v.amount
                }
            },
        })
    end
    exports['qb-menu']:openMenu(MBTreyMenu) 
end)

-- Shops
RegisterNetEvent("mb-treybakery:client:shop", function()
    TriggerServerEvent("jim-shops:ShopOpen", "shop", "treybakery", ShopItems)
end)

-- Tray
RegisterNetEvent("mb-treybakery:client:trey", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Trey Tray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Trey Tray", {
        maxweight = TrayWeight,
        slots = TraySlots,
    })
end)

-- Billing
RegisterNetEvent("mb-treybakery:client:bill", function()
    local dialog = exports["qb-input"]:ShowInput({
        header = "Create Receipt",
        inputs = {
            {
                text = "Paypal ID (#)",
                name = "citizenid",
                type = "text",
                isRequired = true
            },
            {
                text = "Bill Price ($)",
                name = "billprice",
                type = "number",
                isRequired = false
            }
        }
    })
    if dialog then
        if not dialog.citizenid or not dialog.billprice then return end
        TriggerServerEvent("mb-treybakery:server:bill", dialog.citizenid, dialog.billprice)
    end
end)

-- Order Menu
RegisterNetEvent('mb-treybakery:client:ordermenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Order Station:",
            isMenuHeader = true,
        },
        {
            header = "Order Items:",
            txt = "• Order Ingredients",
            params = {
                event = "mb-treybakery:client:shop"
            }
        },
        {
            header = "Look at Shelf:",
            txt = "• Open Storage",
            params = {
                event = "mb-treybakery:client:storage",
                args = {
                    location = "back",
                }
            }
        },
        {
            header = "⬅ Close Menu",
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu"
            }
        },
    })
end)