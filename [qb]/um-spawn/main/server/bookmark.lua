if not um.main.bookmark.status then return end

lib.callback.register('um-spawn:server:bookmark:getMoney', function(source)
  local Player = GetPlayer(source)
  if not Player then return end
  return Player.Functions.GetMoney('bank')
end)

RegisterNetEvent('um-spawn:server:bookmark:addBookmark', function(input, money, location)
  local src = source
  local Player = GetPlayer(src)
  if not Player then return end

  if money then
    Player.Functions.RemoveMoney("bank", money)
  end

  MySQL.insert.await('INSERT INTO `spawnbookmarks` (citizenid, name, image, location) VALUES (?, ?, ?, ?)',
    { GetCitizenID(Player),
      input[1],
      input[2],
      json.encode(location)
    })
end)



lib.callback.register('getBookmarks', function(source)
  local citizenid = GetCitizenID(GetPlayer(source))

  local status, result = pcall(function()
    return MySQL.query.await('SELECT * FROM spawnbookmarks WHERE citizenid = ?', { citizenid })
  end)

  if not status then
    warn [[
          Bookmarks: spawnbookmarks sql not found follow doc or bookmarks set false
          https://docs.uyuyorumstore.com/scripts/um-spawn
      ]]
    return false
  end

  local found = result[1] ~= nil
  Debug(found and 'Bookmarks: Found Bookmarks' or 'Bookmarks: Not Found')

  return found and result or false
end)

lib.callback.register('um-spawn:server:bookmark:deleteBookmark', function(source, name)
  local citizenid = GetCitizenID(GetPlayer(source))

  local checkBookMark = MySQL.single.await('SELECT citizenid FROM spawnbookmarks WHERE name = ? ', { name })
  if not checkBookMark then return end

  if citizenid ~= checkBookMark.citizenid then return end

  MySQL.single.await('DELETE FROM spawnbookmarks WHERE name = ?', { name })

  return true
end)
