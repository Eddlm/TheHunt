---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/laundry_cart002.mdl'}
ITEMPLACES = {}
combinespawnzones = {Vector(-246.809677, 759.882324, -13.563249), Vector(-245.898346, -129.154297, -13.522655), Vector(1182.907959, 1604.983643, -13.526541), Vector(1191.453735, -680.178589, -13.540991)}
zonescovered = {Vector(76.484367, 464.292389, 1.360629), Vector(-837.322998, 358.329071, 1.401560), Vector(1283.918213, -427.566895, 1.401538), Vector(1278.446411, 1445.418701, 1.357061), Vector(1727.490601, 1156.442383, 1.396262), Vector(1760.996460, 416.067291, 1.401537)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-973.185974, -464.456055, 25.069212),Angle(-0.000, -0.000, -0.000))
SpawnItem('info_player_start', Vector(1198.400146, 970.032166, 10.005116),Angle(0.009, -90.003, 0.001))
SpawnItem('info_player_start', Vector(1185.447876, -317.476807, 7.376830),Angle(0.013, 90.000, 0.000))
SpawnItem('info_player_start', Vector(-388.260498, -169.145676, 21.458551),Angle(0.064, 44.057, 0.011))
SpawnProp(Vector(-16.431782, 335.930237, 22.548944),Angle(-0.016, 0.018, 0.032),'models/props_wasteland/laundry_cart002.mdl')
SpawnProp(Vector(-20.372549, 639.972290, 22.547468),Angle(-0.029, 179.994, -0.162),'models/props_wasteland/laundry_cart002.mdl')
SpawnProp(Vector(-1072.920044, 145.328110, 22.447744),Angle(-0.011, 0.072, 0.004),'models/props_wasteland/laundry_cart002.mdl')
SpawnProp(Vector(1872.068359, 963.581848, 22.641047),Angle(0.101, 89.953, -0.032),'models/props_wasteland/laundry_cart002.mdl')
SpawnProp(Vector(500.364899, 288.000854, 22.519556),Angle(0.000, -0.040, -0.268),'models/props_wasteland/laundry_cart002.mdl')
SpawnProp(Vector(-1135.949463, 580.490784, 22.685709),Angle(-0.004, 90.005, 0.007),'models/props_wasteland/laundry_cart002.mdl')
end
---------------------- END OF CONFIGURATION FILE ----------------------
