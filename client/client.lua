local QBCore = exports['qb-core']:GetCoreObject()
local tablet = false

local APPS = {
     data = {}
}

function APPS:add(options)
     if APPS:isAlreadyThere(options) == false then
          self.data[#self.data + 1] = {
               name = options.name,
               icon = options.icon,
               lable = options.lable,
               to = options.to,
               resourceName = options.resourceName,
               readEvent = options.readEvent,
               writeEvent = options.writeEvent
          }
     end
end

function APPS:isAlreadyThere(options)
     for key, value in pairs(self.data) do
          if value.name == options.name then
               return true
          end
     end
     return false
end

function APPS:read()
     return self.data
end

RegisterNUICallback('openApp', function(data, cb)
     if data['type'] == 'openApp' then
          -- if we need client side event we call them here
          local Data = exports['qb-expandableVehicleTrunk']:PrepareVehicleData()
          if Data.error ~= nil then
               cb(Data.error)
          end
          QBCore.Functions.TriggerCallback(data.content.metaData.readEvent, function(result)
               if result ~= nil then
                    cb(result)
               else
                    print("Result from server is nil !!!")
               end
          end, Data)
     end
end)

RegisterNUICallback('upgradeReq', function(data, cb)
     QBCore.Functions.TriggerCallback(data.content.metaData.writeEvent, function(result)
          if result ~= false then
               cb(result)
          else
               cb(false)
          end
     end, data.content)
end)

RegisterNUICallback('getAppList', function(data, cb)
     -- get list of apps from config and other programs
     cb(APPS:read())
end)

AddEventHandler('swkeep-tablet:Client:OpenUI', function()
     ToggleTablet(not tablet)
     SendNUIMessage({
          action = "open",
     })
     SetNuiFocus(true, true)
end)

RegisterNUICallback('closeMenu', function()
     Wait(50)
     SetNuiFocus(false, false)
     ToggleTablet(not tablet)
end)

RegisterNetEvent('swkeep-tablet:Client:isPlayingAnimation', function()
     if IsPedActiveInScenario(PlayerPedId()) == false then
          if tablet == true then
               QBCore.Functions.Notify("You are already using tablet!", "error")
               return
          end
          TriggerEvent("swkeep-tablet:Client:OpenUI")
     else
          QBCore.Functions.Notify("You are doing something!", "error")
     end
end)

function ToggleTablet(toggle)
     local tabletDict = "amb@code_human_in_bus_passenger_idles@female@tablet@base"
     local tabletAnim = "base"
     local tabletProp = "prop_cs_tablet"
     local tabletBone = 60309
     local tabletOffset = vector3(0.03, 0.002, -0.0)
     local tabletRot = vector3(10.0, 160.0, 0.0)
     local playerPed = PlayerPedId()

     if toggle and not tablet then
          tablet = true
          Citizen.CreateThread(function()
               loadAnimation(tabletDict)
               loadModel(tabletProp)
               local tabletObj = CreateObject(tabletProp, 0.0, 0.0, 0.0, true, true, false)
               local tabletBoneIndex = GetPedBoneIndex(playerPed, tabletBone)
               SetCurrentPedWeapon(playerPed, "weapon_unarmed", true)
               AttachEntityToEntity(tabletObj, playerPed, tabletBoneIndex, tabletOffset.x, tabletOffset.y, tabletOffset.z, tabletRot.x, tabletRot.y, tabletRot.z, true, false, false, false, 2, true)
               SetModelAsNoLongerNeeded(tabletProp)
               while tablet do
                    Citizen.Wait(100)
                    if not IsEntityPlayingAnim(playerPed, tabletDict, tabletAnim, 3) then
                         TaskPlayAnim(playerPed, tabletDict, tabletAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                    end
               end
               ClearPedSecondaryTask(playerPed)
               Citizen.Wait(450)
               DetachEntity(tabletObj, true, false)
               DeleteEntity(tabletObj)
          end)
     elseif not toggle and tablet then
          tablet = false
     end
end

local function AddAppToList(app)
     if type(app) == 'table' then
          APPS:add(app)
     end
end

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

exports("AddAppToList", AddAppToList)

-- RegisterNetEvent('qb-menu:client:openMenu', function(data)
--      openMenu(data)
--  end)
--  exports('openMenu', openMenu)
