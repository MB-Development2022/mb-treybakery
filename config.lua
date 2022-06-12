Config = {}

-- Polyzone Info
Locations = {
    [1] = {coords = vector3(57.92, -119.53, 55.45), heading = 340, length = 0.4, width = 0.4, minz = 0, maxz = 0, distance = 1, icon = "fas fa-blender", label = "Use Blender", station = Mixer},
    [2] = {coords = vector3(57.92, -119.53, 55.45), heading = 340, length = 0.4, width = 0.4, minz = 0, maxz = 0, distance = 1, icon = "fas fa-blender", label = "Use Blender", station = Oven},
    [3] = {coords = vector3(57.92, -119.53, 55.45), heading = 340, length = 0.4, width = 0.4, minz = 0, maxz = 0, distance = 1, icon = "fas fa-blender", label = "Use Blender", station = ChoppingBoard},
    [4] = {coords = vector3(57.92, -119.53, 55.45), heading = 340, length = 0.4, width = 0.4, minz = 0, maxz = 0, distance = 1, icon = "fas fa-blender", label = "Use Blender", station = CoffeeMachine},
}

-- Menu Info
Mixer = { 
    [1] = {
        header = "Plain Cupcake:",
        txt = "- Cupcake Mix x1",
        item = "cupcake",
        amount = 1,
        required = {
            [1] = {itemName = "meth_table", amount = 1},
        },
        pbmsg = "Mixing...",
        pbtime = 4000,
        animDict = "amb@prop_human_bbq@male@base",
        anim = "base",
    },
    [2] = {
        header = "Plain Donut:",
        txt = "- Donut Mix x1",
        item = "plaindonut",
        amount = 1,
        required = {
            [1] = {itemName = "meth_table", amount = 1},
        },
        pbmsg = "Mixing...",
        pbtime = 4000,
        animDict = "amb@prop_human_bbq@male@base",
        anim = "base",
    },
}

Oven = {
    header = "",
    txt = "",
    item = "",
    amount = 1,
    required = {
        [1] = {itemName = "", amount = 1},
    },
    progressMsg = "",
    progressTime = 4000,
    animDict = "amb@world_human_stand_fire@male@idle_a",
    anim = "idle_a",
}

ChoppingBoard = {
    header = "",
    txt = "",
    item = "",
    amount = 1,
    required = {
        [1] = {itemName = "", amount = 1},
    },
    progressMsg = "Chopping...",
    progressTime = 4000,
    animDict = "anim@heists@prison_heiststation@cop_reactions",
    anim = "cop_b_idle",
}

CoffeeMachine = {
    header = "",
    txt = "",
    item = "",
    amount = 1,
    required = {
        [1] = {itemName = "", amount = 1},
    },
    progressMsg = "Pouring...",
    progressTime = 4000,
    animDict = "mp_arresting",
    anim = "a_uncuff",
}


--Food
ConsumeablesEat = {
    ["emscupcake"] = {effect = math.random(40, 50), },
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
