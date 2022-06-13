local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("consumables:client:emscupcake")
AddEventHandler("consumables:client:emscupcake", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating Ems Cupcake", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].effect)
        TriggerServerEvent('hud:server:RelieveStress', math.random(7, 9))
    end)
end)

RegisterNetEvent("consumables:client:carcupcake")
AddEventHandler("consumables:client:carcupcake", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating Car Cupcake", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].effect)
        TriggerServerEvent('hud:server:RelieveStress', math.random(7, 9))
    end)
end)

RegisterNetEvent("consumables:client:chocolatecupcake")
AddEventHandler("consumables:client:chocolatecupcake", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating Chocolate Cupcake", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].effect)
        TriggerServerEvent('hud:server:RelieveStress', math.random(7, 9))
    end)
end)

RegisterNetEvent("consumables:client:rvcupcake")
AddEventHandler("consumables:client:rvcupcake", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating Red Velvet Cupcake", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].effect)
        TriggerServerEvent('hud:server:RelieveStress', math.random(7, 9))
    end)
end)

RegisterNetEvent("consumables:client:weddingcake")
AddEventHandler("consumables:client:weddingcake", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating a Slice of Wedding Cake", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].effect)
        TriggerServerEvent('hud:server:RelieveStress', math.random(7, 9))
    end)
end)

RegisterNetEvent("consumables:client:birthdaycupcake")
AddEventHandler("consumables:client:birthdaycupcake", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"sandwich"})
    QBCore.Functions.Progressbar("eat_something", "Eating Birthday Cupcake", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("evidence:client:SetStatus", "food", 200)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:policecookie")
AddEventHandler("consumables:client:policecookie", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating Poice Cookie", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].effect)
        TriggerServerEvent('hud:server:RelieveStress', math.random(7, 9))
    end)
end)

RegisterNetEvent("consumables:client:chocdonut")
AddEventHandler("consumables:client:chocdonut", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating Chocolate Donut", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].effect)
        TriggerServerEvent('hud:server:RelieveStress', math.random(7, 9))
    end)
end)

RegisterNetEvent("consumables:client:pinkdonut")
AddEventHandler("consumables:client:pinkdonut", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating Pink Donut", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].effect)
        TriggerServerEvent('hud:server:RelieveStress', math.random(7, 9))
    end)
end)

RegisterNetEvent("consumables:client:scheesecake")
AddEventHandler("consumables:client:scheesecake", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating Strawberry Cheese Cake", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].effect)
        TriggerServerEvent('hud:server:RelieveStress', math.random(7, 9))
    end)
end)

RegisterNetEvent("consumables:client:cookie")
AddEventHandler("consumables:client:cookie", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating Cookie", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName].effect.effect)
        TriggerServerEvent('hud:server:RelieveStress', math.random(7, 9))
    end)
end)

RegisterNetEvent("consumables:client:smoothie")
AddEventHandler("consumables:client:smoothie", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffe"})
    QBCore.Functions.Progressbar("drink_something", "Drinking Soda..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('hud:server:RelieveStress', math.random(12,15))
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName].effect)
    end)
end)