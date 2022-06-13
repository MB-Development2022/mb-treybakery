Config = {}

JobName = "trey"
-- Stash Weight/Slot Info
StashWeight = 25000
StashSlots = 50
-- Tray Weight/Slot Info
TrayWeight = 25000
TraySlots = 10

-- Polyzone Information
Locations = {
    ["MixerStation"] = {name = "MixerStation", icon = "blender", coords = vector3(57.92, -119.53, 55.45), length = 0.4, width = 0.4, heading = 340, debugPoly = false, minZ = 55.25, maxZ = 55.65, distance = 1},
    ["Oven"] = {name = "Oven", icon = "fire", coords = vector3(60.99, -122.6, 55.45), length = 0.7, width = 0.8, heading = 340, debugPoly = false, minZ = 54.25, maxZ = 55.45, distance = 1},
    ["ChoppingBoard"] = {name = "ChoppingBoard", icon = "utensils", coords = vector3(60.56, -123.2, 55.45), length = 0.6, width = 0.4, heading = 340, debugPoly = false, minZ = 55.25, maxZ = 55.65, distance = 1},
    ["CoffeeMachine"] = {name = "CoffeeMachine", icon = "champagne-glasses", coords = vector3(61.46, -120.9, 55.45), length = 0.8, width = 0.6, heading = 20, debugPoly = false, minZ = 54.45, maxZ = 56.05, distance = 1},
    ["OrderStation"] = {name = "OrderStation", icon = "box-open", coords = vector3(55.49, -121.12, 55.45), length = 2.8, width = 0.4, heading = 340, debugPoly = false, minZ = 53.05, maxZ = 57.05, distance = 1},
    ["Stash"] = {name = "Stash", icon = "box-open", coords = vector3(56.55, -126.89, 55.46), length = 0.6, width = 1.6, heading = 340, debugPoly = false, minZ = 51.86, maxZ = 55.86, distance = 1},
    ["Register"] = {name = "Register", icon = "cash-register", coords = vector3(55.49, -126.48, 55.46), length = 0.6, width = 0.6, heading = 340, debugPoly = false, minZ = 55.26, maxZ = 55.86, distance = 1},
    ["Tray"] = {name = "Tray", icon = "box-open", coords = vector3(53.55, -125.76, 55.46), length = 0.6, width = 0.6, heading = 340, debugPoly = false, minZ = 55.46, maxZ = 55.86, distance = 1},
    ["Duty"] = {name = "Duty", iconoff = "arrow-right-from-bracket", iconon = "arrow-right-to-bracket", coords = vector3(54.78, -126.17, 55.46), length = 0.6, width = 0.8, heading = 340, debugPoly = false, minZ = 55.26, maxZ = 56.06, distance = 1},
}
  
-- Menu Info
Mixer = { 
    [1] = {
        station = "Mixer",
        txt = "Cupcake Mix x1",
        item = "plaincupcake",
        amount = 1,
        required = {
            [1] = {itemName = "cakemix", amount = 1},
        },
        pbmsg = "Mixing...",
        pbtime = 4000,
        animDict = "amb@prop_human_bbq@male@base",
        anim = "base",
    },
    [2] = {
        station = "Mixer",
        txt = "Donut Mix x1",
        item = "plaindonut",
        amount = 1,
        required = {
            [1] = {itemName = "donutmix", amount = 1},
        },
        pbmsg = "Mixing...",
        pbtime = 4000,
        animDict = "amb@prop_human_bbq@male@base",
        anim = "base",
    },
}

