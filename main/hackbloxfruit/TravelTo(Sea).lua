function Module.TravelTo(Sea: number?): (nil)
  if SeaList[Sea] then
    Module.FireRemote(SeaList[Sea])
  end
end
