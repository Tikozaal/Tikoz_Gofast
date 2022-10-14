ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local menugo = {
    Base = { Header = {"commomenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 205, 255}, Title = "Go Fast"},
    Data = { currentMenu = "Quel vehicule ?", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, result)
            
            if btn.name == "Voiture" then
                voiturefast()
                CloseMenu()
            elseif btn.name == "Camion" then
                camionfast()
                CloseMenu()
            end
        end,
},
    Menu = {
        ["Quel vehicule ?"] = {
            b = {
                {name = "Voiture", ask = ">", askX = true},
                {name = "Camion", ask = ">", askX = true},
            }
        }
    }
}

Citizen.CreateThread(function()
    
    local pnj = "a_m_m_bevhills_01"
    local pnjHash = GetHashKey(pnj)
    
    RequestModel(pnjHash)

    while not HasModelLoaded(pnjHash) do Citizen.Wait(0) end

    createpnj = CreatePed(6, pnjHash, Config.Pos.Ped, false, false)  


    while true do 

        local tikoz = Config.Pos.Menu
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local dist = #(pos - tikoz)

        if dist <= 2 then

            ESX.ShowHelpNotification('Appuie sur ~INPUT_CONTEXT~ pour ouvrir le ~b~menu')

            DrawMarker(6, Config.Pos.Menu, nil, nil, nil, -90, nil, nil, 0.7, 0.7, 0.7, 0, 251, 255, 200, false, true, 2, false, false, false, false)

            if IsControlJustPressed(1, 51) then
                CreateMenu(menugo)
            end
        else
            Citizen.Wait(1000)
        end
        Citizen.Wait(0)
    end
end)

function voiturefast()
    
    Citizen.CreateThread(function()

    Citizen.Wait(500)

    RequestAnimDict("cellphone@str_female")

    while not HasAnimDictLoaded("cellphone@str_female") do 
        Citizen.Wait(0) 
    end
    SetBlockingOfNonTemporaryEvents(createpnj, true)
    TaskPlayAnim(createpnj, "cellphone@str_female", "cellphone_call_listen_yes_b", 8.0, 3.0, 5000, 0, 1, false, false, false)

    ESX.ShowNotification("Je cherche une ~r~transac~w~ pour toi, attend un peu ")

    Citizen.Wait(7000) 

    ESX.ShowNotification("La voiture arrive, te fais pas ~r~chopper~w~ !")

    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    local car = ListeVoiture[math.random(1, #ListeVoiture)]
    local carHash = GetHashKey(car)

    RequestModel(carHash)
    while not HasModelLoaded(carHash) do Citizen.Wait(0) end

    local createcar = CreateVehicle(carHash, Config.Pos.Car, true, false)
    SetVehRadioStation(createcar, "OFF")
    SetVehicleNumberPlateText(createcar, "EX15AR")
    SetVehicleFuelLevel(createcar, 100.0)


    local pilot = 'a_m_m_bevhills_01'
    local piloth = GetHashKey(pilot)

    RequestModel(piloth)

    while not HasModelLoaded(piloth) do Citizen.Wait(0) end

    local creapilot = CreatePed(6, piloth, Config.Pos.Ped.x, Config.Pos.Ped.y, Config.Pos.Ped.z, 270.01, true, false)
        
    SetPedIntoVehicle(creapilot, createcar, -1)
        
    TaskVehicleDriveToCoord(creapilot, createcar, Config.Pos.Menu.x, Config.Pos.Menu.y, Config.Pos.Menu.z, 40.0, 0, GetEntityModel(carHash), 411, 10.0)

    Citizen.Wait(12000)
    
    TaskWanderStandard(creapilot, 10.0, 10)        

    local pnj2 = "a_m_m_bevhills_01"
    local pnjHash2 = GetHashKey(pnj2)

    RequestModel(pnjHash2)

    while not HasModelLoaded(pnjHash2) do Citizen.Wait(0) end

    local createpnj2 = CreatePed(6, pnjHash2, Config.Pos.Ped2, true, false)

    local blip = AddBlipForEntity(createpnj2)
    SetBlipSprite (blip, 1)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.75)
    SetBlipColour (blip, 1)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Transaction ~r~GOFAST")
    EndTextCommandSetBlipName(blip)

    SetNewWaypoint(Config.Pos.Ped2)

    TriggerServerEvent("TikozAlertPopo", car) 

    ESX.ShowNotification("Va sur le point que je t'ai mis sur le ~b~GPS~w~, te fais pas ~r~chopper !")


        while true do 
            
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local inter = 200
            local dist2 = GetDistanceBetweenCoords(pos, Config.Pos.Ped2, true)

            local carretour = ListeRetour[math.random(1, #ListeRetour)]
            local retourHash = GetHashKey(carretour)

            RequestModel(carretour)

            while not HasModelLoaded(carretour) do Citizen.Wait(0) end

    
                if dist2 <= 2 then            

                    inter = 0

                    AddTextEntry("Laazokit", "Appuie sur ~INPUT_CONTEXT~ pour rendre le ~b~véhicule")
                    DisplayHelpTextThisFrame("Laazokit", false)
    
                    if IsControlJustPressed(1, 51) then

                        Citizen.Wait(2000)

                        RequestAnimDict("mp_common")

                        while not HasAnimDictLoaded("mp_common") do 
                            Citizen.Wait(0) 
                        end
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        TaskPlayAnim(ped, "mp_common", "givetake1_a", 8.0, 3.0, 2000, 0, 1, false, false, false)

                        RequestAnimDict("mp_common")
                        while not HasAnimDictLoaded("mp_common") do 
                            Citizen.Wait(0) 
                        end
                        SetBlockingOfNonTemporaryEvents(createpnj2, true)
                        TaskPlayAnim(createpnj2, "mp_common", "givetake1_a", 8.0, 3.0, 2000, 0, 1, false, false, false)

                        RemoveBlip(blip)

                        TriggerServerEvent("Tikozaal")

                        Citizen.Wait(2000)

                        TaskEnterVehicle(createpnj2, createcar, -1, 1, 2.0001, 1)

                        TaskVehicleDriveToCoord(createpnj2, createcar, Config.Pos.Drivecoord.x, Config.Pos.Drivecoord.y, Config.Pos.Drivecoord.z, 8.0, 0, GetEntityModel(carHash), 411, 10.0)

                        Citizen.Wait(19000)

                        DeleteVehicle(createcar)

                        local pi = ListeRetour[math.random(1, #ListeRetour)]
                        local po = GetHashKey(pi)
                        RequestModel(po)
                        while not HasModelLoaded(po) do Citizen.Wait(0) end
                        local pipo = CreateVehicle(po, Config.Pos.Retour, true, false)

                        SetVehRadioStation(pipo, "OFF")
                        SetVehicleNumberPlateText(pipo, "EX15AR")
                        SetVehicleFuelLevel(pipo, 100.0)

                        SetPedIntoVehicle(createpnj2, pipo, -1)

                        TaskVehicleDriveToCoord(createpnj2, pipo, Config.Pos.Drivecoord2.x, Config.Pos.Drivecoord2.y, Config.Pos.Drivecoord2.z, 8.0, 0, GetEntityModel(carHash), 411, 10.0)
                        Citizen.Wait(19000)

                        TaskWanderStandard(createpnj2, 10.0, 10)

                        return   
                        
                    end
               
                else
                    inter = 1000
    
                end
                Citizen.Wait(inter)
        end
    end)

    Citizen.Wait(1800000) -- 1800000 = 30 minutes, c'est le temps a attendre pour refaire un gofast 

end


function camionfast()

    Citizen.CreateThread(function()

        Citizen.Wait(500)
    
        RequestAnimDict("cellphone@str_female")
    
        while not HasAnimDictLoaded("cellphone@str_female") do 
            Citizen.Wait(0) 
        end
        SetBlockingOfNonTemporaryEvents(createpnj, true)
        TaskPlayAnim(createpnj, "cellphone@str_female", "cellphone_call_listen_yes_b", 8.0, 3.0, 5000, 0, 1, false, false, false)
    
        ESX.ShowNotification("Je cherche une ~r~transac~w~ pour toi, attend un peu ")
    
        Citizen.Wait(7000) 
    
        ESX.ShowNotification("Le camion arrive, te fais pas ~r~chopper~w~ !")
    
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
    
        local car = ListeCamion[math.random(1, #ListeCamion)]
        local carHash = GetHashKey(car)
    
        RequestModel(carHash)
    
        while not HasModelLoaded(carHash) do Citizen.Wait(0) end
    
        local createcar = CreateVehicle(carHash, Config.Pos.Car, true, false)
        SetVehRadioStation(createcar, "OFF")
        SetVehicleNumberPlateText(createcar, "EX15AR")
        SetVehicleFuelLevel(createcar, 100.0)
        SetVehicleNumberPlateText(createcar, " AX87DV ")
     
        local pilot = 'a_m_m_bevhills_01'
        local piloth = GetHashKey(pilot)
    
        RequestModel(piloth)
    
        while not HasModelLoaded(piloth) do Citizen.Wait(0) end
    
        local creapilot = CreatePed(6, piloth, Config.Pos.Ped.x, Config.Pos.Ped.y, Config.Pos.Ped.z, 270.01, true, false)
            
        SetPedIntoVehicle(creapilot, createcar, -1)
            
        TaskVehicleDriveToCoord(creapilot, createcar, Config.Pos.Menu.x, Config.Pos.Menu.y, Config.Pos.Menu.z, 40.0, 0, GetEntityModel(carHash), 411, 10.0)
    
        Citizen.Wait(12000)
        
        TaskWanderStandard(creapilot, 10.0, 10)        
    
        local pnj2 = "a_m_m_bevhills_01"
        local pnjHash2 = GetHashKey(pnj2)
    
        RequestModel(pnjHash2)
    
        while not HasModelLoaded(pnjHash2) do Citizen.Wait(0) end
    
        local createpnj2 = CreatePed(6, pnjHash2, Config.Pos.Ped2, true, false)
    
        local blip = AddBlipForEntity(createpnj2)
        SetBlipSprite (blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.75)
        SetBlipColour (blip, 1)
        SetBlipAsShortRange(blip, true)
    
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Transaction ~r~GOFAST")
        EndTextCommandSetBlipName(blip)
    
        SetNewWaypoint(Config.Pos.Ped2)
    
        TriggerServerEvent("TikozAlertCamtar", car) 
    
        ESX.ShowNotification("Va sur le point que je t'ai mis sur le ~b~GPS~w~, te fais pas ~r~chopper !")
    
    
            while true do 
                
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local inter = 200
                local dist2 = GetDistanceBetweenCoords(pos, Config.Pos.Ped2, true)
    
                local carretour = ListeRetour[math.random(1, #ListeRetour)]
                local retourHash = GetHashKey(carretour)
    
                RequestModel(carretour)
    
                while not HasModelLoaded(carretour) do Citizen.Wait(0) end
    
        
                    if dist2 <= 2 then            
    
                        inter = 0
    
                        AddTextEntry("Laazokit", "Appuie sur ~INPUT_CONTEXT~ pour rendre le ~b~véhicule")
                        DisplayHelpTextThisFrame("Laazokit", false)
        
                        if IsControlJustPressed(1, 51) then
    
                            Citizen.Wait(2000)
    
                            RequestAnimDict("mp_common")
    
                            while not HasAnimDictLoaded("mp_common") do 
                                Citizen.Wait(0) 
                            end
                            SetBlockingOfNonTemporaryEvents(ped, true)
                            TaskPlayAnim(ped, "mp_common", "givetake1_a", 8.0, 3.0, 2000, 0, 1, false, false, false)
    
                            RequestAnimDict("mp_common")
                            while not HasAnimDictLoaded("mp_common") do 
                                Citizen.Wait(0) 
                            end
                            SetBlockingOfNonTemporaryEvents(createpnj2, true)
                            TaskPlayAnim(createpnj2, "mp_common", "givetake1_a", 8.0, 3.0, 2000, 0, 1, false, false, false)
    
                            RemoveBlip(blip)
    
                            TriggerServerEvent("TikozaalCamion")
    
                            Citizen.Wait(2000)
    
                            TaskEnterVehicle(createpnj2, createcar, -1, 1, 2.0001, 1)

                            TaskVehicleDriveToCoord(createpnj2, createcar, Config.Pos.Drivecoord.x, Config.Pos.Drivecoord.y, Config.Pos.Drivecoord.z, 8.0, 0, GetEntityModel(carHash), 411, 10.0)
    
                            Citizen.Wait(19000)
    
                            DeleteVehicle(createcar)
    
                            local pi = ListeRetour[math.random(1, #ListeRetour)]
                            local po = GetHashKey(pi)
                            RequestModel(po)
                            while not HasModelLoaded(po) do Citizen.Wait(0) end
                            local pipo = CreateVehicle(po, Config.Pos.Retour, true, false)

                            SetVehRadioStation(pipo, "OFF")
                            SetVehicleNumberPlateText(pipo, "EX15AR")
                            SetVehicleFuelLevel(pipo, 100.0)

                            SetPedIntoVehicle(createpnj2, pipo, -1)
    
                            TaskVehicleDriveToCoord(createpnj2, pipo, Config.Pos.Drivecoord2.x, Config.Pos.Drivecoord2.y, Config.Pos.Drivecoord2.z, 8.0, 0, GetEntityModel(carHash), 411, 10.0)
    
                            Citizen.Wait(19000)
    
                            TaskWanderStandard(createpnj2, 10.0, 10)
    
                            return   
                            
                        end
                   
        
                    else
                        inter = 1000
        
                    end
                Citizen.Wait(inter)
            end
        end)
        Citizen.Wait(1800000) -- 1800000 = 30 minutes, c'est le temps a attendre pour refaire un gofast 

end


