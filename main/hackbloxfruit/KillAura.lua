  function Module.KillAura(Distance: number?, Name: string?): (nil)
    Distance = Distance or 500
    
    for _, Enemy in ipairs(Enemies:GetChildren()) do
      local PrimaryPart = Enemy.PrimaryPart
      
      if (not Name or Enemy.Name == Name) and PrimaryPart and not Enemy:HasTag(KILLAURA_TAG) then
        if Module.IsAlive(Enemy) and Player:DistanceFromCharacter(PrimaryPart.Position) < Distance then
          Enemy:AddTag(KILLAURA_TAG)
        end
      end
    end
  end
