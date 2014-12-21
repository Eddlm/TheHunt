include( "basewaves.lua" )
CombineFirstWave = 5
CombineSecondWave = 10
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 15
CombineInfiniteWave = 20

MAP_PROPS = {'models/props/cs_militia/crate_extrasmallmill.mdl'}

zonescovered ={
Vector(1938.861328, 749.750671, -462.279480),
Vector(-360.810669, 437.983246, -464.672363),
Vector(-292.705292, -1496.332520, -162.515533),
Vector(444.383911, 183.679153, -169.826050),
Vector(-1080.817505, 723.390503, -127.968750),
Vector(2497.763916, 103.937752, -222.983459),
Vector(-2048.035645, 971.874207, -160.508652),
Vector(-2691.379395, -1118.334595, -161.341095),

}


ITEMPLACES ={
Vector(377.844910, -1630.464111, -143.852737),
Vector(419.977386, -375.137695, -164.972931),
Vector(280.066650, 367.520508, -169.000107),
Vector(56.346191, 808.016052, -133.146454),
Vector(-699.805603, 204.250778, -454.493713),
Vector(-1121.186768, 321.040283, -110.161758),
Vector(1331.791260, 358.678314, -165.496750),

}



combinespawnzones = {
Vector(2901.608154, 11.960730, -135.968750),
Vector(-378.317291, -1226.219482, -471.920654),
Vector(1920.006104, 1355.593750, -464.739441),
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

SpawnProp(Vector(-1495.459595, -1319.228760, -223.152939),Angle(-0.140, 90.105, 0.686),'models/props/cs_militia/crate_extrasmallmill.mdl')
SpawnProp(Vector(1951.016846, 966.330261, -535.507446),Angle(-2.802, -66.794, 4.451),'models/props/cs_militia/crate_extrasmallmill.mdl')
SpawnProp(Vector(-2568.130127, 424.668610, -319.095825),Angle(0.976, 173.415, -2.329),'models/props/cs_militia/crate_extrasmallmill.mdl')
SpawnProp(Vector(-1560.623169, -615.339844, -207.388168),Angle(0.034, 89.859, 0.019),'models/props/cs_militia/crate_extrasmallmill.mdl')

SpawnItem("info_player_start", Vector(1751.910889, 1370.489990, -438.614929)+Vector(0,0,-45), Angle(0,-75,0))
SpawnItem("info_player_start", Vector(108.704796, -144.031250, -433.585815)+Vector(0,0,-45), Angle(0,-90,0))
SpawnItem("info_player_start", Vector(184.024551, 608.031250, -127.968750)+Vector(0,0,-45), Angle(0,90,0))
SpawnItem("info_player_start", Vector(474.053436, -257.522552, -159.968750)+Vector(0,0,-45), Angle(0,180,0))

end



