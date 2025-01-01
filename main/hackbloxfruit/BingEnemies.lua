 function Module:BringEnemies(ToEnemy: Instance, SuperBring: boolean?): (nil)
    if not self.IsAlive(ToEnemy) or not ToEnemy.PrimaryPart then
      return nil
    end
    
    pcall(sethiddenproperty, Player, "SimulationRadius", math.huge)
    
    if Settings.BringMobs then
      local Name = ToEnemy.Name
      local Position = (Player.Character or Player.CharacterAdded:Wait()):GetPivot().Position
      local Target = ToEnemy.PrimaryPart.CFrame
      
      if not CachedBring[Name] or (Target.Position - CachedBring[Name].Position).Magnitude > 5 then
        CachedBring[Name] = Target
      end
      
      for _, Enemy in ipairs(SuperBring and Enemies:GetChildren() or self.allMobs[Name]) do
        if Enemy:HasTag(BRING_TAG) then continue end
        
        local PrimaryPart = Enemy.PrimaryPart
        if self.IsAlive(Enemy) and PrimaryPart then
          if (Position - PrimaryPart.Position).Magnitude < Settings.BringDistance then
            PrimaryPart.Size = HitBoxSize
            PrimaryPart.CanCollide = false
            Enemy.Humanoid.WalkSpeed = 0
            Enemy.Humanoid.JumpPower = 0
            Enemy:AddTag(BRING_TAG)
          end
        end
      end
    else
      if not CachedBring[ToEnemy] then
        CachedBring[ToEnemy] = ToEnemy.PrimaryPart.CFrame
      end
      
      ToEnemy.PrimaryPart.CFrame = CachedBring[ToEnemy]
    end
  end
