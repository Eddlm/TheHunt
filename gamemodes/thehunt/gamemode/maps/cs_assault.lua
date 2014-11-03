include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 10
CombineFourthWave = 10
CombineFifthWave = 10
CombineInfiniteWave = 20

MAP_PROPS = {"models/props_wasteland/controlroom_desk001b.mdl",}

zonescovered ={
Vector(6711.908691, 6389.544434, -807.968750),
Vector(6774.946777, 4681.596191, -799.968750),
Vector(4853.219238, 5192.043945, -799.968750),
Vector(5412.466309, 6470.889648, -807.968750),
Vector(6657.416016, 4100.000977, -543.968750),
Vector(5358.638672, 4490.430664, -799.968750),
Vector(6193.425781, 3940.544678, -671.968750),
Vector(6371.918945, 4838.593262, -671.968750),
}

ITEMPLACES ={
Vector(5753.837402, 5885.221191, -817.607666),
}

combinespawnzones = {
Vector(4970.268066, 6607.682617, -799.968750),
Vector(4922.156738, 6199.459473, -799.968750),
Vector(4923.857910, 6382.733887, -807.968750),
Vector(6742.739258, 7169.044922, -853.973999),
}

function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this community.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )

end


function MapSetup()
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)

--SpawnItem("monster_apc", Vector(-512.362732, -1917.421143, -175.968750)+Vector(0,0,0), Angle(0,0,0))

SpawnItem("info_player_start", Vector(5761.899902, 4434.595215, -290.690186)+Vector(0,0,-45), Angle(0,90,0))
SpawnItem("info_player_start", Vector(5335.029297, 7118.291504, -927.968750)+Vector(0,0,-45), Angle(0,-90,0))

SpawnItem("item_healthcharger", Vector(6060.739258, 4953.161133, -683.724548), Angle(0,-90,0))
SpawnItem("item_healthcharger", Vector(5360.222656, 7147.968750, -939.390137), Angle(0,-90,0))


/*
SpawnItem("info_player_start", Vector(-159.968750, 1913.448975, -95.968750)+Vector(0,0,-45), Angle(0,0,0))

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



