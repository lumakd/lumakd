  function Module.IsSpawned(Enemy)
    local Cached = Module.SpawnLocations[Enemy]
    
    if Cached and Cached.Parent then
      return Cached:GetAttribute("Active") or Module:GetEnemyByTag(Enemy)
    end
    
    return Module:GetEnemyByTag(Enemy)
  end
  
  function Module.GunClick()
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1);task.wait(0.05)
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1);task.wait(0.05)
  end
  