Oven = {
    [1] = {
        station = "Oven",
        txt = "Cookie Mix: x1",
        item = "policecookie",
        amount = 1,
        required = {
            [1] = {itemName = "cookiemix", amount = 1},
        },
        progressMsg = "Cooking...",
        progressTime = 4000,
        animDict = "amb@world_human_stand_fire@male@idle_a",
        anim = "idle_a",
    },
    [2] = {
        station = "Oven",
        txt = "Plain Cupcake: x1",
        item = "emscupcake",
        amount = 1,
        required = {
            [1] = {itemName = "plaincupcake", amount = 1},
        },
        progressMsg = "Cooking...",
        progressTime = 4000,
        animDict = "mp_arresting",
        anim = "a_uncuff",
    },
    [3] = {
        station = "Oven",
        txt = "Plain Cupcake: x1",
        item = "carcupcake",
        amount = 1,
        required = {
            [1] = {itemName = "plaincupcake", amount = 1},
        },
        progressMsg = "Cooking...",
        progressTime = 4000,
        animDict = "mp_arresting",
        anim = "a_uncuff",
    },
    [4] = {
        station = "Oven",
        txt = "Plain Cupcake: x1",
        item = "chocolatecupcake",
        amount = 1,
        required = {
            [1] = {itemName = "plaincupcake", amount = 1},
        },
        progressMsg = "Cooking...",
        progressTime = 4000,
        animDict = "mp_arresting",
        anim = "a_uncuff",
    },
    [5] = {
        station = "Oven",
        txt = "Plain Cupcake: x1",
        item = "rvcupcake",
        amount = 1,
        required = {
            [1] = {itemName = "plaincupcake", amount = 1},
        },
        progressMsg = "Pouring...",
        progressTime = 4000,
        animDict = "mp_arresting",
        anim = "a_uncuff",
    },
    [6] = {
        station = "Oven",
        txt = "Plain Cupcake: x1",
        item = "birthdaycupcake",
        amount = 1,
        required = {
            [1] = {itemName = "plaincupcake", amount = 1},
        },
        progressMsg = "Cooking...",
        progressTime = 4000,
        animDict = "mp_arresting",
        anim = "a_uncuff",
    },
    [7] = {
        station = "Oven",
        txt = "Plain Donut: x1",
        item = "chocdonut",
        amount = 1,
        required = {
            [1] = {itemName = "plaindonut", amount = 1},
        },
        progressMsg = "Cooking...",
        progressTime = 4000,
        animDict = "mp_arresting",
        anim = "a_uncuff",
    },
    [8] = {
        station = "Oven",
        txt = "Plain Donut: x1",
        item = "pinkdonut",
        amount = 1,
        required = {
            [1] = {itemName = "plaindonut", amount = 1},
        },
        progressMsg = "Cooking...",
        progressTime = 4000,
        animDict = "mp_arresting",
        anim = "a_uncuff",
    },
    [9] = {
        station = "Oven",
        txt = "Cookie Mix: x1",
        item = "cookie",
        amount = 1,
        required = {
            [1] = {itemName = "cookiemix", amount = 1},
        },
        progressMsg = "Cooking...",
        progressTime = 4000,
        animDict = "mp_arresting",
        anim = "a_uncuff",
    },
    [10] = {
        station = "Oven",
        txt = "Cake Mix: x10",
        item = "weddingcakefull",
        amount = 1,
        required = {
            [1] = {itemName = "cakemix", amount = 10},
        },
        progressMsg = "Cooking...",
        progressTime = 4000,
        animDict = "mp_arresting",
        anim = "a_uncuff",
    },
    [11] = {
        station = "Oven",
        txt = "Cake Mix: x1 <br> -Strawberries: x1",
        item = "scheesecake",
        amount = 1,
        required = {
            [1] = {itemName = "cakemix", amount = 1},
            [2] = {itemName = "strawberry", amount = 1}
        },
        progressMsg = "Cooking...",
        progressTime = 4000,
        animDict = "mp_arresting",
        anim = "a_uncuff",
    },
}

ChoppingBoard = {
    [1] = {
        station = "Chopping Board",
        txt = "Chocolate Donut: 6x <br>-Pink Donut: 6x",
        item = "donutbox",
        amount = 1,
        required = {
            [1] = {itemName = "chocdonut", amount = 6},
            [2] = {itemName = "pinkdonut", amount = 6}
        },
        progressMsg = "Chopping...",
        progressTime = 4000,
        animDict = "anim@heists@prison_heiststation@cop_reactions",
        anim = "cop_b_idle",
    },
}

CoffeeMachine = {
    [1] = {
        station = "Drink Station",
        txt = "Smoothie Mix x1",
        item = "smoothie",
        amount = 1,
        required = {
            [1] = {itemName = "smoothiemix", amount = 1},
        },
        progressMsg = "Pouring...",
        progressTime = 4000,
        animDict = "mp_arresting",
        anim = "a_uncuff",
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

ShopItems = {
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