---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {}
ITEMPLACES = {Vector(396.512146, 1950.164307, -119.499016), Vector(109.430428, 325.506866, 15.348111), Vector(-25.761917, 784.904602, 24.501535), Vector(-27.137449, 675.265930, 46.076286), Vector(263.413605, 799.012573, 11.910871), Vector(166.719543, 518.670837, 23.421139), Vector(1394.802368, 614.814819, -106.040825), Vector(1370.774170, 758.864380, -108.031891), Vector(812.497742, 897.736206, -116.500786), Vector(516.682495, 1244.687622, -93.759773), Vector(560.064514, 952.088318, -117.723335), Vector(451.730255, 292.836945, -115.806183)}
combinespawnzones = {Vector(179.662582, -2482.746094, -161.440826), Vector(196.710770, -2400.624268, -161.210785)}
zonescovered = {Vector(944.477783, -2483.726318, -202.196945), Vector(482.861023, -174.177887, -171.045349), Vector(1092.991577, 1059.919678, -157.435989), Vector(392.687378, 1222.066040, -15.598463), Vector(317.097656, 954.494385, -15.598463), Vector(-46.008762, 516.983887, -15.598463), Vector(972.127991, 553.745361, -151.598465), Vector(296.712646, 873.190979, -151.598465), Vector(398.126343, 492.975220, -151.630920), Vector(381.838562, 520.926086, -15.598462), Vector(1081.358398, 471.859955, -23.598452), Vector(9.669944, 1527.071045, -174.470123)}

function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(651.842651, 1668.311401, -276.389313),Angle(-0.000, 135.000, -0.000))
SpawnItem('info_player_start', Vector(1208.876587, 389.397369, -122.508636),Angle(-0.000, 90.000, 0.000))
SpawnItem('info_player_start', Vector(50.600418, 1026.379517, -130.557266),Angle(-0.000, -90.000, 0.000))
SpawnItem('info_player_start', Vector(1049.249512, -911.450195, -287.742432),Angle(-0.000, 135.000, -0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------
