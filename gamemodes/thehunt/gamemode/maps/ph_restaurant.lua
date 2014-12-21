include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 10
CombineFourthWave = 10
CombineFifthWave = 10
CombineInfiniteWave = 20

--MAP_PROPS = {"models/props_c17/furnituredrawer001a.mdl","models/props_c17/furnituretable002a.mdl","models/props_c17/furnituretable001a.mdl",}



zonescovered ={
Vector(298.583801,338.311798,-191.968750),
Vector(-266.821136,-229.892105,-191.968750),
Vector(-947.075684,257.880737,64.031250),
Vector(-905.245605,-315.251465,64.031250),
Vector(-317.484131,-367.529480,200.031250),
Vector(-166.420029,-48.639591,200.031250),
Vector(209.612045,-358.290680,64.031250),
}


ITEMPLACES = {
Vector(184.675598, 485.308502, -226.064621), Vector(343.494354, 486.017365, -223.999954), Vector(472.546021, 463.372650, -223.431458), Vector(471.617889, 334.502960, -225.018585), Vector(471.102325, 205.616699, -225.429657), Vector(-95.294945, -91.524567, -221.845825), Vector(-379.451904, -151.932144, -220.575287), Vector(-308.760071, -114.846420, 31.507385), Vector(237.900818, 93.301712, 36.809666), Vector(129.514847, -49.337147, 37.710938), Vector(791.594116, -120.960571, 37.543671), Vector(-231.138992, 313.227112, 38.126877), Vector(-787.777771, 272.829071, 38.960045), Vector(-882.193176, -368.837708, 33.828762), Vector(-307.669739, 496.212158, 181.486771), Vector(-402.517242, 366.343750, 172.392334), Vector(-278.030243, 353.350006, 173.673431), Vector(-127.066406, 350.462158, 173.595825), Vector(100.027122, 345.333527, 173.652435), Vector(337.664063, 296.753937, 172.428452), Vector(-330.440063, -103.681953, 164.082642), Vector(74.329590, -297.416534, 173.705063), Vector(84.305374, -420.845337, 173.710846), Vector(-53.651505, -421.904358, 173.653976), Vector(284.315521, -404.748199, 173.669312), Vector(396.683441, -414.970154, 173.709045), Vector(428.676849, -288.801636, 180.208069)}

combinespawnzones = {
Vector(682.451538, -495.872162, 64.031250),
Vector(629.986938, 373.857941, 64.031250)
}

function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this restaurant.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function() ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )
end


function MapSetup()
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)
for k, v in pairs(ents.GetAll()) do
if v:IsWeapon() then
print(v:GetClass())
v:Remove()
end
if v:GetClass() == "func_door" then
v:Fire("Open","",0)
timer.Simple(2, function() v:Remove() end)
end
end
SpawnItem("info_player_start", Vector(-858.757385, 74.877869, 64.031250)+Vector(0,0,-45), Angle(0,90,0))
SpawnItem("info_player_start", Vector(-861.378052, -211.458603, 64.031250)+Vector(0,0,-45), Angle(0,-90,0))

end



