include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 10
CombineFourthWave = 15
CombineFifthWave = 15
CombineInfiniteWave = 20
max_weapons_total = 2

MAP_PROPS = {"models/props_wasteland/cafeteria_table001a.mdl","models/props_wasteland/controlroom_desk001b.mdl",""}

zonescovered ={
Vector(-798.506409,412.756622,64.031250),
Vector(-406.839783,-25.298136,64.031250),
Vector(273.758759,513.846130,64.031250),
Vector(-654.692322,-832.471680,64.031250),
Vector(-416.044464, -97.335854, 200.031250),
}

ITEMPLACES ={
Vector(-53.166042, 570.926880, 46.406479),
}


combinespawnzones = {
Vector(-2565.783936, 348.769562, 64.031250),
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


SpawnItem("info_player_start", Vector(-1001.510376, 107.080078, 64.031250)+Vector(0,0,-45), Angle(0,-90,0))

SpawnItem("item_healthcharger", Vector(2495.968750, -278.858459, 302.537872), Angle(0,-180,0))
SpawnItem("item_healthcharger", Vector(2072.373047, 416.031250, 56.275494), Angle(0,90,0))


end



