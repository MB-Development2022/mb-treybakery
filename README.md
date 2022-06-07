# mb-sugar




-- Add this below to qb-core > shared > jobs.lua

	["sugar"] = {
		label = "sugar",
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


    -- Sugar Bakery
	["cakemix"]		 	         	 = {["name"] = "cakemix", 			  	  	    ["label"] = "Cake Mix",    	            ["weight"] = 200, 		["type"] = "item", 	    ["image"] = "cakemix.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Cake Mix."},
	["cookiemix"]		 	         	 = {["name"] = "cookiemix", 			  	  	    ["label"] = "Cookie Mix",    	            ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "cookiemix.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Cookie Mix."},
	["donutmix"]		 	         = {["name"] = "donutmix", 			  	  	["label"] = "Donut Mix",    	        ["weight"] = 600, 		["type"] = "item", 	    ["image"] = "donutmix.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Donut Mix."},
	["icecreammix"]		 	         = {["name"] = "icecreammix", 			  	  	["label"] = "Ice cream Mix",    	        ["weight"] = 600, 		["type"] = "item", 	    ["image"] = "icecreammix.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Ice Cream Mix."},
	["emscupcake"]		 	         = {["name"] = "emscupcake", 			  	  	    ["label"] = "EMS Cupcake",    	        ["weight"] = 200, 		["type"] = "item", 	    ["image"] = "ems.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "EMS Cupcake."},
	["carcupcake"]		 	         = {["name"] = "carcupcake", 			  	  	    ["label"] = "Car Cupcake",    	            ["weight"] = 500, 		["type"] = "item", 	    ["image"] = "carcupcake.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Car Cupcake."},
	["policecookie"]		 	         	 = {["name"] = "policecookie", 			  	  	    ["label"] = "Police Cookie",    	            ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "policecookie.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Police Cookie."},
    ["cookie"]		 	         	 = {["name"] = "cookie", 			  	  	    ["label"] = "Cookie",    	            ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "cookie.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Cookie."},
    ["softdrink"] 			 = {["name"] = "softdrink", 				["label"] = "Soft Drink", 				["created"] = nil,	["decay"] = 3.0,	["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_softdrink.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ice Cold Drink."},
	["mshake"] 			     = {["name"] = "mshake", 				["label"] = "Milkshake", 				["created"] = nil,	["decay"] = 3.0,	["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_milkshake.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Hand-scooped for you!"},
    ["sugar-mshakeformula"] 		 = {["name"] = "sugar-mshakeformula", 			["label"] = "Milkshake Formula", 		["created"] = nil,	["decay"] = 3.0,	["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_ingredients_icecream.png",  ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["sugar-sodasyrup"] 		 	 = {["name"] = "sugar-sodasyrup", 				["label"] = "Soda Syrup", 		        ["created"] = nil,	["decay"] = 3.0,	["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_ingredients_hfcs.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},

	











# Dependencies: 
* **Install all dependencies**

[qb-core](https://github.com/qbcore-framework/qb-core)

[lj-inventory](https://github.com/loljoshie/lj-inventory)

[qb-menu](https://github.com/qbcore-framework/qb-menu)

[qb-target](https://github.com/qbcore-framework/qb-target)

[PolyZone](https://github.com/qbcore-framework/PolyZone)


