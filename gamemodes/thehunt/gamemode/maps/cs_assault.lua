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

end



