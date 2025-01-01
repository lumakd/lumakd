  function VerifyToolTip(Type: string): Instance?
    local Cached = CachedTools["Tip_" .. Type]
    
    if Cached and Cached.Parent then
      return Cached
    end
    
    for _, Tool in Player.Backpack:GetChildren() do
      if Tool:IsA("Tool") and Tool.ToolTip == Type then
        CachedTools["Tip_" .. Type] = Tool
        return Tool
      end
    end
    
    if not Module.IsAlive(Player.Character) then
      return nil
    end
    
    for _, Tool in Player.Character:GetChildren() do
      if Tool:IsA("Tool") and Tool.ToolTip == Type then
        CachedTools["Tip_" .. Type] = Tool
        return Tool
      end
    end
    
    return nil
  end
