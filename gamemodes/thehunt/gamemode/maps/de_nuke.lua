include( "basewaves.lua" )
CombineFirstWave = 5
CombineSecondWave = 10
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 15
CombineInfiniteWave = 20

MAP_PROPS = {}

zonescovered ={
Vector(-2585.168701, -1036.526855, -420.094849),
Vector(446.151031, -1924.767700, -415.968750),
Vector(1583.727295, -2261.634521, -639.968750),
Vector(653.716797, -972.778015, -767.968750),
Vector(1450.428101, -1063.441772, -415.968750),
Vector(669.351135, -604.925537, -415.968750),

}


ITEMPLACES ={
Vector(585.375610, -1061.801880, -367.132690),
Vector(631.185669, -2083.537109, -368.132690),
Vector(224.364853, -2071.452393, -368.132690),
Vector(-1170.761841, -1216.552002, -379.491852),
Vector(611.429810, 808.012024, -432.132690),
Vector(1072.267090, -368.370605, -613.968750),
}



combinespawnzones = {
Vector(3467.756836, -663.210571, -351.968750),
Vector(-2710.524902, -588.545837, -416.264465),

}


 
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this community.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )

end


function MapSetup()

for k, v in pairs(ents.FindByClass("func_door_rotating")) do
print(v:GetClass())
v:SetKeyValue( "spawnflags", "32" )
v:Fire("Open","",0)
end

table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)

SpawnItem("info_player_start", Vector(219.644882, -298.626495, -171.968750),Angle(0.000, -136.934, 0.000))
SpawnItem("info_player_start", Vector(1263.402222, -457.320526, -103.968750),Angle(0.000, 137.867, 0.000))
SpawnItem("info_player_start", Vector(554.686218, 861.167542, -479.968750),Angle(0.000, -30.776, 0.000))


end
