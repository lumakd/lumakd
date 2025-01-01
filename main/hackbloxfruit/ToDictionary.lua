function ToDictionary(Array: table): table
  local Dictionary = {}
  for _, String in ipairs(Array) do
    Dictionary[String] = true
  end
  table.clear(Array)
  return Dictionary
end
