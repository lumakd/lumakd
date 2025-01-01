function Module.TravelTo(Sea: number?): (nil)
  if SeaList[Sea] then
    Module.FireRemote(SeaList[Sea])
  end
end

function Module.newCachedEnemy(Name, Enemy)
  CachedEnemies[Name] = Enemy
end

function Module.Rejoin(): (nil)
  task.spawn(TeleportService.TeleportToPlaceInstance, TeleportService, game.PlaceId, game.JobId, Player)
end
