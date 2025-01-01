  function EnableBuso()
    local Char = Player.Character
    if Settings.AutoBuso and Module.IsAlive(Char) and not Char:FindFirstChild("HasBuso") then
      Module.FireRemote("Buso")
    end
  end
