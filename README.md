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
	["sugar-toy1"] 		 		 = {["name"] = "sugar-toy1", 					["label"] = "Donut Plushy", 			["created"] = nil,		["weight"] = 50, 		["type"] = "item", 		["image"] = "sugartoy1.png", 		    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Donut Plushy from Sugar Bakery"},
	["sugar-toy2"] 		 		 = {["name"] = "sugar-toy2", 					["label"] = "Sugar Glider", 				["created"] = nil,		["weight"] = 50, 		["type"] = "item", 		["image"] = "sugartoy2.png", 			    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Sugar Glider Plushy from Sugar Bakery"},
	
	











# Dependencies: 
* **Install all dependencies**

[qb-core](https://github.com/qbcore-framework/qb-core)

[lj-inventory](https://github.com/loljoshie/lj-inventory)

[qb-menu](https://github.com/qbcore-framework/qb-menu)

[qb-target](https://github.com/qbcore-framework/qb-target)

[PolyZone](https://github.com/qbcore-framework/PolyZone)


