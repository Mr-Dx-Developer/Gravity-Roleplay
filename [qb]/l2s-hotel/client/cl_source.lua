CreateThread(function()
    -- Service Room Hotel [Target]
    exports[Shared.Exports.target]:AddBoxZone("hotelservice", vector3(-1202.36, -203.91, 39.32), 0.6, 0.6, {
        name = "hotelservice",
        heading=335,
        minZ=36.27,
        maxZ=40.27
     }, {
        options = {
            {
                type = 'client',
                event = 'l2s-hotel:client:HotelServices1',
                icon = 'fas fa-hotel',
                label = 'Book Your Room!',
            },
            {
              type = 'client',
              event = 'l2s-hotel:client:CIA',
              icon = 'fas fa-search',
              job = 'police',
              label = 'Can I Help You?', -- FOR CIA
          },
        },
        distance = 2.5
    })

    exports[Shared.Exports.target]:AddBoxZone("hotelservice2", vector3(-1198.79, -197.47, 39.32), 0.6, 0.6, {
        name = "hotelservice2",
        heading=335,
        minZ=36.27,
        maxZ=40.27
     }, {
        options = {
            {
                type = 'client',
                event = 'l2s-hotel:client:HotelServices3',
                icon = 'fas fa-hotel',
                label = 'Take Your Items',
            },
        },
        distance = 2.5
    })
    exports[Shared.Exports.target]:AddBoxZone("hotelservice3", vector3(-1205.14, -209.28, 39.32), 0.6, 0.6, {
        name = "hotelservice3",
        heading=335,
        minZ=36.27,
        maxZ=40.27
     }, {
        options = {
            {
                type = 'client',
                event = 'l2s-hotel:client:HotelServices2',
                icon = 'fas fa-hotel',
                label = 'Manage Your Room',
            },
        },
        distance = 2.5
    })
    Wait(1000)
    -- Blips
    local blip = AddBlipForCoord(-1206.3458251953, -182.05914306641, 39.324886322021)
    SetBlipSprite(blip, 475)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 28)  
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Crastenburg Hotel")
    EndTextCommandSetBlipName(blip)
    -- Peds
    -- Recipton
    CreateNPC(4,"cs_paper","anim@amb@nightclub@peds@","rcmme_amanda1_stand_loop_cop",{x = -1202.2108154297, y = -203.98715209961, z = 38.324687957764, h = 64.29077911377}, "") -- هوتيل 
    CreateNPC(4,"a_f_y_femaleagent","timetable@ron@ig_3_couch","base",{x = -1202.9478759766, y = -205.56213378906, z = 38.352362060547, h = 58.035205841064}, "") -- هوتيل 
    CreateNPC(4,"cs_debra","timetable@ron@ig_3_couch","base",{x = -1198.8432617188, y = -197.62666320801, z = 38.352362060547, h = 67.579666137695}, "") -- هوتيل 
    CreateNPC(4,"csb_groom","timetable@ron@ig_3_couch","base",{x = -1205.0397949219, y = -209.25144958496, z = 38.352362060547, h = 63.580261230469}, "") -- هوتيل 
    -- Gurds
    CreateNPC(4,"s_m_m_highsec_02","amb@code_human_police_investigate@idle_a","idle_b",{x = -1213.5106201172, y = -203.49906921387, z = 38.352362060547, h = 148.40492248535}, "") -- هوتيل 
    CreateNPC(4,"s_m_m_highsec_02","amb@code_human_police_investigate@idle_a","idle_b",{x = -1214.7108154297, y = -206.34748840332, z = 38.352362060547, h = 148.40492248535 + 180}, "") -- هوتيل 
    CreateNPC(4,"s_m_m_highsec_02","amb@code_human_police_investigate@idle_a","idle_b",{x = -1209.2351074219, y = -195.3793182373, z = 38.324924468994, h = 332.34036254883}, "") -- هوتيل 
    CreateNPC(4,"s_m_m_highsec_02","amb@code_human_police_investigate@idle_a","idle_b",{x = -1207.76171875, y = -192.37498474121, z = 38.324924468994, h = 150.32392883301}, "") -- هوتيل 
    CreateNPC(4,"s_m_m_highsec_02","anim@amb@nightclub@peds@","rcmme_amanda1_stand_loop_cop",{x = -1191.97265625, y = -189.21156311035,  z = 38.352362060547, h = 59.240814208984}, "") -- هوتيل 
    CreateNPC(4,"s_m_m_highsec_02","anim@amb@nightclub@peds@","rcmme_amanda1_stand_loop_cop",{x = -1205.6638183594, y = -212.63441467285, z = 38.324687957764, h = 146.95556640625}, "") -- هوتيل 
    CreateNPC(4,"s_m_y_valet_01","anim@amb@nightclub@peds@","rcmme_amanda1_stand_loop_cop",{x = -1193.8625488281, y = -179.3812713623, z = 38.324729919434, h = 127.00596618652}, "") -- هوتيل 
end)


function CreateNPC(type,model,anim,dict,pos,help)
  if Shared.V4Files then return end
    Citizen.CreateThread(function()
      local hash = GetHashKey(model)

      RequestModel(hash)
      while not HasModelLoaded(hash) do
        Wait(1)
      end
      if model ~= 's_m_y_valet_01' then
  
      RequestAnimDict(anim)
      while not HasAnimDictLoaded(anim) do
        Wait(1)
      end
    end
  
      local ped = CreatePed(type, hash, pos.x, pos.y, pos.z, pos.h, false, true)
      SetEntityHeading(ped, pos.h)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      if model ~= 's_m_y_valet_01' then
        TaskPlayAnim(ped,anim,dict, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
      end
      if model == 'cs_debra' then
        TaskStartScenarioInPlace(ped, 'CODE_HUMAN_CROSS_ROAD_WAIT', 0, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        
      end
    end)
end
