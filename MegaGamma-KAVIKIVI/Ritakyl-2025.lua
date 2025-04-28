local function sendAlert(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = 5; -- how long it shows
    })
end

local gameScripts = {
    [94590879393563] = function()
        sendAlert("Auto Executor", "Script Loaded")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua", true))()
    end,
    [10449761463] = function()
        sendAlert("Auto Executor", "Script Loaded")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"))()
    end,
  [18668065416] = function()
        sendAlert("Auto Executor", "Script Loaded")
        loadstring(game:HttpGet("https://rawscripts.net/raw/KING-Blue-Lock:-Rivals-XZuyaX-HUB-34466"))()
    end,
  [13772394625] = function()
        sendAlert("Auto Executor", "Script Loaded")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JosiahScripts/Cryzix-BB/refs/heads/main/obfuscated%20(4).txt"))()
    end,
  [78041891124723] = function()
        sendAlert("Auto Executor", "Script Loaded")
        loadstring(game:HttpGet("https://sk1d.org/file?free=e103f4af"))()
    end,
  [126884695634066] = function()
        sendAlert("Auto Executor", "Script Loaded")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ameicaa1/Grow-a-Garden/main/Grow_A_Garden.lua"))()
  end,
local function autoExecute()
    local id = game.PlaceId
    if gameScripts[id] then
        gameScripts[id]()
    else
        sendAlert("Auto Executor", "No script yet")
    end
end

if game:IsLoaded() then
    autoExecute()
else
    game.Loaded:Connect(autoExecute)
end
end,
