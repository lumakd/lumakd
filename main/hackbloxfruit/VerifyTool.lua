function VerifyTool(Name: string): boolean
  local Cached = CachedTools[Name]
  
  if Cached and Cached.Parent then
    return true
  end
  
  return GetToolByName(Name)
end
