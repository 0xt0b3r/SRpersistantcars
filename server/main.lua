

RegisterServerEvent('persist:car')
AddEventHandler('persist:car', function(newcar)
TriggerClientEvent('persist:carsync', -1,newcar)
end)



