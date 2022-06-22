![head.png](https://i.imgur.com/N2RY20e.png)
#
<h2 align="center"> MB TreyBakery:</h2>

<p align="center">
<a href="https://www.discord.gg/cHd2cvMYZF"><img src="https://img.shields.io/discord/979284356730327070?color=d63f50&label=Our%20Discord:&labelColor=000000&logo=discord&logoColor=FFFFFF&style=flat-square"></a>
<a href="https://github.com/MB-Development2022"><img src="https://img.shields.io/github/followers/MB-Development2022?color=d63f50&label=Follow:&labelColor=000000&logo=github&logoColor=FFFFFF&style=flat-square"></a>
<a href="https://https://github.com/MB-Development2022/mb-treybakery"><img src="https://shields-io-visitor-counter.herokuapp.com/badge?page=MB-Development2022&label=Visitors:&labelColor=000000&logo=GitHub&logoColor=FFFFFF&color=d63f50&style=flat-square"></a>
<a href="https://github.com/MB-Development2022/mb-treybakery/blob/main/LICENSE.md"><img src="https://img.shields.io/badge/license-MIT-d63f50?label=License:&labelColor=000000&logo=github&style=flat-square"></a>
<a href="https://github.com/MB-Development2022/mb-treybakery/issues"><img src="https://img.shields.io/github/issues/MB-Development2022/mb-treybakery?color=d63f50&label=Issues%3A&labelColor=000000&logo=github&style=flat-square"></a>
</p>

#
<h2 align="center"> Dependencies:</h2>

<p align="center">
<a href="https://github.com/qbcore-framework/qb-core"><img src="https://img.shields.io/badge/-QB%20Core-000000?style=flat-square&logo=github&logoColor=white"></a>
<a href="https://github.com/qbcore-framework/qb-menu"><img src="https://img.shields.io/badge/-QB%20Menu-000000?style=flat-square&logo=github&logoColor=white"></a>
<a href="https://github.com/qbcore-framework/qb-input"><img src="https://img.shields.io/badge/-QB%20Input-000000?style=flat-square&logo=github&logoColor=white"></a>
<a href="https://github.com/loljoshie/lj-inventory"><img src="https://img.shields.io/badge/-LJ%20Inventory-000000?style=flat-square&logo=github&logoColor=white"></a>
<a href="https://github.com/qbcore-framework/PolyZone"><img src="https://img.shields.io/badge/-PolyZone-000000?style=flat-square&logo=github&logoColor=white"></a>
<a href="https://github.com/jimathy/jim-shops"><img src="https://img.shields.io/badge/-Jim%20Shops-000000?style=flat-square&logo=github&logoColor=white"></a>
</p>

#

<p align="center">
This is a script made for the Trey Bakery MLO. It offers a easy config with many presets already in place. It has tiered systems to baking and creating different goodies to serve. Everything is configurable threw the config!
If you have any issues with the script, or just wanna come out hang out, join our discord above!
</p>

<p align="center">
Massive shoutout to <a href="https://github.com/pushkart2"><img src="https://img.shields.io/badge/-Snipe-000000?style=flat-square&logo=github&logoColor=white"></a> for the tips, they helped alot with the new improvements!
</p>

#
<h2 align="center"> Bakery MLO:</h2>

[![Bakery](https://forum.cfx.re/uploads/default/original/4X/4/2/0/420bf17e989f58c2814f1b468126e5a60b55662c.jpeg)](https://hanestudios.tebex.io/package/4449250)

#
<h2 align="center"> Installation:</h2>

<p align="center"> Add to qbcore/shared/jobs.lua</p>

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


<p align="center"> Add to qbcore/shared/items.lua</p>

	-- Trey Bakery
	--Ingredients 
	["cakemix"]		 	         	 	= {["name"] = "cakemix", 			  	  	["label"] = "Cake Mix",    	            	["created"] = nil,		["decay"] = 3.0,		["weight"] = 200, 		["type"] = "item", 	    ["image"] = "cakemix.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Cake Mix."},
	["cookiemix"]		 	         	= {["name"] = "cookiemix", 			  	  	["label"] = "Cookie Mix",    	            ["created"] = nil,		["decay"] = 3.0,		["weight"] = 400, 		["type"] = "item", 	    ["image"] = "cookiemix.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Cookie Mix."},
	["donutmix"]		 	         	= {["name"] = "donutmix", 			  	  	["label"] = "Donut Mix",    	        	["created"] = nil,		["decay"] = 3.0,		["weight"] = 600, 		["type"] = "item", 	    ["image"] = "donutmix.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Donut Mix."},
	["icecreammix"]		 	         	= {["name"] = "icecreammix", 			  	["label"] = "Ice cream Mix",    	        ["created"] = nil,		["decay"] = 3.0,		["weight"] = 600, 		["type"] = "item", 	    ["image"] = "icecreammix.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Ice Cream Mix."},
	["strawberry"]		 	         	= {["name"] = "strawberry", 			  	["label"] = "Strawberry",    	        	["created"] = nil,		["decay"] = 3.0,		["weight"] = 600, 		["type"] = "item", 	    ["image"] = "strawberry.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Strawberry."},
	["smoothiemix"] 		 			= {["name"] = "smoothiemix", 				["label"] = "Smoothie Mix", 				["created"] = nil,		["decay"] = 3.0,		["weight"] = 125, 		["type"] = "item", 		["image"] = "ingredients_smoothie.png", ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "An Ingredient"},
	--Food		
	["emscupcake"]		 	         	= {["name"] = "emscupcake", 			  	["label"] = "EMS Cupcake",    	        	["created"] = nil,		["decay"] = 3.0,		["weight"] = 200, 		["type"] = "item", 	    ["image"] = "ems.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "EMS Cupcake."},
	["carcupcake"]		 	         	= {["name"] = "carcupcake", 			  	["label"] = "Car Cupcake",    	            ["created"] = nil,		["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "carcupcake.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Car Cupcake."},
	["chocolatecupcake"]		 	 	= {["name"] = "chocolatecupcake", 			["label"] = "Chacolate Cupcake",    	    ["created"] = nil,		["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "cupcake.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Chocolate Cupcake."},
	["rvcupcake"]		 	         	= {["name"] = "rvcupcake", 			  	  	["label"] = "Red Velvet Cupcake",    	    ["created"] = nil,		["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "cupcake2.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Red Velvet Cupcake."},
	["weddingcake"]		 	         	= {["name"] = "weddingcake", 			  	["label"] = "Wedding Cake Slice",    	    ["created"] = nil,		["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "weddingcake.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Wedding Cake Slice."},
	["weddingcakefull"]		 	     	= {["name"] = "weddingcakefull", 			["label"] = "Wedding Cake",    	        	["created"] = nil,		["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "weddingcakefull.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Wedding Cake."},
	["birthdaycupcake"]		 	     	= {["name"] = "birthdaycupcake", 			["label"] = "Birthday Cupcake",    	    	["created"] = nil,		["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "birthdaycupcake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Happy Birthday."},
	["plaincupcake"]		 	     			= {["name"] = "cupcake", 			  		["label"] = "Cupcake",    	    			["created"] = nil,		["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "Vinilla-Base.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Plain Cupcake."},
	["plaindonut"]		 	     		= {["name"] = "plaindonut", 			  	["label"] = "Plain Donut",    	    		["created"] = nil,		["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "original_glazed_td_21.png",["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Plain Donut."},
	["policecookie"]		 	        = {["name"] = "policecookie", 			  	["label"] = "Police Cookie",    	        ["created"] = nil,		["decay"] = 3.0,	    ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "policecookie.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Police Cookie."},
	["donutbox"]		 	         	= {["name"] = "donutbox", 			  	  	["label"] = "Donut Box",    	            ["created"] = nil,		["decay"] = 3.0,		["weight"] = 400, 		["type"] = "item", 	    ["image"] = "donutbox.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Donut Box."},
	["chocdonut"]		 	         	= {["name"] = "chocdonut", 			  	  	["label"] = "Chocolate Donut",    	        ["created"] = nil,		["decay"] = 3.0,	    ["weight"] = 400, 		["type"] = "item", 	    ["image"] = "chocdonut.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Chocolate Donut."},
	["pinkdonut"]		 	         	= {["name"] = "pinkdonut", 			  	  	["label"] = "Pink Donut",    	            ["created"] = nil,		["decay"] = 3.0,		["weight"] = 400, 		["type"] = "item", 	    ["image"] = "donut.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Pink Donut."},
	["scheesecake"]		 	     		= {["name"] = "scheesecake", 			  	["label"] = "Strawberry Cheese Cake",    	["created"] = nil,		["decay"] = 3.0,		["weight"] = 500, 		["type"] = "item", 	    ["image"] = "cheesecake.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Strawberry Cheese Cake."},
	["cookie"]		 	         	 	= {["name"] = "cookie", 			  	  	["label"] = "Cookie",    	            	["created"] = nil,		["decay"] = 3.0,		["weight"] = 400, 		["type"] = "item", 	    ["image"] = "cookie.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Cookie."},
	--Drinks		
	["smoothie"]		 	            = {["name"] = "smoothie", 			  	  	["label"] = "Strawberry Smoothie",    		["created"] = nil,		["decay"] = 3.0,		["weight"] = 600, 		["type"] = "item", 	    ["image"] = "smoothie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   		["combinable"] = nil,   ["description"] = "Tasty Smoothie."},
	--Toys		
	["trey-toy1"] 		 		 		= {["name"] = "trey-toy1", 					["label"] = "Donut Plushy", 				["created"] = nil,		["decay"] = 3.0,		["weight"] = 50, 		["type"] = "item", 		["image"] = "treytoy1.png", 		    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "Donut Plushy from Trey Bakery"},
	["trey-toy2"] 		 		 		= {["name"] = "trey-toy2", 					["label"] = "Sugar Glider", 				["created"] = nil,		["decay"] = 3.0,		["weight"] = 50, 		["type"] = "item", 		["image"] = "treytoy2.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "Sugar Glider Plushy from Trey Bakery"},
	
#
<h2 align="center"> Preview:</h2>
<p align="center"> WILL MAKE A BETTER PREVIEW SOON!</p>

![image](https://i.imgur.com/4nVEcxz.jpeg)
![image](https://i.imgur.com/Eijm5gM.png)
