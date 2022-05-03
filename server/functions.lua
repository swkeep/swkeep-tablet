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

local function findTablet(Player)
     if Player == nil or Player.PlayerData == nil then
          return nil
     end
     for key, item in pairs(Player.PlayerData.items) do
          if item.name == 'keeptablet' then
               return item
          end
     end
end

local function isInstalled(info, appname)
     for key, appName in pairs(info.installedApps) do
          if appName == appname then
               return true, key
          end
     end
     return false
end

function KeepStore_installApp(source, appname)
     local Player = QBCore.Functions.GetPlayer(source)
     local item_tablet = findTablet(Player)
     if item_tablet == nil then
          return
     end
     local installed, index = isInstalled(item_tablet.info, appname)
     if installed == false then
          local apps = item_tablet.info.installedApps
          apps[#apps + 1] = appname
          updatePlayerItemData(Player, item_tablet.slot, item_tablet.info)
          return 'installed'
     else
          item_tablet.info.installedApps[index] = nil
          updatePlayerItemData(Player, item_tablet.slot, item_tablet.info)
          return 'uninstalled'
     end
end

function GetInstalledApps(source, APPS)
     local Player = QBCore.Functions.GetPlayer(source)
     local item_tablet = findTablet(Player)
     if item_tablet == nil then
          return
     end
     local tmpAPPS = {}
     for key, name in pairs(item_tablet.info.installedApps) do
          for key, app in pairs(APPS) do
               if app.name == name then
                    table.insert(tmpAPPS, app)
               end
          end
     end
     return tmpAPPS
end

function getInstalledApps(source)
     local Player = QBCore.Functions.GetPlayer(source)
     local item_tablet = findTablet(Player)
     if item_tablet == nil then
          return
     end
     return item_tablet.info.installedApps
end
