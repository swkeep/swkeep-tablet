local QBCore = exports['qb-core']:GetCoreObject()

APPS = {
     data = {}
}

-- ============
-- NUICallbacks
-- ============

RegisterNUICallback('callbackDispatcher', function(data, cb)
     local req = data['type']
     if req == 'closeTablet' then
          cb(CloseTablet())
     elseif req == 'openApp' then
          -- exports sould be triggerd by exports inside metadata
          local Data = exports['qb-expandableVehicleTrunk']:PrepareVehicleData()
          if Data.error ~= nil then
               cb(Data.error)
          end
          QBCore.Functions.TriggerCallback(data.content.metaData.readEvent, function(result)
               cb(result)
          end, Data)
     elseif req == 'installApp' then
          QBCore.Functions.TriggerCallback('swkeep-tablet:server:installApp', function(result)
               cb(result)
          end, data.content)
     elseif req == 'list' then
          QBCore.Functions.TriggerCallback('swkeep-tablet:server:getInstalledApps', function(result)
               if data.content['type'] == 'installationList' then
                    cb(makeInstallationList(APPS:read(), result))
               else
                    cb(result)
               end
          end, {
               type = data.content['type'],
               APPS = APPS:read()
          })
     elseif req == 'update' then
          QBCore.Functions.TriggerCallback(data.content.metaData.writeEvent, function(result)
               cb(result)
          end, data.content)
     end
end)

-- ============
--    Events
-- ============

RegisterNetEvent('swkeep-tablet:Client:isPlayingAnimation', function()
     if IsPedActiveInScenario(PlayerPedId()) == false then
          if Tablet == true then
               QBCore.Functions.Notify("You are already using tablet!", "error")
               return
          end
          OpenTablet()
     else
          QBCore.Functions.Notify("You are doing something!", "error")
     end
end)

-- after player load or rerouce fetch apps list from Config file
AddEventHandler('onResourceStart', function(resourceName)
     if resourceName == 'swkeep-tablet' then
          for key, app in pairs(Config.Apps) do
               APPS:add(app)
          end
     end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
     for key, app in pairs(Config.Apps) do
          APPS:add(app)
     end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
     APPS.data = {}
end)
