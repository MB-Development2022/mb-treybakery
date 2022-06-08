QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = true
PlayerJob = {}

local onDuty = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "sugar" then
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
    Sugar = AddBlipForCoord(55.33, -125.67, 55.46)
    SetBlipSprite (Sugar, 621)
    SetBlipDisplay(Sugar, 4)
    SetBlipScale  (Sugar, 0.5)
    SetBlipAsShortRange(Sugar, true)
    SetBlipColour(Sugar, 8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Sugar")
    EndTextCommandSetBlipName(Sugar)
end) 







RegisterNetEvent("mb-sugar:WeddingCakeFull", function()
    --remove box
    TriggerServerEvent('QBCore:Server:RemoveItem', "weddingcakefull", 1)
    --add items from box
    TriggerServerEvent('QBCore:Server:AddItem', "weddingcake", 12)


end)



RegisterNetEvent("mb-sugar:DonutBox", function()
		local randomToy = math.random(1,10)
		--remove box
		TriggerServerEvent('QBCore:Server:RemoveItem', "donutbox", 1)
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "chocdonut", 6)
		TriggerServerEvent('QBCore:Server:AddItem', "pinkdonut", 6)

		if randomToy < 4 then
			
			QBCore.Functions.Notify("No toy in box :(", "error")
			
		elseif randomToy == 4 then
			
			TriggerServerEvent('QBCore:Server:AddItem', "sugar-toy1", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar-toy1"], "add")
		
		elseif randomToy < 10 and randomToy > 4 then
			
			QBCore.Functions.Notify("No toy in box :(", "error")
			
		elseif randomToy == 10 then	
 
			TriggerServerEvent('QBCore:Server:AddItem', "sugar-toy2", 1)	
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar-toy2"], "add")
		else	
            QBCore.Functions.Notify("No toy in box :(", "error")
        end
end)


