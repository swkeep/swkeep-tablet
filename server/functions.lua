local QBCore = exports['qb-core']:GetCoreObject()

local function updatePlayerItemData(Player, slot, data)
     if Player.PlayerData.items[slot] then
          Player.PlayerData.items[slot].info = data
     end
     Player.Functions.SetInventory(Player.PlayerData.items, true)
end

local function genHash()
     return tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) ..
          QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
end

function InitTablet(source, item)
     local info = {}
     local Player = QBCore.Functions.GetPlayer(source)
     info.hash = genHash()
     info.owner = Player.PlayerData.charinfo
     info.username = 'iNiTiAlUsErNaMe'
     info.password = 'PaSs'
     info.installedApps = { 'appstore' }
     updatePlayerItemData(Player, item.slot, info)
end
