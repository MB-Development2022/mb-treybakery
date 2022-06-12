QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("mb-trey:bill:player")
AddEventHandler("mb-trey:bill:player", function(playerId, amount)
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




QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientEmsCupcake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cakemix = Ply.Functions.GetItemByName("cakemix")
    if cakemix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientCarCupcake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cakemix = Ply.Functions.GetItemByName("cakemix")
    if cakemix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientChocolateCupcake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cakemix = Ply.Functions.GetItemByName("cakemix")
    if cakemix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientRvCupcake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cakemix = Ply.Functions.GetItemByName("cakemix")
    if cakemix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientWeddingCakeFull', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cakemix = Ply.Functions.GetItemByName("cakemix")
    if cakemix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientBirthdayCupcake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cakemix = Ply.Functions.GetItemByName("cakemix")
    if cakemix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientCupcake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cakemix = Ply.Functions.GetItemByName("cakemix")
    if cakemix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientPlainDonut', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local donutmix = Ply.Functions.GetItemByName("donutmix")
    if donutmix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientPoliceCookie', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cookiemix = Ply.Functions.GetItemByName("cookiemix")
    if cookiemix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientChocDonut', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local donutmix = Ply.Functions.GetItemByName("donutmix")
    if donutmix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientPinkDonut', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local donutmix = Ply.Functions.GetItemByName("donutmix")
    if donutmix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientDonutBox', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local chocdonut = Ply.Functions.GetItemByName("chocdonut")
    local pinkdonut = Ply.Functions.GetItemByName("pinkdonut")
    if chocdonut ~= nil and pinkdonut ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientCheeseCake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cakemix = Ply.Functions.GetItemByName("cakemix")
    local strawberry = Ply.Functions.GetItemByName("strawberry")
    if cakemix ~= nil and strawberry ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-trey:server:get:ingredientCookie', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cookiemix = Ply.Functions.GetItemByName("cookiemix")
    if cookiemix ~= nil then
        cb(true)
    else
        cb(false)
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

CreateThread(function()
    for k,v in pairs(ConsumablesEat) do 
        QBCore.Functions.CreateUsableItem(k, function(source, item)
            local Player = QBCore.Functions.GetPlayer(source)
            if Player.Functions.GetItemByName(item.name) ~= nil then 
                TriggerClientEvent(v.event, source, item.name)
            end
        end)
    end
end)