RegisterNetEvent("mb-sugar:CreateDonutBox", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientDonutBox', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)


















RegisterNetEvent("mb-sugar:EmsCupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientEmsCupcake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-sugar:CarCupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientCarCupcake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-sugar:ChocolateCupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientChocolateCupcake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-sugar:RvCupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientRvCupcake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-sugar:CreateWeddingCakeFull", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientWeddingCakeFull', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-sugar:BirthdayCupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientBirthdayCupcake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-sugar:Cupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientCupcake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-sugar:PoliceCookie", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientPoliceCookie', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-sugar:ChocDonut", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientChocDonut', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-sugar:PinkDonut", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientPinkDonut', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-sugar:PlainDonut", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientPlainDonut', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-sugar:CheeseCake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientCheeseCake', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("mb-sugar:Cookie", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientCookie', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
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
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)


















RegisterNetEvent("mb-sugar:Smoothie", function()
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




























RegisterNetEvent("mb-sugar:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)


RegisterNetEvent("mb-sugar:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "sugartray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "sugartray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("mb-sugar:Tray4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "sugartray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "sugartray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("mb-sugar:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "sugartray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "sugartray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("mb-sugar:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "sugarstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "sugarstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("mb-sugar:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "sugarstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "sugarstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

















-- Functions --
function MakeSmoothie()

    TriggerServerEvent('QBCore:Server:RemoveItem', "smoothiemix", 1)
    QBCore.Functions.Progressbar("pickup", "Filling up a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "smoothie", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["smoothie"], "add")
    QBCore.Functions.Notify("You made a Smoothie", "success")
    end  
   







-- bt target -

Citizen.CreateThread(function()
    

    exports['qb-target']:AddBoxZone("Duty", vector3(54.87, -126.21, 55.46), 3.3, 0.6, {
        name="sugar on duty",
        heading=146,
        --debugPoly=true,
        minZ=55.16,
        maxZ=55.96
      }, {
        options = {
            {  
                event = "mb-sugar:DutyB",
                icon = "far fa-clipboard",
                label = "Clock On/Off",
                job = "sugar",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("Sugar tray", vector3(53.52, -125.63, 55.46), 0.8, 0.8, {
        name="Sugar Tray",
        heading=340,
        --debugPoly=true,
        minZ=55.46,
        maxZ=55.86
    }, {
        options = {
            {
                event = "mb-sugar:Tray1",
                icon = "far fa-clipboard",
                label = "Tray 1",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("sugardrinks", vector3(61.5, -120.89, 55.45), 0.8, 1.8, {
        name="sugar drinks",
        heading=295,
        --debugPoly=true,
        minZ=55.45,
        maxZ=56.05
        }, {
            options = {
                {
                event = "Sugar:Client:DrinksMenu",
                icon = "fas fa-filter",
                label = "Make Some Drinks",
                job = "sugar",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("ordermenu", vector3(55.49, -121.12, 55.45), 2.8, 0.4, {
        name="sugar order",
        heading=340,
        --debugPoly=true,
        minZ=53.05,
        maxZ=57.05,
        }, {
            options = {
                {
                event = "Sugar:Client:OrderMenu",
                icon = "fas fa-laptop",
                label = "Order Ingredients!",
                job = "sugar",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("sugardisplay", vector3(56.55, -126.89, 55.46), 0.6, 1.6, {
        name="sugar display shelf",
        heading=340,
        --debugPoly=true,
        minZ=51.86,
        maxZ=55.86
        }, {
            options = {
                {
                event = "mb-sugar:Storage",
                icon = "fas fa-box",
                label = "Storage",
                job = "sugar",
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
                event = "Sugar:Client:SugarMenu",
                icon = "fas fa-cupcake",
                label = "Goodies to Make",
                job = "sugar",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("plain", vector3(57.92, -119.53, 55.45), 0.4, 0.4, {
        name="sugarplain",
        heading=340,
        --debugPoly=true,
        minZ=55.25,
        maxZ=55.85
        }, {
            options = {
                {
                event = "Sugar:Client:PlainMenu",
                icon = "fas fa-donut",
                label = "Make Some Bases",
                job = "sugar",
            },
        },
                distance = 1.5
    })

    exports['qb-target']:AddBoxZone("donutbox", vector3(60.56, -123.2, 55.45), 0.6, 0.4, {
        name="donutbox",
        heading=350,
        --debugPoly=true,
        minZ=55.25,
        maxZ=55.65
        }, {
            options = {
                {
                event = "Sugar:Client:DonutMenu",
                icon = "fas fa-donut",
                label = "Make a Donut Box",
                job = "sugar",
            },
        },
                distance = 1.5
    })


    exports['qb-target']:AddBoxZone("Sugar_register_1", vector3(55.49, -126.48, 55.46), 0.6, 0.6, {
        name="Sugar_register_1",
        heading=340,
        debugPoly=false,
        minZ=55.26,
        maxZ=55.86
        }, {
            options = {
                {
                event = "mb-sugar:bill",
                parms = "1",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
                job = "sugar",
            },
        },
        distance = 1.5
    })



end)


-- sugar Menus
RegisterNetEvent('Sugar:Client:PlainMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "| Make Base |",
            txt = "",
        },
        {
            header = "• Plain Cupcake",
            txt = "Cake Mix",
            params = {
                event = "mb-sugar:Cupcake"
            }
        },
        {
            header = "• Plain Donut",
            txt = "Donut Mix",
            params = {
                event = "mb-sugar:PlainDonut"
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

RegisterNetEvent('Sugar:Client:DonutMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "| Make Donut Box |",
            txt = "",
        },
        {
            header = "• Donut Box",
            txt = "Pink Donut x6, Chocolate Donut x6",
            params = {
                event = "mb-sugar:CreateDonutBox"
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

RegisterNetEvent('Sugar:Client:SugarMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "| Let's Make Some Goodies! |",
            txt = "",
        },
        {
            header = "• Police Cookie",
            txt = "Cookie Mix",
            params = {
                event = "mb-sugar:PoliceCookie"
            }
        },
        {
            header = "• Ems Cupcake",
            txt = "Plain Cupcake",
            params = {
                event = "mb-sugar:EmsCupcake"
            }
        },
        {
            header = "• Car Cupcake",
            txt = "Plain Cupcake",
            params = {
                event = "mb-sugar:CarCupcake"
            }
        },
        {
            header = "• Chocolate Cupcake",
            txt = "Plain Cupcake",
            params = {
                event = "mb-sugar:ChocolateCupcake"
            }
        },
        {
            header = "• Red Velvet Cupcake",
            txt = "Plain Cupcake",
            params = {
                event = "mb-sugar:RvCupcake"
            }
        },
        {
            header = "• Birthday Cupcake",
            txt = "Plain Cupcake",
            params = {
                event = "mb-sugar:BirthdayCupcake"
            }
        },
        {
            header = "• Chocolate Donut",
            txt = "Plain Donut",
            params = {
                event = "mb-sugar:ChocDonut"
            }
        },
        {
            header = "• Pink Donut",
            txt = "Plain Donut",
            params = {
                event = "mb-sugar:PinkDonut"
            }
        },
        {
            header = "• Cookie",
            txt = "Cookie Mix",
            params = {
                event = "mb-sugar:Cookie"
            }
        },
        {
            header = "• Wedding Cake",
            txt = "Cake Mix x10",
            params = {
                event = "mb-sugar:CreateWeddingCakeFull"
            }
        },
        {
            header = "• Cheese Cake",
            txt = "Cake Mix, Strawberry",
            params = {
                event = "mb-sugar:CheeseCake"
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
        
RegisterNetEvent('Sugar:Client:OrderMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "| Order Station |",
            txt = "",
        },
        {
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "mb-sugar:shop"
            }
        },
        {
            header = "• Look on Shelf",
            txt = "See what you have in storage",
            params = {
                event = "mb-sugar:Storage2"
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

RegisterNetEvent('Sugar:Client:DrinksMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "| Drink Menu |",
            txt = "",
        },
        {
            header = "• Smoothie",
            txt = "Smoothie Mix",
            params = {
                event = "mb-sugar:Smoothie"
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
RegisterNetEvent("mb-sugar:bill", function()
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
        TriggerServerEvent("mb-sugar:bill:player", dialog.citizenid, dialog.billprice)
    end
end)


 
RegisterNetEvent("mb-sugar:shop", function()


    TriggerServerEvent("inventory:server:OpenInventory", "shop", "sugar", Config.Items)


end)