function noSit(): (nil)
  local Char = Player.Character
  if Module.IsAlive(Char) and Char.Humanoid.Sit then
    Char.Humanoid.Sit = false
  end
end
