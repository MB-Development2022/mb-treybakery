MB = {

JimShops = false,

Items = {
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
},

Registers = {
    {
        coords = vector3(),
        length = 0,
        width = 0,
        icon = "",
        event = "",
        radius = 1,
    },
},

Stash = {
    {
        coords = vector3(),
        length = 0,
        width = 0,
        icon = "",
        event = "",
        radius = 1,
    }
},

Trays = {
    {
        coords = vector3(),
        length = 0,
        width = 0,
        icon = "",
        event = "",
        radius = 1,
    }
},

WorkAreas = {
    ["blender"] = {
        coords = vector3(57.92, -119.53, 55.45),
        heading = 340,
        length = 0.4,
        width = 0.4,
        icon = "fas fa-blender",
        label = "Use Blender",
        progressMsg = "Blending...",
        progressTime = 4000,
        animDict = "amb@prop_human_bbq@male@base",
        anim = "base",
    },
    ["oven"] = {
        coords = vector3(57.92, -119.53, 55.45),
        heading = 340,
        length = 0.4,
        width = 0.4,
        icon = "",
        label = "",
        progressMsg = "",
        progressTime = 4000,
        animDict = "amb@world_human_stand_fire@male@idle_a",
        anim = "idle_a",
    },
    ["choppingboard"]= {
        coords = vector3(57.92, -119.53, 55.45),
        heading = 340,
        length = 0.4,
        width = 0.4,
        icon = "",
        label = "",
        progressMsg = "Chopping...",
        progressTime = 4000,
        animDict = "anim@heists@prison_heiststation@cop_reactions",
        anim = "cop_b_idle",
    },
    ["coffeemachine"] = {
        coords = vector3(57.92, -119.53, 55.45),
        heading = 340,
        length = 0.4,
        width = 0.4,
        icon = "",
        label = "",
        progressMsg = "Pouring...",
        progressTime = 4000,
        animDict = "mp_arresting",
        anim = "a_uncuff",
    }
},

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
},
--Drinks
ConsumeablesDrink = {
    ["smoothie"] = {effect = math.random(40, 50), event = "consumables:client:smoothie"}
    },
}