function GetToolMastery(Name: string): number?
    local Cached = CachedTools[Name]
    
    if Cached and Cached.Parent then
      return Cached:GetAttribute("Level")
    end
    
    local Tool = GetToolByName(Name)
    return Tool and Tool:GetAttribute("Level")
  end
