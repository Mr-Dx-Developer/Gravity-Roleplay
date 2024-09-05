local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = exports
L1_1 = Config
L1_1 = L1_1.CoreObject
L0_1 = L0_1[L1_1]
L1_1 = L0_1
L0_1 = L0_1.GetCoreObject
L0_1 = L0_1(L1_1)
L1_1 = {}
L2_1 = CreateThread
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = Wait
  L1_2 = 500
  L0_2(L1_2)
  L0_2 = json
  L0_2 = L0_2.decode
  L1_2 = LoadResourceFile
  L2_2 = GetCurrentResourceName
  L2_2 = L2_2()
  L3_2 = "./DataBase.json"
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L1_2(L2_2, L3_2)
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  if not L0_2 then
    return
  end
  L1_2 = pairs
  L2_2 = L0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L1_1
    L8_2 = {}
    L9_2 = L6_2.Plate
    L8_2.Plate = L9_2
    L9_2 = L6_2.IP
    L8_2.IP = L9_2
    L9_2 = L6_2.Pass
    L8_2.Pass = L9_2
    L7_2[L5_2] = L8_2
  end
end
L2_1(L3_1)
L2_1 = L0_1.Functions
L2_1 = L2_1.CreateUseableItem
L3_1 = "vehicle_gps"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2
  L3_2 = TriggerClientEvent
  L4_2 = Config
  L4_2 = L4_2.TriggerName
  L5_2 = "vehiclegps:client:UseGpsInTheCar"
  L4_2 = L4_2 .. L5_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
end
L2_1(L3_1, L4_1)
L2_1 = L0_1.Functions
L2_1 = L2_1.CreateUseableItem
L3_1 = "vehicle_tablet"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2
  L3_2 = TriggerClientEvent
  L4_2 = Config
  L4_2 = L4_2.TriggerName
  L5_2 = "vehiclegps:client:OpenGPSMenu"
  L4_2 = L4_2 .. L5_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
end
L2_1(L3_1, L4_1)
L2_1 = L0_1.Functions
L2_1 = L2_1.CreateCallback
L3_1 = Config
L3_1 = L3_1.TriggerName
L4_1 = "vehiclegps:server:GetCarsGPSs"
L3_1 = L3_1 .. L4_1
function L4_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = L1_1
  L2_2(L3_2)
end
L2_1(L3_1, L4_1)
L2_1 = L0_1.Functions
L2_1 = L2_1.CreateCallback
L3_1 = Config
L3_1 = L3_1.TriggerName
L4_1 = "vehiclegps:server:GetGPSInIP"
L3_1 = L3_1 .. L4_1
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L4_2 = A2_2.IP
  L3_2 = L1_1
  L3_2 = L3_2[L4_2]
  if L3_2 then
    L4_2 = A2_2.IP
    L3_2 = L1_1
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.Pass
    L4_2 = A2_2.Pass
    if L3_2 == L4_2 then
      L3_2 = A1_2
      L5_2 = A2_2.IP
      L4_2 = L1_1
      L4_2 = L4_2[L5_2]
      L3_2(L4_2)
    end
  end
  L3_2 = A1_2
  L4_2 = false
  L3_2(L4_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = Config
L3_1 = L3_1.TriggerName
L4_1 = "vehiclegps:server:AddGpsToCarData"
L3_1 = L3_1 .. L4_1
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = L1_1
  L4_2 = {}
  L4_2.Plate = A0_2
  L4_2.IP = A1_2
  L4_2.Pass = A2_2
  L3_2[A1_2] = L4_2
  L3_2 = SaveResourceFile
  L4_2 = GetCurrentResourceName
  L4_2 = L4_2()
  L5_2 = "./DataBase.json"
  L6_2 = json
  L6_2 = L6_2.encode
  L7_2 = L1_1
  L6_2 = L6_2(L7_2)
  L7_2 = -1
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = Config
L3_1 = L3_1.TriggerName
L4_1 = "vehiclegps:server:RemoveGPS"
L3_1 = L3_1 .. L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L1_1
  L1_2[A0_2] = nil
  L1_2 = TriggerClientEvent
  L2_2 = Config
  L2_2 = L2_2.TriggerName
  L3_2 = "vehiclegps:client:SuncGPSData"
  L2_2 = L2_2 .. L3_2
  L3_2 = -1
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SaveResourceFile
  L2_2 = GetCurrentResourceName
  L2_2 = L2_2()
  L3_2 = "./DataBase.json"
  L4_2 = json
  L4_2 = L4_2.encode
  L5_2 = L1_1
  L4_2 = L4_2(L5_2)
  L5_2 = -1
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
L2_1(L3_1, L4_1)
