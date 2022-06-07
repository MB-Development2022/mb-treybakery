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











RegisterNetEvent("mb-sugar:SugarMeal", function()
		local randomToy = math.random(1,10)
		--remove box
		TriggerServerEvent('QBCore:Server:RemoveItem', "sugarmeal", 1)
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "sugar-heartstopper", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "sugar-softdrink", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "sugar-fries", 1)

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


RegisterNetEvent("mb-sugar:CreateSugarMeal", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('mb-sugar:server:get:ingredientSugarMeal', function(HasItems)  
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("pickup_sla", "Making A Sugar Meal..", 4000, false, true, {
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
					TriggerServerEvent('QBCore:Server:RemoveItem', "sugar-fries", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "sugar-heartstopper", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "sugar-softdrink", 1)


					TriggerServerEvent('QBCore:Server:AddItem', "sugarmeal", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugarmeal"], "add")

                    QBCore.Functions.Notify("You made a A Sugar Meal", "success")
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
					TriggerServerEvent('QBCore:Server:RemoveItem', "cakemix", 1)
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
					TriggerServerEvent('QBCore:Server:RemoveItem', "cakemix", 1)
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


















RegisterNetEvent("mb-sugar:SoftDrink", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeSoftDrink()
        else
            QBCore.Functions.Notify("You don't have any Drink syrup..", "error")
        end
      end, 'sugar-sodasyrup')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)


RegisterNetEvent("mb-sugar:mShake", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeMShake()
        else
            QBCore.Functions.Notify("You don't have any Drink Formula..", "error")
        end
      end, 'sugar-mshakeformula')
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
function MakeSoftDrink()

    TriggerServerEvent('QBCore:Server:RemoveItem', "sugar-sodasyrup", 1)
    QBCore.Functions.Progressbar("pickup", "Filling a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "sugar-softdrink", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar-softdrink"], "add")
    QBCore.Functions.Notify("You made a Soda", "success")
    end  


function MakeMShake()

    TriggerServerEvent('QBCore:Server:RemoveItem', "sugar-mshakeformula", 1)
    QBCore.Functions.Progressbar("pickup", "Filling up a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "sugar-mshake", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar-mshake"], "add")
    QBCore.Functions.Notify("You made a Milkshake", "success")
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

    exports['qb-target']:AddBoxZone("sugarcooker", vector3(60.87, -122.52, 55.45), 0.6, 0.8, {
        name="sugar cooker",
        heading=340,
        --debugPoly=true,
        minZ=53.25,
        maxZ=55.65
        }, {
            options = {
                {
                event = "mb-sugar:PattyFry",
                icon = "fas fa-birthday-cake",
                label = "Cook Station",
                job = "sugar",
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

    exports['qb-target']:AddBoxZone("sugardrinks2", vector3(60.02, -125.03, 55.45), 0.8, 0.6, {
        name="sugar fridge drink",
        heading=340,
        --debugPoly=true,
        minZ=52.45,
        maxZ=56.45
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

    exports['qb-target']:AddBoxZone("craftsugar", vector3(60.87, -122.52, 55.45), 0.6, 0.8, {
        name="sugar cooker",
        heading=340,
        debugPoly=false,
        minZ=53.25,
        maxZ=55.65
        }, {
            options = {
                {
                event = "Sugar:Client:SugarMenu",
                icon = "fas fa-cheesesugar",
                label = "Goodies to Make",
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
RegisterNetEvent('Sugar:Client:SugarMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "| Available Goodies |",
            txt = "",
        },
        {
            header = "• Car Cupcake",
            txt = "Cake Mix",
            params = {
                event = "mb-sugar:CarCupcake"
            }
        },
        {
            header = "• EMS Cupcake",
            txt = "Cake Mix",
            params = {
                event = "mb-sugar:EmsCupcake"
            }
        },
        {
            header = "• Police Cookie",
            txt = "Cookie Mix",
            params = {
                event = "mb-sugar:PoliceCookie"
            }
        },
        {
            header = "• Cupcake",
            txt = "Cake Mix",
            params = {
                event = "mb-sugar:CupCake"
            }
        },
        {
            header = "• Sugar Meal",
            txt = "",
            params = {
                event = "mb-sugar:CreateSugarMeal"
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
            header = "• Soft Drink",
            txt = "Soda Syrup",
            params = {
                event = "mb-sugar:SoftDrink"
            }
        },
        {
            header = "• Milkshake",
            txt = "Milkshake Formula",
            params = {
                event = "mb-sugar:mShake"
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