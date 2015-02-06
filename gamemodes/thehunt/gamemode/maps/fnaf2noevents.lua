---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {}
ITEMPLACES = {Vector(1957.929810, 978.479980, 40.023655), Vector(1965.627686, 829.147400, 38.776268), Vector(1965.327026, 656.425964, 38.788067), Vector(1431.499512, 1079.532593, 40.027397), Vector(1432.499146, 1205.789429, 38.722767), Vector(1227.247681, 1210.257813, 40.033020), Vector(1221.016357, 1096.043701, 38.723606), Vector(1006.234619, 1086.112427, 40.031601), Vector(997.880554, 1202.880859, 38.735924), Vector(784.584351, 1210.634155, 40.037941), Vector(778.559082, 1095.025024, 38.740974), Vector(1562.991333, 756.833740, 45.130127), Vector(-302.064484, 1010.117554, 39.747494), Vector(-308.416718, 868.218323, 40.025784), Vector(256.872559, 1005.487671, 40.026138), Vector(253.267365, 842.583374, 38.765369), Vector(276.765320, 434.251587, 38.784016), Vector(270.164276, 288.917999, 38.623909), Vector(-24.321444, -229.559158, 45.126484), Vector(21.345604, -448.729462, 36.482391), Vector(-118.112846, -530.151611, 37.042702), Vector(-286.580292, 294.253326, 38.765144), Vector(-298.260437, 442.692657, 38.931152), Vector(1123.838867, 506.166077, 40.033867), Vector(1343.859985, 360.195068, 40.035362), Vector(1342.308228, 235.145462, 38.713428)}
combinespawnzones = {Vector(1964.842773, 1156.734741, 1.462262)}
zonescovered = {Vector(1284.758057, 1045.189697, 20.378440), Vector(368.772461, 1246.910645, 20.401537), Vector(-317.187653, 1246.204834, 20.401537), Vector(40.812958, 1586.366211, 20.369606), Vector(297.072388, 1462.701660, 20.401538), Vector(5.868735, 962.014587, 20.347820), Vector(8.941645, 320.675659, 20.401545), Vector(243.547455, 340.621796, 20.366534), Vector(-303.660461, 368.756287, 20.359215), Vector(-16.784924, -172.504562, 20.401537)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-88.068008, -407.613770, 25.228033),Angle(0.000, -0.000, 0.000))
SpawnItem('info_player_start', Vector(1382.969971, 1552.940552, 58.064861),Angle(-0.000, -135.000, 0.000))
SpawnItem('info_player_start', Vector(914.486938, 1582.545898, 54.639301),Angle(-0.000, -45.000, 0.000))
SpawnItem('info_player_start', Vector(397.223541, 1737.533569, 33.898609),Angle(0.000, 180.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------

