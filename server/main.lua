QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("mb-sugar:bill:player")
AddEventHandler("mb-sugar:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'sugar' then
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


QBCore.Functions.CreateCallback('mb-sugar:server:get:ingredientEmsCupcake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cakemix = Ply.Functions.GetItemByName("cakemix")
    if cakemix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-sugar:server:get:ingredientCarCupcake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cakemix = Ply.Functions.GetItemByName("cakemix")
    if cakemix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mb-sugar:server:get:ingredientPoliceCookie', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cakemix = Ply.Functions.GetItemByName("cookiemix")
    if cakemix ~= nil then
        cb(true)
    else
        cb(false)
    end
end)



QBCore.Functions.CreateUseableItem("sugarmeal", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("mb-sugar:SugarMeal", source, item.name)
  end)


 
