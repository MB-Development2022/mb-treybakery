-- PolyZones 
CreateThread(function()
    exports['qb-target']:AddBoxZone(Locations["MixerStation"].name, Locations["MixerStation"].coords, Locations["MixerStation"].length, Locations["MixerStation"].width, {
        name = Locations["MixerStation"].name,
        heading = Locations["MixerStation"].heading,
        debugPoly = Locations["MixerStation"].debugPoly,
        minZ = Locations["MixerStation"].minZ,
        maxZ = Locations["MixerStation"].maxZ
        }, {
            options = {
                {
                action = function()
                    TriggerEvent('mb-treybakery:client:openmenu', Mixer)
                end,
                icon = "fas fa-"..Locations["MixerStation"].icon,
                label = "Use Mixing Station",
                job = JobName,
            },
        },
            distance = Locations["MixerStation"].distance
    })
    exports['qb-target']:AddBoxZone(Locations["CoffeeMachine"].name, Locations["CoffeeMachine"].coords, Locations["CoffeeMachine"].length, Locations["CoffeeMachine"].width, {
        name = Locations["CoffeeMachine"].name,
        heading = Locations["CoffeeMachine"].heading,
        debugPoly = Locations["CoffeeMachine"].debugPoly,
        minZ = Locations["CoffeeMachine"].minZ,
        maxZ = Locations["CoffeeMachine"].maxZ
        }, {
            options = {
                {
                action = function()
                    TriggerEvent('mb-treybakery:client:openmenu', CoffeeMachine)
                end,
                icon = "fas fa-"..Locations["CoffeeMachine"].icon,
                label = "Use Drink Machine",
                job = JobName,
            },
        },
        distance = Locations["CoffeeMachine"].distance
    })
    exports['qb-target']:AddBoxZone(Locations["Oven"].name, Locations["Oven"].coords, Locations["Oven"].length, Locations["Oven"].width, {
        name = Locations["Oven"].name,
        heading = Locations["Oven"].heading,
        debugPoly = Locations["Oven"].debugPoly,
        minZ = Locations["Oven"].minZ,
        maxZ = Locations["Oven"].maxZ
        }, {
            options = {
                {
                action = function()
                    TriggerEvent('mb-treybakery:client:openmenu', Oven)
                end,
                icon = "fas fa-"..Locations["Oven"].icon,
                label = "Use Oven",
                job = JobName,
            },
        },
        distance = Locations["Oven"].distance
    })
    exports['qb-target']:AddBoxZone(Locations["ChoppingBoard"].name, Locations["ChoppingBoard"].coords, Locations["ChoppingBoard"].length, Locations["ChoppingBoard"].width, {
        name = Locations["ChoppingBoard"].name,
        heading = Locations["ChoppingBoard"].heading,
        debugPoly = Locations["ChoppingBoard"].debugPoly,
        minZ = Locations["ChoppingBoard"].minZ,
        maxZ = Locations["ChoppingBoard"].maxZ
        }, {
            options = {
                {
                action = function()
                    TriggerEvent('mb-treybakery:client:openmenu', ChoppingBoard)
                end,
                icon = "fas fa-"..Locations["ChoppingBoard"].icon,
                label = "Use Chopping Board",
                job = JobName,
            },
        },
                distance = Locations["ChoppingBoard"].distance
    })
    exports['qb-target']:AddBoxZone(Locations["OrderStation"].name, Locations["OrderStation"].coords, Locations["OrderStation"].length, Locations["OrderStation"].width, {
        name = Locations["OrderStation"].name,
        heading = Locations["OrderStation"].heading,
        debugPoly = Locations["OrderStation"].debugPoly,
        minZ = Locations["OrderStation"].minZ,
        maxZ = Locations["OrderStation"].maxZ
        }, {
            options = {
                {
                event = "mb-treybakery:client:ordermenu",
                icon = "fas fa-"..Locations["OrderStation"].icon,
                label = "Use Shelve",
                job = JobName,
            },
        },
        distance = Locations["OrderStation"].distance
    })
    exports['qb-target']:AddBoxZone(Locations["Tray"].name, Locations["Tray"].coords, Locations["Tray"].length, Locations["Tray"].width, {
        name = Locations["Tray"].name,
        heading = Locations["Tray"].heading,
        debugPoly = Locations["Tray"].debugPoly,
        minZ = Locations["Tray"].minZ,
        maxZ = Locations["Tray"].maxZ
        }, {
            options = {
                {
                event = "mb-treybakery:client:trey",
                icon = "fas fa-"..Locations["Tray"].icon,
                label = "Use Tray",
                job = JobName,
            },
        },
        distance = Locations["Tray"].distance
    })
    exports['qb-target']:AddBoxZone(Locations["Stash"].name, Locations["Stash"].coords, Locations["Stash"].length, Locations["Stash"].width, {
        name = Locations["Stash"].name,
        heading = Locations["Stash"].heading,
        debugPoly = Locations["Stash"].debugPoly,
        minZ = Locations["Stash"].minZ,
        maxZ = Locations["Stash"].maxZ
        }, {
            options = {
                {
                action = function()
                    TriggerEvent('mb-treybakery:client:storage', "front")
                end,
                icon = "fas fa-"..Locations["Stash"].icon,
                label = "Open Stash",
                job = JobName,
            },
        },
        distance = Locations["Stash"].distance
    })
    exports['qb-target']:AddBoxZone(Locations["Register"].name, Locations["Register"].coords, Locations["Register"].length, Locations["Register"].width, {
        name = Locations["Register"].name,
        heading = Locations["Register"].heading,
        debugPoly = Locations["Register"].debugPoly,
        minZ = Locations["Register"].minZ,
        maxZ = Locations["Register"].maxZ
        }, {
            options = {
                {
                event = "mb-treybakery:client:bill",
                icon = "fas fa-"..Locations["Register"].icon,
                label = "Use Register",
                job = JobName,
            },
        },
        distance = Locations["Register"].distance
    })
    exports['qb-target']:AddBoxZone(Locations["Duty"].name, Locations["Duty"].coords, Locations["Duty"].length, Locations["Duty"].width, {
        name = Locations["Duty"].name,
        heading = Locations["Duty"].heading,
        debugPoly = Locations["Duty"].debugPoly,
        minZ = Locations["Duty"].minZ,
        maxZ = Locations["Duty"].maxZ
        }, {
            options = {
                {
                event = "mb-treybakery:client:duty",
                icon = "fas fa-"..Locations["Duty"].iconoff,
                label = "Go Off Duty",
                canInteract = function()
                    return exports['mb-treybakery']:OnDuty() == true
                end,
                job = JobName,
            },
            {
                event = "mb-treybakery:client:duty",
                icon = "fas fa-"..Locations["Duty"].iconon,
                label = "Go On Duty",
                canInteract = function()
                    return exports['mb-treybakery']:OnDuty() == false
                end,
                job = JobName,
            },
        },
        distance = Locations["Duty"].distance
    })
end)