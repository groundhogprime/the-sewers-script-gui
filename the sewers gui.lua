local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🔥 Exploit gui 🔥",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "exploit gui",
   LoadingSubtitle = "by Thiagoglitcher",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "The Sewers"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Title",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Shop", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Buy")

local FarmTab = Window:CreateTab("Grab", nil) -- Title, Image
local FarmSection = FarmTab:CreateSection("Buy")


Rayfield:Notify({
   Title = "Executed",
   Content = "Very good gui",
   Duration = 3,
   Image = nil,
})

local Button = MainTab:CreateButton({
   Name = "Buy AssaultRifle",
   Callback = function()
local args = {
    [1] = "AssaultRifle"
}

game:GetService("ReplicatedStorage"):WaitForChild("shared/network@GlobalEvents"):WaitForChild("buyItem"):FireServer(unpack(args))

   end,
})

local Button = MainTab:CreateButton({
   Name = "Buy Railgun",
   Callback = function()
local args = {
    [1] = "Railgun"
}

game:GetService("ReplicatedStorage"):WaitForChild("shared/network@GlobalEvents"):WaitForChild("buyItem"):FireServer(unpack(args))

   end,
})

local Button = MainTab:CreateButton({
   Name = "Buy KingRatPotion",
   Callback = function()
local args = {
    [1] = "KingRatPotion"
}

game:GetService("ReplicatedStorage"):WaitForChild("shared/network@GlobalEvents"):WaitForChild("buyItem"):FireServer(unpack(args))

   end,
})

local Button = MainTab:CreateButton({
   Name = "Buy TeslaCoil",
   Callback = function()
local args = {
    [1] = "TeslaCoilTurret"
}

game:GetService("ReplicatedStorage"):WaitForChild("shared/network@GlobalEvents"):WaitForChild("buyItem"):FireServer(unpack(args))

   end,
})

local Button = FarmTab:CreateButton({
   Name = "Grab All",
   Callback = function()
local validBottleCollectors = {}
local validTreeStages = {}
local validMushroomBlocks = {}

-- Find the DynamicFurniture folder in workspace
local dynamicFurniture = workspace:WaitForChild("DynamicFurniture")

-- Function to process events for each valid object type
local function processEvent(eventName, validObjects, printPrefix)
    if #validObjects > 0 then
        -- Get the GlobalEvents in ReplicatedStorage
        local globalEvents = game:GetService("ReplicatedStorage"):WaitForChild("shared/network@GlobalEvents")
        
        -- Wait for the specific event (depending on the object type)
        local event = globalEvents:WaitForChild(eventName)

        -- Loop through each valid object and fire the event
        for _, object in ipairs(validObjects) do
            local args = { object }
            event:FireServer(unpack(args))
            print(printPrefix .. ": " .. object.Name)
        end
    else
        warn("No valid " .. printPrefix .. " found in DynamicFurniture")
    end
end

-- Loop through all models in DynamicFurniture and categorize them
for _, obj in ipairs(dynamicFurniture:GetChildren()) do
    if obj:IsA("Model") then
        if obj.Name == "BottleCollector3" then
            table.insert(validBottleCollectors, obj)
        elseif obj.Name == "TreeStage1" then
            table.insert(validTreeStages, obj)
        elseif obj.Name == "MushroomBlock" then
            table.insert(validMushroomBlocks, obj)
        end
    end
end
    processEvent("collectBottleCollector", validBottleCollectors, "Collected BottleCollector")
    processEvent("harvestTree", validTreeStages, "Harvested TreeStage")
    processEvent("harvestTree", validMushroomBlocks, "Harvested MushroomBlock")

   end,
})

Rayfield:LoadConfiguration()
