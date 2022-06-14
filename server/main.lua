QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('mb-treybakery:server:ingredients', function(source, cb, items)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local items = items
    local hasItems = true
    for k, v in pairs(items) do
        if Ply.Functions.GetItemByName(items[k].itemName) ~= nil then
            hasItems = hasItems and (Ply.Functions.GetItemByName(items[k].itemName).amount >= items[k].amount)
        else
            hasItems = hasItems and false 
        end
    end
    cb(hasItems)
end)

RegisterServerEvent('mb-treybakery:server:craft', function(items, giveitem, amount)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    for k,v in pairs(items) do 
        if Player.Functions.RemoveItem(items[k].itemName, items[k].amount) then 
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[v.itemName], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[giveitem], "add")
            Player.Functions.AddItem(giveitem, amount)
        end
    end
end)

RegisterServerEvent("mb-treybakery:server:billplayer")
AddEventHandler("mb-treybakery:server:billplayer", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'trey' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                    exports.oxmysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                        ['@citizenid'] = billed.PlayerData.citizenid,
                        ['@amount'] = amount,
                        ['@society'] = biller.PlayerData.job.name,
                        ['@sender'] = biller.PlayerData.charinfo.firstname
                    })
                    TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                    TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                    TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
    end
end)