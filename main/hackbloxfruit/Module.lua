local Module = {} do
  local CachedBaseParts = {}
  local CachedEnemies = {}
  local CachedBring = {}
  local CachedChars = {}
  local CachedTools = {}
  local Items = {}
  
  local placeId = game.PlaceId
  local HitBoxSize = Vector3.new(50, 50, 50)
  local SeaList = {"TravelMain", "TravelDressrosa", "TravelZou"}
  
  Module.Sea = (placeId == 2753915549 and 1) or (placeId == 4442272183 and 2) or (placeId == 7449423635 and 3) or 0
  
  Module.AttackCooldown = 0
  Module.MaxLevel = 2600
  Module.Christmas = true
  
  Module.allMobs = { __RaidBoss = {}, __Bones = {}, __Elite = {}, __CakePrince = {} }
  Module.Progress = {}
  Module.SpawnedFruits = {}
  Module.BossesName = {}
  Module.EnemyLocations = {}
  Module.SpawnLocations = {}
  
  Module.FruitsId = {
    ["rbxassetid://15060012861"] = "Rocket-Rocket",
    ["rbxassetid://15057683975"] = "Spin-Spin",
    ["rbxassetid://15104782377"] = "Chop-Chop",
    ["rbxassetid://15105281957"] = "Spring-Spring",
    ["rbxassetid://15116740364"] = "Bomb-Bomb",
    ["rbxassetid://15116696973"] = "Smoke-Smoke",
    ["rbxassetid://15107005807"] = "Spike-Spike",
    ["rbxassetid://15111584216"] = "Flame-Flame",
    ["rbxassetid://15112469964"] = "Falcon-Falcon",
    ["rbxassetid://15100433167"] = "Ice-Ice",
    ["rbxassetid://15111517529"] = "Sand-Sand",
    ["rbxassetid://15111553409"] = "Dark-Dark",
    ["rbxassetid://15112600534"] = "Diamond-Diamond",
    ["rbxassetid://15100283484"] = "Light-Light",
    ["rbxassetid://15104817760"] = "Rubber-Rubber",
    ["rbxassetid://15100485671"] = "Barrier-Barrier",
    ["rbxassetid://15112333093"] = "Ghost-Ghost",
    ["rbxassetid://15105350415"] = "Magma-Magma",
    ["rbxassetid://15057718441"] = "Quake-Quake",
    ["rbxassetid://15100313696"] = "Buddha-Buddha",
    ["rbxassetid://15116730102"] = "Love-Love",
    ["rbxassetid://15116967784"] = "Spider-Spider",
    ["rbxassetid://14661873358"] = "Sound-Sound",
    ["rbxassetid://15100246632"] = "Phoenix-Phoenix",
    ["rbxassetid://15112215862"] = "Portal-Portal",
    ["rbxassetid://15116747420"] = "Rumble-Rumble",
    ["rbxassetid://15116721173"] = "Pain-Pain",
    ["rbxassetid://15100384816"] = "Blizzard-Blizzard",
    ["rbxassetid://15100299740"] = "Gravity-Gravity",
    ["rbxassetid://14661837634"] = "Mammoth-Mammoth",
    ["rbxassetid://15708895165"] = "T-Rex-T-Rex",
    ["rbxassetid://15100273645"] = "Dough-Dough",
    ["rbxassetid://15112263502"] = "Shadow-Shadow",
    ["rbxassetid://15100184583"] = "Control-Control",
    ["rbxassetid://15106768588"] = "Leopard-Leopard",
    ["rbxassetid://15482881956"] = "Kitsune-Kitsune",
    ["https://assetdelivery.roblox.com/v1/asset/?id=10395893751"] = "Venom-Venom",
    ["https://assetdelivery.roblox.com/v1/asset/?id=10537896371"] = "Dragon-Dragon"
  }
  Module.Bosses = {
    -- Bosses Sea 1
    ["Saber Expert"] = {
      NoQuest = true,
      Position = CFrame.new(-1461, 30, -51)
    },
    ["The Saw"] = {
      RaidBoss = true,
      Position = CFrame.new(-690, 15, 1583)
    },
    ["Greybeard"] = {
      RaidBoss = true,
      Position = CFrame.new(-4807, 21, 4360)
    },
    ["The Gorilla King"] = {
      IsBoss = true,
      Level = 20,
      Position = CFrame.new(-1128, 6, -451),
      Quest = {"JungleQuest", CFrame.new(-1598, 37, 153)}
    },
    ["Bobby"] = {
      IsBoss = true,
      Level = 55,
      Position = CFrame.new(-1131, 14, 4080),
      Quest = {"BuggyQuest1", CFrame.new(-1140, 4, 3829)}
    },
    ["Yeti"] = {
      IsBoss = true,
      Level = 105,
      Position = CFrame.new(1185, 106, -1518),
      Quest = {"SnowQuest", CFrame.new(1385, 87, -1298)}
    },
    ["Vice Admiral"] = {
      IsBoss = true,
      Level = 130,
      Position = CFrame.new(-4807, 21, 4360),
      Quest = {"MarineQuest2", CFrame.new(-5035, 29, 4326), 2}
    },
    ["Swan"] = {
      IsBoss = true,
      Level = 240,
      Position = CFrame.new(5230, 4, 749),
      Quest = {"ImpelQuest", CFrame.new(5191, 4, 692)}
    },
    ["Chief Warden"] = {
      IsBoss = true,
      Level = 230,
      Position = CFrame.new(5230, 4, 749),
      Quest = {"ImpelQuest", CFrame.new(5191, 4, 692), 2}
    },
    ["Warden"] = {
      IsBoss = true,
      Level = 220,
      Position = CFrame.new(5230, 4, 749),
      Quest = {"ImpelQuest", CFrame.new(5191, 4, 692), 1}
    },
    ["Magma Admiral"] = {
      IsBoss = true,
      Level = 350,
      Position = CFrame.new(-5694, 18, 8735),
      Quest = {"MagmaQuest", CFrame.new(-5319, 12, 8515)}
    },
    ["Fishman Lord"] = {
      IsBoss = true,
      Level = 425,
      Position = CFrame.new(61350, 31, 1095),
      Quest = {"FishmanQuest", CFrame.new(61122, 18, 1567)}
    },
    ["Wysper"] = {
      IsBoss = true,
      Level = 500,
      Position = CFrame.new(-7927, 5551, -637),
      Quest = {"SkyExp1Quest", CFrame.new(-7861, 5545, -381)}
    },
    ["Thunder God"] = {
      IsBoss = true,
      Level = 575,
      Position = CFrame.new(-7751, 5607, -2315),
      Quest = {"SkyExp2Quest", CFrame.new(-7903, 5636, -1412)}
    },
    ["Cyborg"] = {
      IsBoss = true,
      Level = 675,
      Position = CFrame.new(6138, 10, 3939),
      Quest = {"FountainQuest", CFrame.new(5258, 39, 4052)}
    },
    
    -- Bosses Sea 2
    ["Don Swan"] = {
      RaidBoss = true,
      Position = CFrame.new(2289, 15, 808)
    },
    ["Cursed Captain"] = {
      RaidBoss = true,
      Position = CFrame.new(912, 186, 33591)
    },
    ["Darkbeard"] = {
      RaidBoss = true,
      Position = CFrame.new(3695, 13, -3599)
    },
    ["Diamond"] = {
      IsBoss = true,
      Level = 750,
      Position = CFrame.new(-1569, 199, -31),
      Quest = {"Area1Quest", CFrame.new(-427, 73, 1835)}
    },
    ["Jeremy"] = {
      IsBoss = true,
      Level = 850,
      Position = CFrame.new(2316, 449, 787),
      Quest = {"Area2Quest", CFrame.new(635, 73, 919)}
    },
    ["Fajita"] = {
      IsBoss = true,
      Level = 925,
      Position = CFrame.new(-2086, 73, -4208),
      Quest = {"MarineQuest3", CFrame.new(-2441, 73, -3219)}
    },
    ["Smoke Admiral"] = {
      IsBoss = true,
      Level = 1150,
      Position = CFrame.new(-5078, 24, -5352),
      Quest = {"IceSideQuest", CFrame.new(-6061, 16, -4904)}
    },
    ["Awakened Ice Admiral"] = {
      IsBoss = true,
      Level = 1400,
      Position = CFrame.new(6473, 297, -6944),
      Quest = {"FrostQuest", CFrame.new(5668, 28, -6484)}
    },
    ["Tide Keeper"] = {
      IsBoss = true,
      Level = 1475,
      Position = CFrame.new(-3711, 77, -11469),
      Quest = {"ForgottenQuest", CFrame.new(-3056, 240, -10145)}
    },
    
    -- Bosses Sea 3
    ["Cake Prince"] = {
      RaidBoss = true,
      Position = CFrame.new(-2103, 70, -12165)
    },
    ["Dough King"] = {
      RaidBoss = true,
      Position = CFrame.new(-2103, 70, -12165)
    },
    ["rip_indra True Form"] = {
      RaidBoss = true,
      Position = CFrame.new(-5333, 424, -2673)
    },
    ["Stone"] = {
      IsBoss = true,
      Level = 1550,
      Position = CFrame.new(-1049, 40, 6791),
      Quest = {"PiratePortQuest", CFrame.new(-449, 109, 5950)}
    },
    ["Island Empress"] = {
      IsBoss = true,
      Level = 1675,
      Position = CFrame.new(5730, 602, 199),
      Quest = {"AmazonQuest2", CFrame.new(5448, 602, 748)}
    },
    ["Kilo Admiral"] = {
      IsBoss = true,
      Level = 1750,
      Position = CFrame.new(2904, 509, -7349),
      Quest = {"MarineTreeIsland", CFrame.new(2485, 74, -6788)}
    },
    ["Captain Elephant"] = {
      IsBoss = true,
      Level = 1875,
      Position = CFrame.new(-13393, 319, -8423),
      Quest = {"DeepForestIsland", CFrame.new(-13233, 332, -7626)}
    },
    ["Beautiful Pirate"] = {
      IsBoss = true,
      Level = 1950,
      Position = CFrame.new(5370, 22, -89),
      Quest = {"DeepForestIsland2", CFrame.new(-12682, 391, -9901)}
    },
    ["Cake Queen"] = {
      IsBoss = true,
      Level = 2175,
      Position = CFrame.new(-710, 382, -11150),
      Quest = {"IceCreamIslandQuest", CFrame.new(-818, 66, -10964)}
    },
    ["Longma"] = {
      NoQuest = true,
      Position = CFrame.new(-10218, 333, -9444)
    }
  }
  Module.Shop = {
    {"Frags", {{"Race Reroll", {"BlackbeardReward", "Reroll", "2"}}, {"Reset Stats", {"BlackbeardReward", "Refund", "2"}}}},
    {"Fighting Style", {
      {"Buy Black Leg", {"BuyBlackLeg"}},
      {"Buy Electro", {"BuyElectro"}},
      {"Buy Fishman Karate", {"BuyFishmanKarate"}},
      {"Buy Dragon Claw", {"BlackbeardReward", "DragonClaw", "2"}},
      {"Buy Superhuman", {"BuySuperhuman"}},
      {"Buy Death Step", {"BuyDeathStep"}},
      {"Buy Sharkman Karate", {"BuySharkmanKarate"}},
      {"Buy Electric Claw", {"BuyElectricClaw"}},
      {"Buy Dragon Talon", {"BuyDragonTalon"}},
      {"Buy GodHuman", {"BuyGodhuman"}},
      {"Buy Sanguine Art", {"BuySanguineArt"}}
      -- {"Buy Divine Art", {"BuyDivineArt"}}
    }},
    {"Ability Teacher", {
      {"Buy Geppo", {"BuyHaki", "Geppo"}},
      {"Buy Buso", {"BuyHaki", "Buso"}},
      {"Buy Soru", {"BuyHaki", "Soru"}},
      {"Buy Ken", {"KenTalk", "Buy"}}
    }},
    {"Sword", {
      {"Buy Katana", {"BuyItem", "Katana"}},
      {"Buy Cutlass", {"BuyItem", "Cutlass"}},
      {"Buy Dual Katana", {"BuyItem", "Dual Katana"}},
      {"Buy Iron Mace", {"BuyItem", "Iron Mace"}},
      {"Buy Triple Katana", {"BuyItem", "Triple Katana"}},
      {"Buy Pipe", {"BuyItem", "Pipe"}},
      {"Buy Dual-Headed Blade", {"BuyItem", "Dual-Headed Blade"}},
      {"Buy Soul Cane", {"BuyItem", "Soul Cane"}},
      {"Buy Bisento", {"BuyItem", "Bisento"}}
    }},
    {"Gun", {
      {"Buy Musket", {"BuyItem", "Musket"}},
      {"Buy Slingshot", {"BuyItem", "Slingshot"}},
      {"Buy Flintlock", {"BuyItem", "Flintlock"}},
      {"Buy Refined Slingshot", {"BuyItem", "Refined Slingshot"}},
      {"Buy Refined Flintlock", {"BuyItem", "Refined Flintlock"}},
      {"Buy Cannon", {"BuyItem", "Cannon"}},
      {"Buy Kabucha", {"BlackbeardReward", "Slingshot", "2"}}
    }},
    {"Accessories", {
      {"Buy Black Cape", {"BuyItem", "Black Cape"}},
      {"Buy Swordsman Hat", {"BuyItem", "Swordsman Hat"}},
      {"Buy Tomoe Ring", {"BuyItem", "Tomoe Ring"}}
    }},
    {"Race", {{"Ghoul Race", {"Ectoplasm", "Change", 4}}, {"Cyborg Race", {"CyborgTrainer", "Buy"}}}}
  }
