QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

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

RegisterNetEvent("mb-trey:WeddingCakeFull", function()
    TriggerServerEvent('QBCore:Server:RemoveItem', "weddingcakefull", 1)
    TriggerServerEvent('QBCore:Server:AddItem', "weddingcake", 12)
end)

RegisterNetEvent("mb-trey:DonutBox", function()
    local randomToy = math.random(1,10)
    TriggerServerEvent('QBCore:Server:RemoveItem', "donutbox", 1)
    TriggerServerEvent('QBCore:Server:AddItem', "chocdonut", 6)
    TriggerServerEvent('QBCore:Server:AddItem', "pinkdonut", 6)

    if randomToy < 4 then
        QBCore.Functions.Notify("No toy in box :(", "error")
    elseif randomToy == 4 then
        TriggerServerEvent('QBCore:Server:AddItem', "trey-toy1", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["trey-toy1"], "add")
    elseif randomToy < 10 and randomToy > 4 then
        QBCore.Functions.Notify("No toy in box :(", "error")
    elseif randomToy == 10 then	
        TriggerServerEvent('QBCore:Server:AddItem', "trey-toy2", 1)	
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["trey-toy2"], "add")
    else	
        QBCore.Functions.Notify("No toy in box :(", "error")
    end
end)


RegisterNetEvent("mb-trey:CreateDonutBox", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientDonutBox', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then 
                    QBCore.Functions.Progressbar("pickup_sla", "Making A Donut Box..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "chocdonut", 6)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "pinkdonut", 6)
    
    
                        TriggerServerEvent('QBCore:Server:AddItem', "donutbox", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["donutbox"], "add")
    
                        QBCore.Functions.Notify("You made a Donut Box", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "donutbox")
                else
                    QBCore.Functions.Progressbar("pickup_sla", "Making A Donut Box..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "chocdonut", 6)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "pinkdonut", 6)
    
    
                        TriggerServerEvent('QBCore:Server:AddItem', "donutbox", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["donutbox"], "add")
    
                        QBCore.Functions.Notify("You made a Donut Box", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("mb-trey:EmsCupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientEmsCupcake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making EMS Cupcake..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "cupcake", 1)
                        TriggerServerEvent('QBCore:Server:AddItem', "emscupcake", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["emscupcake"], "add")
                        QBCore.Functions.Notify("You made a EMS Cupcake", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "emscupcake")
                else QBCore.Functions.Progressbar("pickup_sla", "Making EMS Cupcake..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cupcake", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "emscupcake", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["emscupcake"], "add")
                    QBCore.Functions.Notify("You made a EMS Cupcake", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:CarCupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientCarCupcake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making Car Cupcake..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "cupcake", 1)
                        TriggerServerEvent('QBCore:Server:AddItem', "carcupcake", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["carcupcake"], "add")
                        QBCore.Functions.Notify("You made a Car Cupcake", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "carcupcake")
                else QBCore.Functions.Progressbar("pickup_sla", "Making Car Cupcake..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cupcake", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "carcupcake", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["carcupcake"], "add")
                    QBCore.Functions.Notify("You made a Car Cupcake", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:ChocolateCupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientChocolateCupcake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making Chocolate Cupcake..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "cupcake", 1)
                        TriggerServerEvent('QBCore:Server:AddItem', "chocolatecupcake", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chocolatecupcake"], "add")
                        QBCore.Functions.Notify("You made a Chocolate Cupcake", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "chocolaatecupcake")
                else QBCore.Functions.Progressbar("pickup_sla", "Making Chocolate Cupcake..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cupcake", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "chocolatecupcake", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chocolatecupcake"], "add")
                    QBCore.Functions.Notify("You made a Chocolate Cupcake", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false				
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:RvCupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientRvCupcake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making Red Velvet Cupcake..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "cupcake", 1)
                        TriggerServerEvent('QBCore:Server:AddItem', "rvcupcake", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["rvcupcake"], "add")
                        QBCore.Functions.Notify("You made a Red Velvet Cupcake", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "rvcupcake")
                else QBCore.Functions.Progressbar("pickup_sla", "Making Red Velvet Cupcake..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cupcake", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "rvcupcake", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["rvcupcake"], "add")
                    QBCore.Functions.Notify("You made a Red Velvet Cupcake", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false				
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:CreateWeddingCakeFull", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientWeddingCakeFull', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making a Wedding Cake..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "cakemix", 10)
                        TriggerServerEvent('QBCore:Server:AddItem', "weddingcakefull", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weddingcakefull"], "add")
                        QBCore.Functions.Notify("You made a Wedding Cake", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "weddingcakefull")
                else QBCore.Functions.Progressbar("pickup_sla", "Making a Wedding Cake..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cakemix", 10)
                    TriggerServerEvent('QBCore:Server:AddItem', "weddingcakefull", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weddingcakefull"], "add")
                    QBCore.Functions.Notify("You made a Wedding Cake", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false				
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:BirthdayCupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientBirthdayCupcake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making Birthday Cupcake..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "cupcake", 1)
                        TriggerServerEvent('QBCore:Server:AddItem', "birthdaycupcake", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["birthdaycupcake"], "add")
                        QBCore.Functions.Notify("You made a Birthday Cupcake", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "birthdaycupcake")
                else QBCore.Functions.Progressbar("pickup_sla", "Making Birthday Cupcake..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cupcake", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "birthdaycupcake", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["birthdaycupcake"], "add")
                    QBCore.Functions.Notify("You made a Birthday Cupcake", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false				
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:Cupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientCupcake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making a Plain Cupcake..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "cakemix", 10)
                        TriggerServerEvent('QBCore:Server:AddItem', "cupcake", 10)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cupcake"], "add")
                        QBCore.Functions.Notify("You made a Plain Cupcake", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "cupcake")
                else QBCore.Functions.Progressbar("pickup_sla", "Making a Plain Cupcake..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cakemix", 10)
                    TriggerServerEvent('QBCore:Server:AddItem', "cupcake", 10)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cupcake"], "add")
                    QBCore.Functions.Notify("You made a Plain Cupcake", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false				
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:PoliceCookie", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientPoliceCookie', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making Police Cookie..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "cookiemix", 1)
                        TriggerServerEvent('QBCore:Server:AddItem', "policecookie", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["policecookie"], "add")
                        QBCore.Functions.Notify("You made a Police Cookie", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "policecookie")
                else QBCore.Functions.Progressbar("pickup_sla", "Making Police Cookie..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cookiemix", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "policecookie", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["policecookie"], "add")
                    QBCore.Functions.Notify("You made a Police Cookie", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false				
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:ChocDonut", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientChocDonut', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making Chocolate Donut..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "plaindonut", 1)
                        TriggerServerEvent('QBCore:Server:AddItem', "chocdonut", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chocdonut"], "add")
                        QBCore.Functions.Notify("You made a Chocolate Donut", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "chocodonut")
                else QBCore.Functions.Progressbar("pickup_sla", "Making Chocolate Donut..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "plaindonut", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "chocdonut", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chocdonut"], "add")
                    QBCore.Functions.Notify("You made a Chocolate Donut", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false				
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:PinkDonut", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientPinkDonut', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making Pink Donut..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "plaindonut", 1)
                        TriggerServerEvent('QBCore:Server:AddItem', "pinkdonut", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pinkdonut"], "add")
                        QBCore.Functions.Notify("You made a Chocolate Donut", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "pinkdonut")
                else QBCore.Functions.Progressbar("pickup_sla", "Making Pink Donut..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "plaindonut", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "pinkdonut", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pinkdonut"], "add")
                    QBCore.Functions.Notify("You made a Chocolate Donut", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false				
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:PlainDonut", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientPlainDonut', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making Plain Donut..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "donutmix", 10)
                        TriggerServerEvent('QBCore:Server:AddItem', "plaindonut", 10)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["plaindonut"], "add")
                        QBCore.Functions.Notify("You made Plain Donuts", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "plaindonut")
                else QBCore.Functions.Progressbar("pickup_sla", "Making Plain Donut..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "donutmix", 10)
                    TriggerServerEvent('QBCore:Server:AddItem', "plaindonut", 10)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["plaindonut"], "add")
                    QBCore.Functions.Notify("You made Plain Donuts", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false			
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:CheeseCake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientCheeseCake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making Strawberry Cheese Cake..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "cakemix", 1)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "strawberry", 1)
                        TriggerServerEvent('QBCore:Server:AddItem', "scheesecake", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["scheesecake"], "add")
                        QBCore.Functions.Notify("You made a Strawberry Cheese Cake", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "scheesecake")
                else QBCore.Functions.Progressbar("pickup_sla", "Making Strawberry Cheese Cake..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cakemix", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "strawberry", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "scheesecake", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["scheesecake"], "add")
                    QBCore.Functions.Notify("You made a Strawberry Cheese Cake", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false				
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:Cookie", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-trey:server:get:ingredientCookie', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                if Config.ProjectSlothPB then
                    QBCore.Functions.Progressbar("pickup_sla", "Making Cookie..", 4000, false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mp_common",
                        anim = "givetake1_a",
                        flags = 8,
                    }, {}, {}, function() -- Done
                        Working = false
                        TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('QBCore:Server:RemoveItem', "cookiemix", 1)
                        TriggerServerEvent('QBCore:Server:AddItem', "cookie", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cookie"], "add")
                        QBCore.Functions.Notify("You made a Chocolate Donut", "success")
                    end, function()
                        TriggerEvent('inventory:client:busy:status', false)
                        Working = false
                    end, "cookie")
                else QBCore.Functions.Progressbar("pickup_sla", "Making Cookie..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    Working = false
                    TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cookiemix", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "cookie", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cookie"], "add")
                    QBCore.Functions.Notify("You made a Chocolate Donut", "success")
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    Working = false				
                    end)
                end
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-trey:Smoothie", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeSmoothie()
        else
            QBCore.Functions.Notify("You don't have any Smoothie Mix..", "error")
        end
      end, 'smoothiemix')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("mb-trey:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)


RegisterNetEvent("mb-trey:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "treytray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "treytray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("mb-trey:Tray4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "treytray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "treytray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("mb-trey:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "treytray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "treytray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("mb-trey:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "treystorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "treystorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("mb-trey:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "treystorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "treystorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

-- Functions --
function MakeSmoothie()
    TriggerServerEvent('QBCore:Server:RemoveItem', "smoothiemix", 1)
    if not Working then
        if Config.ProjectSlothPB then
            QBCore.Functions.Progressbar("pickup", "Filling up a cup..", 4000, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
            }, {
                animDict = "mp_common",
                anim = "givetake1_a",
                flags = 8,
            }, {}, {}, function() -- Done
                Working = false
                TriggerServerEvent('QBCore:Server:AddItem', "smoothie", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["smoothie"], "add")
                QBCore.Functions.Notify("You made a Smoothie", "success")
            end, function()
                TriggerEvent('inventory:client:busy:status', false)
                Working = false
            end, "smoothie")
        else QBCore.Functions.Progressbar("pickup", "Filling up a cup..", 4000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = false,
        }, {
            animDict = "mp_common",
            anim = "givetake1_a",
            flags = 8,
        }, {}, {}, function() -- Done
            Working = false
            TriggerServerEvent('QBCore:Server:AddItem', "smoothie", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["smoothie"], "add")
            QBCore.Functions.Notify("You made a Smoothie", "success")
        end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Working = false
            end)
        end        
    end
end  
   
Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone("Duty", vector3(54.87, -126.21, 55.46), 3.3, 0.6, {
        name="trey on duty",
        heading=146,
        debugPoly = false,
        minZ=55.16,
        maxZ=55.96
      }, {
        options = {
            {  
                event = "mb-trey:DutyB",
                icon = "far fa-clipboard",
                label = "Clock On/Off",
                job = "trey",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("Trey tray", vector3(53.52, -125.63, 55.46), 0.8, 0.8, {
        name="Trey Tray",
        heading=340,
        debugPoly = false,
        minZ=55.46,
        maxZ=55.86
    }, {
        options = {
            {
                event = "mb-trey:Tray1",
                icon = "far fa-clipboard",
                label = "Tray 1",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("treydrinks", vector3(61.5, -120.89, 55.45), 0.8, 1.8, {
        name="trey drinks",
        heading=295,
        debugPoly = false,
        minZ=55.45,
        maxZ=56.05
        }, {
            options = {
                {
                event = "Trey:Client:DrinksMenu",
                icon = "fas fa-filter",
                label = "Make Some Drinks",
                job = "trey",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("ordermenu", vector3(55.49, -121.12, 55.45), 2.8, 0.4, {
        name="trey order",
        heading=340,
        debugPoly = false,
        minZ=53.05,
        maxZ=57.05,
        }, {
            options = {
                {
                event = "Trey:Client:OrderMenu",
                icon = "fas fa-laptop",
                label = "Order Ingredients!",
                job = "trey",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("treydisplay", vector3(56.55, -126.89, 55.46), 0.6, 1.6, {
        name="trey display shelf",
        heading=340,
        debugPoly = false,
        minZ=51.86,
        maxZ=55.86
        }, {
            options = {
                {
                event = "mb-trey:Storage",
                icon = "fas fa-box",
                label = "Storage",
                job = "trey",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("goodies", vector3(60.87, -122.52, 55.45), 0.6, 0.8, {
        name="goodies",
        heading=340,
        debugPoly=false,
        minZ=53.25,
        maxZ=55.65
        }, {
            options = {
                {
                event = "Trey:Client:TreyMenu",
                icon = "fas fa-cupcake",
                label = "Goodies to Make",
                job = "trey",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("plain", vector3(57.92, -119.53, 55.45), 0.4, 0.4, {
        name="treyplain",
        heading=340,
        debugPoly = false,
        minZ=55.25,
        maxZ=55.85
        }, {
            options = {
                {
                event = "Trey:Client:PlainMenu",
                icon = "fas fa-donut",
                label = "Make Some Bases",
                job = "trey",
            },
        },
                distance = 1.5
    })

    exports['qb-target']:AddBoxZone("donutbox", vector3(60.56, -123.2, 55.45), 0.6, 0.4, {
        name="donutbox",
        heading=350,
        debugPoly = false,
        minZ=55.25,
        maxZ=55.65
        }, {
            options = {
                {
                event = "Trey:Client:DonutMenu",
                icon = "fas fa-donut",
                label = "Make a Donut Box",
                job = "trey",
            },
        },
                distance = 1.5
    })


    exports['qb-target']:AddBoxZone("Trey_register_1", vector3(55.49, -126.48, 55.46), 0.6, 0.6, {
        name="Trey_register_1",
        heading=340,
        debugPoly=false,
        minZ=55.26,
        maxZ=55.86
        }, {
            options = {
                {
                event = "mb-trey:bill",
                parms = "1",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
                job = "trey",
            },
        },
        distance = 1.5
    })
end)


-- trey Menus
RegisterNetEvent('Trey:Client:PlainMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "| Make Base |",
            txt = "",
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["cupcake"].image.." width=30px>".."Plain Cupcake",
            txt = "Cake Mix",
            params = {
                event = "mb-trey:Cupcake"
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["plaindonut"].image.." width=30px>".."Plain Donut",
            txt = "Donut Mix",
            params = {
                event = "mb-trey:PlainDonut"
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

RegisterNetEvent('Trey:Client:DonutMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "| Make Donut Box |",
            txt = "",
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["donutbox"].image.." width=30px>".."Donut Box",
            txt = "Pink Donut x6, Chocolate Donut x6",
            params = {
                event = "mb-trey:CreateDonutBox"
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

RegisterNetEvent('Trey:Client:TreyMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "| Let's Make Some Goodies! |",
            txt = "",
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["policecookie"].image.." width=30px>".."Police Cookie",
            txt = "Cookie Mix",
            params = {
                event = "mb-trey:PoliceCookie"
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["emscupcake"].image.." width=30px>".."EMS Cupcake",
            txt = "Plain Cupcake",
            params = {
                event = "mb-trey:EmsCupcake"
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["carcupcake"].image.." width=30px>".."Car Cupcake",
            txt = "Plain Cupcake",
            params = {
                event = "mb-trey:CarCupcake"
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["chocolatecupcake"].image.." width=30px>".."Chocolate Cupcake",
            txt = "Plain Cupcake",
            params = {
                event = "mb-trey:ChocolateCupcake"
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["rvcupcake"].image.." width=30px>".."Red Velvet Cupcake",
            txt = "Plain Cupcake",
            params = {
                event = "mb-trey:RvCupcake"
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["birthdaycupcake"].image.." width=30px>".."Birthday Cupcake",
            txt = "Plain Cupcake",
            params = {
                event = "mb-trey:BirthdayCupcake"
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["chocdonut"].image.." width=30px>".."Chocolate Donut",
            txt = "Plain Donut",
            params = {
                event = "mb-trey:ChocDonut"
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["pinkdonut"].image.." width=30px>".."Pink Donut",
            txt = "Plain Donut",
            params = {
                event = "mb-trey:PinkDonut"
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["cookie"].image.." width=30px>".."Cookie",
            txt = "Cookie Mix",
            params = {
                event = "mb-trey:Cookie"
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["weddingcake"].image.." width=30px>".."Wedding Cake",
            txt = "Cake Mix x10",
            params = {
                event = "mb-trey:CreateWeddingCakeFull"
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["scheesecake"].image.." width=30px>".."Strawberry Cheese Cake",
            txt = "Cake Mix, Strawberry",
            params = {
                event = "mb-trey:CheeseCake"
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
        
RegisterNetEvent('Trey:Client:OrderMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "| Order Station |",
            txt = "",
        },
        {
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "mb-trey:shop"
            }
        },
        {
            header = "• Look on Shelf",
            txt = "See what you have in storage",
            params = {
                event = "mb-trey:Storage2"
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

RegisterNetEvent('Trey:Client:DrinksMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "| Drink Menu |",
            txt = "",
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items["smoothie"].image.." width=30px>".."Smoothie",
            txt = "Smoothie Mix",
            params = {
                event = "mb-trey:Smoothie"
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

-- Till Stuff --
RegisterNetEvent("mb-trey:bill", function()
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
        TriggerServerEvent("mb-trey:bill:player", dialog.citizenid, dialog.billprice)
    end
end)

RegisterNetEvent("mb-trey:shop", function()
    if Config.JimShops then 
        TriggerServerEvent("jim-shops:ShopOpen", "shop", "treybakery", Config.Items)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "treybakery", Config.Items)
    end
end)






--Trey Food

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
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
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
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
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
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
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
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
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
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
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
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
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
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
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
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
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
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
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
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(7, 9))
    end)
end)

--Trey Drinks

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
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
    end)
end)

