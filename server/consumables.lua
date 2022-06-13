local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for k,v in pairs(ConsumeablesEat) do 
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if Player.Functions.GetItemByName(item.name) ~= nil then 
                TriggerClientEvent(v.event, src, item.name)
            end
        end)
    end
    for k,v in pairs(ConsumeablesDrink) do 
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            local src = source 
            local Player = QBCore.Functions.GetPlayer(src)
            if Player.Functions.GetItemByName(item.name) ~= nil then 
                TriggerClientEvent(v.event, src, item.name)
            end
        end)
    end
end)

QBCore.Functions.CreateUseableItem("donutbox", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("mb-trey:DonutBox", source, item.name)
end)

QBCore.Functions.CreateUseableItem("weddingcakefull", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("mb-trey:WeddingCakeFull", source, item.name)
end)