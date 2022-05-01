local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("keeptablet", function(source, item)
     if type(item.info) == "table" and item.info.hash ~= nil then
          TriggerClientEvent('swkeep-tablet:Client:isPlayingAnimation', source)
     else
          TriggerClientEvent('QBCore:Notify', source, "Initialing your tablet!")
          InitTablet(source, item)
     end
end)

QBCore.Functions.CreateCallback('swkeep-tablet:server:installApp', function(source, cb, req)
     local res = KeepStore_installApp(source, req.appname)
     cb(res)
end)

QBCore.Functions.CreateCallback('swkeep-tablet:server:getInstalledApps', function(source, cb, req)
     if req['type'] == 'installationList' then
          cb(getInstalledApps(source))
     elseif req['type'] == 'installedList' then
          cb(GetInstalledApps(source, req.APPS))
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
