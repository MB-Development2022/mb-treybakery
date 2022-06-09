# mb-trey
This is a script made for the Trey Bakery MLO. It offers a easy config with many presets already in place. 




-- Add this below to qb-core > shared > jobs.lua

	["trey"] = {
		label = "trey",
		defaultDuty = false,
		grades = {
			['0'] = {
				name = "Trainee",
				payment = 150
			},
			['1'] = {
				name = "Employee",
				payment = 350
			},
			['2'] = {
				name = "ShiftLead",
				payment = 550
			},
			['3'] = {
				name = "Manager",
				payment = 1250
			},
			['4'] = {
				name = "CEO",
				isboss = true,
				payment = 1500
			},
		},
	},







-- Add this below to qb-core > shared > items.lua


    	-- Trey Bakery

	--Ingredients 
	["cakemix"]		 	         	 = {["name"] = "cakemix", 			  	  	    ["label"] = "Cake Mix",    	            ["weight"] = 200, 		["type"] = "item", 	    ["image"] = "cakemix.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Cake Mix."},
	["cookiemix"]		 	         	 = {["name"] = "cookiemix", 			  	  	    ["label"] = "Cookie Mix",    	            ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "cookiemix.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Cookie Mix."},
	["donutmix"]		 	         = {["name"] = "donutmix", 			  	  	["label"] = "Donut Mix",    	        ["weight"] = 600, 		["type"] = "item", 	    ["image"] = "donutmix.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Donut Mix."},
	["icecreammix"]		 	         = {["name"] = "icecreammix", 			  	  	["label"] = "Ice cream Mix",    	        ["weight"] = 600, 		["type"] = "item", 	    ["image"] = "icecreammix.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Ice Cream Mix."},
	["strawberry"]		 	         = {["name"] = "strawberry", 			  	  	["label"] = "Strawberry",    	        ["weight"] = 600, 		["type"] = "item", 	    ["image"] = "strawberry.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Strawberry."},
	["smoothiemix"] 		 = {["name"] = "smoothiemix", 			["label"] = "Smoothie Mix", 		["created"] = nil,	["decay"] = 3.0,	["weight"] = 125, 		["type"] = "item", 		["image"] = "ingredients_smoothie.png",  ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	--Food
	["emscupcake"]		 	         = {["name"] = "emscupcake", 			  	  	    ["label"] = "EMS Cupcake",    	        ["weight"] = 200, 		["type"] = "item", 	    ["image"] = "ems.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "EMS Cupcake."},
	["carcupcake"]		 	         = {["name"] = "carcupcake", 			  	  	    ["label"] = "Car Cupcake",    	            ["weight"] = 500, 		["type"] = "item", 	    ["image"] = "carcupcake.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Car Cupcake."},
	["chocolatecupcake"]		 	         = {["name"] = "chocolatecupcake", 			  	  	    ["label"] = "Chacolate Cupcake",    	            ["weight"] = 500, 		["type"] = "item", 	    ["image"] = "cupcake.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Chocolate Cupcake."},
	["rvcupcake"]		 	         = {["name"] = "rvcupcake", 			  	  	    ["label"] = "Red Velvet Cupcake",    	            ["weight"] = 500, 		["type"] = "item", 	    ["image"] = "cupcake2.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Red Velvet Cupcake."},
	["weddingcake"]		 	         = {["name"] = "weddingcake", 			  	  	["label"] = "Wedding Cake Slice",    	        ["created"] = nil,	["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "weddingcake.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Wedding Cake Slice."},
	["weddingcakefull"]		 	         = {["name"] = "weddingcakefull", 			  	  	["label"] = "Wedding Cake",    	        ["created"] = nil,	["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "weddingcakefull.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Wedding Cake."},
	["birthdaycupcake"]		 	     = {["name"] = "birthdaycupcake", 			  	["label"] = "Birthday Cupcake",    	    ["created"] = nil,	["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "birthdaycupcake.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Happy Birthday."},
	["cupcake"]		 	     = {["name"] = "cupcake", 			  	["label"] = "Cupcake",    	    ["created"] = nil,	["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "Vinilla-Base.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Plain Cupcake."},
	["plaindonut"]		 	     = {["name"] = "plaindonut", 			  	["label"] = "Plain Donut",    	    ["created"] = nil,	["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "original_glazed_td_21.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Plain Donut."},
	["policecookie"]		 	         	 = {["name"] = "policecookie", 			  	  	    ["label"] = "Police Cookie",    	            ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "policecookie.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Police Cookie."},
	["donutbox"]		 	         	 = {["name"] = "donutbox", 			  	  	    ["label"] = "Donut Box",    	            ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "donutbox.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Donut Box."},
	["chocdonut"]		 	         	 = {["name"] = "chocdonut", 			  	  	    ["label"] = "Chocolate Donut",    	            ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "chocdonut.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Chocolate Donut."},
	["pinkdonut"]		 	         	 = {["name"] = "pinkdonut", 			  	  	    ["label"] = "Pink Donut",    	            ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "donut.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Pink Donut."},
	["scheesecake"]		 	     = {["name"] = "scheesecake", 			  	["label"] = "Strawberry Cheese Cake",    	    ["created"] = nil,	["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "cheesecake.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Strawberry Cheese Cake."},
	["cookie"]		 	         	 = {["name"] = "cookie", 			  	  	    ["label"] = "Cookie",    	            ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "cookie.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Cookie."},
	--Drinks
	["smoothie"]		 	             = {["name"] = "smoothie", 			  	  	    ["label"] = "Strawberry Smoothie",    ["weight"] = 600, 		["type"] = "item", 	    ["image"] = "smoothie.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Tasty Smoothie."},
	--Toys
	["trey-toy1"] 		 		 = {["name"] = "trey-toy1", 					["label"] = "Donut Plushy", 			["created"] = nil,		["weight"] = 50, 		["type"] = "item", 		["image"] = "treytoy1.png", 		    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Donut Plushy from Trey Bakery"},
	["trey-toy2"] 		 		 = {["name"] = "trey-toy2", 					["label"] = "Sugar Glider", 				["created"] = nil,		["weight"] = 50, 		["type"] = "item", 		["image"] = "treytoy2.png", 			    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Sugar Glider Plushy from Trey Bakery"},
	
	
-- Add this below to qb-smallresources > client > consumables.lua
	
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



-- Add this below to qb-smallresources > server > consumables.lua

	--Trey Food

	QBCore.Functions.CreateUseableItem("emscupcake", function(source, item)
    	local Player = QBCore.Functions.GetPlayer(source)
    	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        	TriggerClientEvent("consumables:client:emscupcake", source, item.name) 
    	end
	end)

	QBCore.Functions.CreateUseableItem("carcupcake", function(source, item)
    	local Player = QBCore.Functions.GetPlayer(source)
    	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        	TriggerClientEvent("consumables:client:carcupcake", source, item.name) 
    	end
	end)

	QBCore.Functions.CreateUseableItem("chocolatecupcake", function(source, item)
    	local Player = QBCore.Functions.GetPlayer(source)
    	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        	TriggerClientEvent("consumables:client:chocolatecupcake", source, item.name) 
    	end
	end)

	QBCore.Functions.CreateUseableItem("rvcupcake", function(source, item)
    	local Player = QBCore.Functions.GetPlayer(source)
    	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        	TriggerClientEvent("consumables:client:rvcupcake", source, item.name) 
    	end
	end)

	QBCore.Functions.CreateUseableItem("weddingcake", function(source, item)
    	local Player = QBCore.Functions.GetPlayer(source)
    	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        	TriggerClientEvent("consumables:client:weddingcake", source, item.name) 
    	end
	end)

	QBCore.Functions.CreateUseableItem("birthdaycupcake", function(source, item)
    	local src = source
    	local Player = QBCore.Functions.GetPlayer(src)
    	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        	TriggerClientEvent("consumables:client:Eat", src, item.name)
    	end
	end)

	QBCore.Functions.CreateUseableItem("policecookie", function(source, item)
    	local Player = QBCore.Functions.GetPlayer(source)
    	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        	TriggerClientEvent("consumables:client:policecookie", source, item.name) 
    	end
	end)

	QBCore.Functions.CreateUseableItem("chocdonut", function(source, item)
    	local Player = QBCore.Functions.GetPlayer(source)
    	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        	TriggerClientEvent("consumables:client:chocdonut", source, item.name) 
    	end
	end)

	QBCore.Functions.CreateUseableItem("pinkdonut", function(source, item)
    	local Player = QBCore.Functions.GetPlayer(source)
    	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        	TriggerClientEvent("consumables:client:pinkdonut", source, item.name) 
    	end
	end)

	QBCore.Functions.CreateUseableItem("scheesecake", function(source, item)
    	local Player = QBCore.Functions.GetPlayer(source)
    	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        	TriggerClientEvent("consumables:client:scheesecake", source, item.name) 
    	end
	end)

	QBCore.Functions.CreateUseableItem("cookie", function(source, item)
    	local Player = QBCore.Functions.GetPlayer(source)
    	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        	TriggerClientEvent("consumables:client:cookie", source, item.name) 
    	end
	end)

	--Trey Drinks

	QBCore.Functions.CreateUseableItem("smoothie", function(source, item)
    	local Player = QBCore.Functions.GetPlayer(source)
    	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        	TriggerClientEvent("consumables:client:smoothie", source, item.name) 
    	end
	end)
	


-- Add this below to qb-smallresources > config.lua

	--Food

	["emscupcake"] = math.random(40, 50),
	["carcupcake"] = math.random(40, 50),
	["chocolatecupcake"] = math.random(40, 50),
    ["rvcupcake"] = math.random(40, 50),
	["weddingcake"] = math.random(40, 50),
	["birthdaycupcake"] = math.random(70, 80),
	["policecookie"] = math.random(40, 50),
	["chocdonut"] = math.random(40, 50),
	["pinkdonut"] = math.random(40, 50),
	["scheesecake"] = math.random(40, 50),
	["cookie"] = math.random(40, 50),

	--Drinks

	["smoothie"] = math.random(40, 50),
	







# Dependencies: 
* **Install all dependencies**

[qb-core](https://github.com/qbcore-framework/qb-core)

[lj-inventory](https://github.com/loljoshie/lj-inventory)

[qb-menu](https://github.com/qbcore-framework/qb-menu)

[qb-input](https://github.com/qbcore-framework/qb-input)

[qb-target](https://github.com/qbcore-framework/qb-target)

[PolyZone](https://github.com/qbcore-framework/PolyZone)


# Bakery MLO

[TreyBakery](https://hanestudios.tebex.io/package/4449250)

![image](https://forum.cfx.re/uploads/default/original/4X/4/2/0/420bf17e989f58c2814f1b468126e5a60b55662c.jpeg)