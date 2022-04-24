local isMenuOpen = false



function openM()
     SetNuiFocus(
          true--[[ boolean ]] ,
          true--[[ boolean ]]
     )
     SendNUIMessage({
          type = 'open'
     })
end

function closeM()
     SetNuiFocus(
          false--[[ boolean ]] ,
          false--[[ boolean ]]
     )
     SendNUIMessage({
          type = 'close'
     })
end

RegisterKeyMapping('+showTablet', 'show tablet', 'keyboard', 'h')

RegisterCommand('+showTablet', function()
     if isMenuOpen == false then
          openM()
          isMenuOpen = not isMenuOpen
     else
          closeM()
          isMenuOpen = not isMenuOpen
     end
     print(isMenuOpen)
     Wait(500)
end, false)
