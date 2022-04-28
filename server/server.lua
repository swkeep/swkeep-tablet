local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("keeptablet", function(source, item)
     if type(item.info) == "table" and item.info.hash ~= nil then
          TriggerClientEvent('swkeep-tablet:Client:isPlayingAnimation', source)
     else
          TriggerClientEvent('QBCore:Notify', source, "Initialing your tablet!")
          InitTablet(source, item)
     end
end)

local function perpareDataByApp(source, player, appName)
     if appName == 'expansiontrunk' then

     end
end

QBCore.Functions.CreateCallback('swkeep-tablet:server:SendDataToTablet', function(source, cb, appName)
     local player = QBCore.Functions.GetPlayer(source)
     if player ~= nil then
          cb(perpareDataByApp(source, player, appName))
     else
          cb(nil)
     end
end)

QBCore.Functions.CreateCallback('swkeep-tablet:server:updateReq', function(source, cb, data)
     local player = QBCore.Functions.GetPlayer(source)
     if player ~= nil then
          print(data.content.metaData.writeEvent)
          TriggerClientEvent(data.content.metaData.writeEvent, data.content.selected)
          cb(true)
     else
          cb(false)
     end
end)
