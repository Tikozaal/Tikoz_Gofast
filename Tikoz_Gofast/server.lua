ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


RegisterNetEvent("Tikozaal")
AddEventHandler("Tikozaal", function()

    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    local moula = math.random(2000, 2500)

    xPlayer.addAccountMoney('black_money', moula)

    TriggerClientEvent('esx:showAdvancedNotification', _src, "Client", "Go Fast", "Bon boulot ! Tiens, ~r~"..moula.."$~w~ et attend je te ramène une ~b~voiture~w~ pour rentrer", "CHAR_LESTER_DEATHWISH")

end)

RegisterNetEvent("TikozaalCamion")
AddEventHandler("TikozaalCamion", function()

    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    local moulaga = math.random(7500, 10000)

    xPlayer.addAccountMoney('black_money', moulaga)

    TriggerClientEvent('esx:showAdvancedNotification', _src, "Client", "Go Fast", "Bon boulot ! Tiens, ~r~"..moulaga.."$~w~ et je te ramène une ~b~voiture ~w~pour rentrer", "CHAR_LESTER_DEATHWISH")


end)

RegisterNetEvent("TikozAlertPopo")
AddEventHandler("TikozAlertPopo", function(car)

	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Centrale LSPD", nil, "~b~"..car.."~s~ immatriculé ~y~EX15AR ~w~est partie du ~b~port~w~ pour faire un ~r~Go Fast~w~ !", "CHAR_CALL911", 8)

        end
	end
end)

RegisterNetEvent("TikozAlertCamtar")
AddEventHandler("TikozAlertCamtar", function(car)

	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Centrale LSPD", nil, "~b~"..car.."~s~ immatriculé ~b~AX87DV ~w~ est partie du ~y~port~w~ pour faire un ~r~Go Fast ~w~!", "CHAR_CALL911", 8)

        end
	end
end)