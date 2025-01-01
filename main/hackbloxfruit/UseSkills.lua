  function Module.UseSkills(Target: BasePart, Skills: table?): (nil)
    if Player:DistanceFromCharacter(Target.Position) >= 120 then
      return nil
    end
    
    Module.Hooking:SetTarget(Target)
    
    for Skill, Enabled in Skills do
      if Enabled then
        VirtualInputManager:SendKeyEvent(true, Skill, false, game)
        VirtualInputManager:SendKeyEvent(false, Skill, false, game)
      end
    end
  end
