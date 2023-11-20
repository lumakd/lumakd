--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to MyScript   (Alpha 1.0.0) ~  Much Love, Lumakd 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v170,v171)local v172={};for v190=1, #v170 do
v6(v172,v0(v4(v1(v2(v170,v190,v190 + 1 )),v1(v2(v171,1 + ((v190-1)% #v171) ,1 + ((v190-1)% #v171) + 1 )))%256 ));end return v5(v172);end 
loadedkey=loadstring(Game:HttpGet("https://raw.githubusercontent.com/lumakd/lumakd/main/Script.lua"))();
--Notfication-Sound  
local notification = Instance.new("Sound")
notification.Parent = game:GetService("SoundService")
notification.SoundId = "rbxassetid://9086208751"
notification.Volume = 10

game.StarterGui:SetCore("SendNotification", {
      Icon = "http://www.roblox.com/asset/?id=12523036534";
      Title = "God of Speed Hub", 
      Text = "Loaded Complete";
})
wait(2)
game.StarterGui:SetCore("SendNotification", {
      Icon = "http://www.roblox.com/asset/?id=12523036534";
      Title = "God of Speed Hub", 
      Text = "Loaded..Complete";
notification:Play()
})
loadstring(Game:HttpGetAsync("https://raw.githubusercontent.com/lumakd/lumakd/main/main/hackbloxfruit/ByBo.lua"))()
