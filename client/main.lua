local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}
local onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
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
            print(data.progressbar)
            print(data.progresstime)
            QBCore.Functions.Progressbar("pickup_sla", data.progressbar, data.progresstime, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
            }, {}, {}, {}, function() -- Done
                TriggerEvent('inventory:client:busy:status', false)
                ClearPedTasksImmediately(PlayerPedId())
                FreezeEntityPosition(PlayerPedId(), false)
                print(data.amount)
                TriggerServerEvent('mb-treybakery:server:craft', data.required, data.item, data.amount)
            end, function()
                TriggerEvent('inventory:client:busy:status', false)
                ClearPedTasksImmediately(PlayerPedId())
                FreezeEntityPosition(PlayerPedId(), false)
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
RegisterNetEvent("mb-treybakery:client:openmenu", function(Station, Name)
    local MBTreyMenu = {{ header = Name, isMenuHeader = true }}
    MBTreyMenu[#MBTreyMenu+1] = {
        header = "⬅ Close Menu",
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }
    for k, v in pairs(Station) do
        MBTreyMenu[#MBTreyMenu+1] = {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items[v.item].image.." width=30px>".. QBCore.Shared.Items[v.item].label,
            txt = "-".. v.txt,
            params = {
                event = 'mb-treybakery:client:craftstation',
                args = {
                    item = v.item,
                    required = v.required,
                    progressbar = v.progressMsg, 
                    progresstime = v.progressTime,
                    dictionary = v.animDict,
                    animname = v.anim,
                    amount = v.amount
                }
            }
        }
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
        TriggerServerEvent("mb-treybakery:server:billplayer", dialog.citizenid, dialog.billprice)
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

RegisterNetEvent("mb-trey:WeddingCakeFull", function()
    TriggerServerEvent('QBCore:Server:RemoveItem', "weddingcakefull", 1)
    TriggerServerEvent('QBCore:Server:AddItem', "weddingcake", 12)
end)

RegisterNetEvent("mb-trey:DonutBox", function()
    TriggerServerEvent('QBCore:Server:RemoveItem', "donutbox", 1)
    TriggerServerEvent('QBCore:Server:AddItem', "chocdonut", 6)
    TriggerServerEvent('QBCore:Server:AddItem', "pinkdonut", 6)
    TriggerServerEvent('QBCore:Server:AddItem', "trey_box", 1)

end)


 

RegisterNetEvent("mb-trey:TreyBox", function()
    local randomToy = math.random(1,100)
    TriggerServerEvent('QBCore:Server:RemoveItem', "trey_box", 1)

    if randomToy < 10 then
        QBCore.Functions.Notify("Better Luck Next time!", "error")
    elseif randomToy == 10 then
        TriggerServerEvent('QBCore:Server:AddItem', "donutplushy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["donutplushy"], "add")
    elseif randomToy < 20 and randomToy > 10 then
        QBCore.Functions.Notify("Better Luck Next time!", "error")
    elseif randomToy == 20 then
        TriggerServerEvent('QBCore:Server:AddItem', "cookieplushy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cookieplushy"], "add")
    elseif randomToy < 30 and randomToy > 20 then
        QBCore.Functions.Notify("Better Luck Next time!", "error")
    elseif randomToy == 30 then
        TriggerServerEvent('QBCore:Server:AddItem', "cupcakeplushy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cupcakeplushy"], "add")
    elseif randomToy < 40 and randomToy > 30 then
        QBCore.Functions.Notify("Better Luck Next time!", "error")
    elseif randomToy == 40 then
        TriggerServerEvent('QBCore:Server:AddItem', "icecreamconeplushy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["icecreamconeplushy"], "add")
    elseif randomToy < 50 and randomToy > 40 then
        QBCore.Functions.Notify("Better Luck Next time!", "error")
    elseif randomToy == 50 then
        TriggerServerEvent('QBCore:Server:AddItem', "icecreamsandwichplushy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["icecreamsandwichplushy"], "add")
    elseif randomToy < 60 and randomToy > 50 then
        QBCore.Functions.Notify("Better Luck Next time!", "error")
    elseif randomToy == 60 then
        TriggerServerEvent('QBCore:Server:AddItem', "pridecakeplushy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pridecakeplushy"], "add")
    else
        QBCore.Functions.Notify("Better Luck Next time!", "error")
    end
end)