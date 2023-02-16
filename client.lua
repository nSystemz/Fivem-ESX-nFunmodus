--
--	#     #
--	##    #  ######  #    #  ######   ####   #    #   ####
--	# #   #  #       ##  ##  #       #       #    #  #
--	#  #  #  #####   # ## #  #####    ####   #    #   ####
--	#   # #  #       #    #  #            #  #    #       #
--	#    ##  #       #    #  #       #    #  #    #  #    #
--	#     #  ######  #    #  ######   ####    ####    ####
--
-- Created by Nemesus for ESX Framework
-- Website: https://nemesus.de
-- Youtube: https://youtube.nemesus.de

-- Console / Delete if you want

print("^0======================================================================^7")
print("^0ESX_nFunmdodus loaded:")
print("^0[^4Author^0] ^7:^0 ^0Nemesus | Version 1.0.0^7")
print("^0[^2Website^0] ^7:^0 ^5https://nemesus.de^7")
print("^0[^2Youtube^0] ^7:^0 ^5https://youtube.nemesus.de^7")
print("^0======================================================================^7")

-- ONLY EDIT IF YOU KNOW WHAT YOU ARE DOING!

-- Locales
xSound = exports.xsound
local PlayerData = {}
local funmodusOn = false

-- ESX Stuff
Citizen.CreateThread(function()
	ESX.PlayerData = ESX.GetPlayerData()
end)

-- Register Net Events
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent("esx_nfunmodus:toggleFunmodus")
AddEventHandler("esx_nfunmodus:toggleFunmodus", function(source, args)
	ESX.TriggerServerCallback("esx_nfunmodus:getGroup", function(playerRank)
    	if playerRank ~= "user" then
        	if not funmodusOn then
            	funmodusOn = true
                ESX.ShowNotification("~g~Funmodus an!")
			else
				funmodusOn = false
                ESX.ShowNotification("~r~Funmodus aus!")
			end		
		else
        	ESX.ShowNotification("~r~Keine Berechtigung!")
        end
	end)
end)

-- Keys
Citizen.CreateThread(function()
	while true do
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) and funmodusOn then
			local getVehicle = GetVehiclePedIsUsing(GetPlayerPed(-1))
			if IsControlJustReleased(0, 36) then
				local velo = GetEntityVelocity(getVehicle)
				SetEntityVelocity(getVehicle, velo.x+0.1, velo.y+0.1, velo.z+7.5)
			end
			if IsControlJustReleased(0, 19) then
				local velo = GetEntityVelocity(getVehicle)
				SetEntityVelocity(getVehicle, velo.x*2.25, velo.y*2.25, velo.z)
			end
		end
		Citizen.Wait(1)
	end
end)