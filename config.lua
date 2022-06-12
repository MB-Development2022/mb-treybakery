Config = {}

Config.JimShops = false

Config.Items = {
label = "Shop",
    slots = 7,
    items = {
        [1] = {
            name = "cakemix",  
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "cookiemix",   
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "donutmix", 
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "smoothiemix",  
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "strawberry",  
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
    }
}

--Food
ConsumeablesEat = {
    ["emscupcake"] = {effect = math.random(40, 50), event = "consumables:client:emscupcake"},
    ["carcupcake"] = {effect = math.random(40, 50), event = "consumables:client:carcupcake"},
    ["chocolatecupcake"] = {effect = math.random(40, 50), event = "consumables:client:chocolatecupcake"},
    ["rvcupcake"] = {effect = math.random(40, 50), event = "consumables:client:rvcupcake"},
    ["weddingcake"] = {effect = math.random(40, 50), event = "consumables:client:weddingcake"},
    ["birthdaycupcake"] = {effect = math.random(70, 80), event = "consumables:client:birthdaycupcake"},
    ["policecookie"] = {effect = math.random(40, 50), event = "consumables:client:policecookie"},
    ["chocdonut"] = {effect = math.random(40, 50), event = "consumables:client:chocdonut"},
    ["pinkdonut"] = {effect = math.random(40, 50), event = "consumables:client:pinkdonut"},
    ["scheesecake"] = {effect = math.random(40, 50), event = "consumables:client:scheesecake"},
    ["cookie"] = {effect = math.random(40, 50), event = "consumables:client:cookie"},
}
--Drinks
ConsumeablesDrink = {
    ["smoothie"] = {effect = math.random(40, 50), event = "consumables:client:smoothie"}
}