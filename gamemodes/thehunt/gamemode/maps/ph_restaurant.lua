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

ITEMPLACES ={
Vector(-254.058014, 350.980408, 175.410522),
Vector(-298.745850,-104.011002,163.875427),
Vector(353.118225,412.407104,172.779633),
Vector(-176.661179,172.119980,-206.377579),
Vector(-330.029572,-316.833923,-215.286850),
Vector(91.266136,-446.787415,179.640961),
Vector(-789.479309, 268.841309, 98.031250)

}

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
/*
SpawnItem("info_player_start", Vector(-159.968750, 1913.448975, -95.968750)+Vector(0,0,-45), Angle(0,0,0))

SpawnItem("monster_apc", Vector(-512.362732, -1917.421143, -175.968750)+Vector(0,0,0), Angle(0,0,0))

SpawnTurret(Vector(-491.003052, -1442.955566, -239.262634),Angle(0.397, 167.418, 0.522))
SpawnTurret(Vector(556.156494, 2330.056641, 128.705292),Angle(0.331, 22.378, 0.497))
SpawnTurret(Vector(-709.125061, 169.305756, 8.702634),Angle(0.201, 51.508, 0.738))
SpawnProp(Vector(490.964935, 2385.634766, 0.909191),Angle(0,0,0),"models/props_junk/sawblade001a.mdl")
SpawnProp(Vector(490.964935, 2385.634766, 2.909191),Angle(0,0,0),"models/props_junk/sawblade001a.mdl")
SpawnProp(Vector(490.964935, 2385.634766, 4.909191),Angle(0,0,0),"models/props_junk/sawblade001a.mdl")


SpawnProp(Vector(941.523132, 184.121384, -131.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")
SpawnProp(Vector(941.523132, 184.121384, -101.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")
SpawnProp(Vector(941.523132, 184.121384, 21.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")
SpawnProp(Vector(941.523132, 184.121384, 51.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")

SpawnProp(Vector(941.523132, 184.121384, 51.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")
SpawnProp(Vector(941.523132, 184.121384, 51.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")
SpawnProp(Vector(941.523132, 184.121384, 51.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")
SpawnProp(Vector(941.523132, 184.121384, 51.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")


SpawnProp(Vector(983.913452, -794.092651, -151.607880),Angle(0,0,0),"models/props_c17/oildrum001_explosive.mdl")
SpawnProp(Vector(1008.994324, -780.184509, -151.532333),Angle(0,0,0),"models/props_c17/oildrum001_explosive.mdl")
SpawnProp(Vector(1062.439209, -714.620239, -151.612885),Angle(0,0,0),"models/props_c17/oildrum001_explosive.mdl")
SpawnProp(Vector(1042.702026, -686.063293, -151.616333),Angle(0,0,0),"models/props_c17/oildrum001_explosive.mdl")
SpawnProp(Vector(1057.852783, -654.657043, -151.643707),Angle(0,0,0),"models/props_c17/oildrum001_explosive.mdl")
*/
end



