function GetToolByName(Name: string): Tool?
    local Cached = CachedTools[Name]
    
    if Cached and Cached.Parent then
      return Cached
    end
    
    local Character = Player.Character
    local Backpack = Player.Backpack
    
    if Character then
      local Tool = Character:FindFirstChild(Name) or Backpack:FindFirstChild(Name)
      if Tool then
        CachedTools[Name] = Tool
        return Tool
      end
    end
  end
