Config = Config or {}

Config = {
    Craft = {
        {
            -- Others
            JobRequired = nil,
            MarkerEnable = true,
            MarkerType = 21,
            MarkerColorR = 0,
            MarkerColorG = 0,
            MarkerColorB = 0,
            MarkerSizeLargeur = 0.3,
            MarkerSizeEpaisseur = 0.3,
            MarkerSizeHauteur = 0.3,
            MarkerSaute = false, 
            MarkerTourne = false,
            MarkerDistance = 3.0,
            InteractionDistance = 1.0,
            HelpNotification = "Appuyez sur ~INPUT_CONTEXT~ pour intéragir.",
            TimeCooldown = 5, -- Temps en seconde 
            -- Position
            pos = vector3(2851.12, 1467.5, 24.55),
            -- AddInventory
            Add = true, -- Si vous souhaitez activé l'add inventory
            itemGive = {"bread", "water"}, -- Liste des items give, vous aurez un item au hasard parmi la liste, si la liste contient un seul élément vous aurez toujours cet item
            countMin = 1, -- Nombre d'item give minimum
            countMax = 1, -- Nombre d'item give maximum
            -- RemoveInventory
            Remove = true, -- Si vous souhaitez activé le remove inventory
            itemRemove = {"bread", "water"}, -- Liste des items remove, vous perdrez un item au hasard parmi la liste, si la liste contient un seul élément vous perdrez toujours cet item
            cbMin = 1, -- Nombre d'item remove minimum
            cbMax = 1, -- Nombre d'item remove maximum
        },
    },
    Craft2 = {
        {
            -- Others
            Job = nil, 
            MarkerEnable = true,
            MarkerType = 21,
            MarkerColorR = 0,
            MarkerColorG = 0,
            MarkerColorB = 0,
            MarkerSizeLargeur = 0.3,
            MarkerSizeEpaisseur = 0.3,
            MarkerSizeHauteur = 0.3,
            MarkerSaute = false, 
            MarkerTourne = false,
            MarkerDistance = 3.0,
            InteractionDistance = 1.0,
            helpNotif = "Appuyez sur ~INPUT_CONTEXT~ pour faire des burgers.", 
            TimeCooldown = 5, -- Temps en seconde 
            -- Position
            pos = vector3(-1345.727, -554.9702, 30.46655),
            -- Farm
            Need = {
                {Item = "bread", Nb = 1},
            }, 
            Result = {
                {Item ="water", Nb = 1}
            }
        },
    },
}

--- Xed#1188 | https://discord.gg/HvfAsbgVpM