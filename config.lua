Config = {}

Config.Apps = {
     [1] = {
          name = "expansiontrunk",
          icon = "carrep.png",
          lable = "Expansion trunk",
          to = "expansion",
          resourceName = 'qb-expandableVehicleTrunk',
          readEvent = 'qb-expandableVehicleTrunk:server:getDataFromNearbyVehicle',
          writeEvent = 'qb-expandableVehicleTrunk:server:updateRequestedData',
     }
}
