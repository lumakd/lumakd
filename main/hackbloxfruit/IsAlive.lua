function Module.IsAlive(Char: Model?): boolean
  if not Char then
    return nil
  end
  
  if CachedChars[Char] then
    return CachedChars[Char].Health > 0
  end
  
  local Hum = Char:FindFirstChildOfClass("Humanoid")
  CachedChars[Char] = Hum
  return Hum and Hum.Health > 0
end

function Module.FireRemote(...): any
  return CommF:InvokeServer(...)
end

function Module.IsFruit(Part: BasePart): Instance?
  return (Part.Name == "Fruit " or Part:GetAttribute("OriginalName")) and Part:FindFirstChild("Handle")
end

function Module.IsBoss(Name: string): boolean
  return Module.Bosses[Name] and true
end
