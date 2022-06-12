Config = {}

Config.JimShops = false
Config.ProjectSlothPB = true

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
}
--Drinks
ConsumeablesDrink = {
    ["smoothie"] = math.random(40, 50),
}