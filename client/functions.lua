Tablet = false

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

local function AddAppToList(app)
     if type(app) == 'table' then
          APPS:add(app)
     end
end

exports("AddAppToList", AddAppToList)


function makeInstallationList(apps, installedList)
     local tmp = {}
     for key, app in pairs(apps) do
          local isInstalled = doesExist(installedList, app.name)
          table.insert(tmp, {
               lable = app.lable,
               name = app.name,
               icon = app.icon,
               instaled = isInstalled,
               installing = false,
          })
     end
     return tmp
end

local function loadModel(model)
     RequestModel(model)
     while not HasModelLoaded(model) do
          Citizen.Wait(50)
     end
end

local function loadAnimation(name)
     RequestAnimDict(name)
     while not HasAnimDictLoaded(name) do
          Citizen.Wait(50)
     end
end

local function ToggleTablet(toggle)
     local tabletDict = "amb@code_human_in_bus_passenger_idles@female@Tablet@base"
     local tabletAnim = "base"
     local tabletProp = "prop_cs_tablet"
     local tabletBone = 60309
     local tabletOffset = vector3(0.03, 0.002, -0.0)
     local tabletRot = vector3(10.0, 160.0, 0.0)
     local playerPed = PlayerPedId()

     if toggle and not Tablet then
          Tablet = true
          Citizen.CreateThread(function()
               loadAnimation(tabletDict)
               loadModel(tabletProp)
               local tabletObj = CreateObject(tabletProp, 0.0, 0.0, 0.0, true, true, false)
               local tabletBoneIndex = GetPedBoneIndex(playerPed, tabletBone)
               SetCurrentPedWeapon(playerPed, "weapon_unarmed", true)
               AttachEntityToEntity(tabletObj, playerPed, tabletBoneIndex, tabletOffset.x, tabletOffset.y, tabletOffset.z, tabletRot.x, tabletRot.y, tabletRot.z, true, false, false, false, 2, true)
               SetModelAsNoLongerNeeded(tabletProp)
               while Tablet do
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
     elseif not toggle and Tablet then
          Tablet = false
     end
end

function OpenTablet()
     ToggleTablet(not Tablet)
     SendNUIMessage({
          action = "open",
     })
     SetNuiFocus(true, true)
     return true
end

function CloseTablet()
     SetNuiFocus(false, false)
     ToggleTablet(not Tablet)
     return (true)
end

-- Return the first index with the given value (or nil if not found).
function doesExist(array, value)
     for i, v in ipairs(array) do
          if v == value then
               return true
          end
     end
     return false
end
