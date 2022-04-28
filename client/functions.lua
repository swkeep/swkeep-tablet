function loadAnimation(name)
     RequestAnimDict(name)
     while not HasAnimDictLoaded(name) do
          Citizen.Wait(50)
     end
end

function loadModel(model)
     RequestModel(model)
     while not HasModelLoaded(model) do
          Citizen.Wait(50)
     end
end
