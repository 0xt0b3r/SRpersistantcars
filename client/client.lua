
Citizen.CreateThread(function()
	while Config.entercar do
	Wait(800)	
		local playerped = GetPlayerPed(-1)
				print"carcheck1"
	if	IsPedGettingIntoAVehicle(playerped) then 
		Wait(Config.updatetime)
			if IsPedSittingInAnyVehicle(playerped) then 
				local newcar =	GetVehiclePedIsIn(playerped,false)
				VehToNet(newcar)
				carid = NetworkGetNetworkIdFromEntity(newcar)
				SetNetworkIdExistsOnAllMachines(carid, 1)
				NetworkSetNetworkIdDynamic(carid, 0)
				SetNetworkIdCanMigrate(carid, 0) 
				TriggerServerEvent('persist:car',carid)
			
			end
		end
	end
end)
Citizen.CreateThread(function()
	while Config.timedupdate do 
		Wait(Config.Checktime*1000)	
		print"carcheck"	
		local playerped = GetPlayerPed(-1)
		if IsPedSittingInAnyVehicle(playerped) then 
			local newcar =	GetVehiclePedIsIn(playerped,false)
			VehToNet(newcar)
			carid = NetworkGetNetworkIdFromEntity(newcar)
			SetNetworkIdExistsOnAllMachines(carid, 1)
			NetworkSetNetworkIdDynamic(carid, 0)
			SetNetworkIdCanMigrate(carid, 0) 			
			TriggerServerEvent('persist:car',carid)	
		end
	end
end)
RegisterNetEvent('persist:carsync')
AddEventHandler('persist:carsync', function(newcar)
car = NetworkGetEntityFromNetworkId(newcar)
			  SetEntityAsMissionEntity(car, 1, 1)
		  print"CarSyncd"
		  print(newcar)
		end)
		