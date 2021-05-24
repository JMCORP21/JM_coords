ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("coordenadas", function(source, args)
    TriggerServerEvent('coordenadas', table.concat(args, " "))

        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
            title = "Nombre de las Coordenadas"
        }, function(data3, menu3)
            menu3.close()

            --Citizen.Trace(data3.value)

            local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))

            TriggerServerEvent("webh", GetPlayerName(PlayerId()) ,data3.value, FormatCoord(playerX), FormatCoord(playerY), FormatCoord(playerZ))
            --data3.value es el nombre
        end, function(data3, menu3)
            menu3.close()
        end)

FormatCoord = function(coord)
    if coord == nil then
        return "unknown"
    end
        
    return tonumber(string.format("%.2f", coord))
end

end)