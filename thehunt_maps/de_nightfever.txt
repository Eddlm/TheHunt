---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props/cs_office/table_coffee.mdl'}
ITEMPLACES = {Vector(320.284485, 852.979980, 51.822445), Vector(1735.965820, 3153.287842, 192.561249), Vector(2007.494385, 1926.104004, 147.437439), Vector(1578.435181, 1382.278564, 193.356812), Vector(1920.669189, 1822.290405, 147.383698), Vector(2004.582764, 1748.696289, 147.406891), Vector(2139.841797, 1818.484253, 147.434937), Vector(2011.534180, 2245.420654, 188.373672), Vector(2149.691406, 2248.558594, 188.378983), Vector(1902.752197, 3262.323242, 192.555481), Vector(1039.988770, 3856.446289, 203.122833), Vector(698.633606, 3657.708008, 201.772217), Vector(-550.774658, 3451.158691, 60.064915), Vector(-276.958496, 3449.854736, 57.731522), Vector(-359.965546, 3093.300537, 53.670166), Vector(-416.693115, 3145.179443, 52.787926), Vector(-419.997314, 2991.643066, 52.424309), Vector(-519.964050, 3061.618408, 52.682453), Vector(-930.519531, 2334.420166, 69.605904), Vector(-915.181152, 2457.818848, 70.600571), Vector(-979.443420, 2450.825439, 70.565994), Vector(-555.992371, 1896.492798, 53.120579), Vector(144.790558, 1828.604980, 59.559875), Vector(-26.047812, 1827.163452, 60.892948), Vector(478.770416, 234.267944, 60.338379), Vector(-135.232117, -87.643196, 59.723492), Vector(-931.658630, 2478.699219, 205.808365), Vector(-928.490417, 2418.096680, 206.990677), Vector(1795.375244, 1107.445801, 341.996063), Vector(2036.213867, 1108.496338, 340.660492)}
combinespawnzones = {Vector(-1129.469604, 1982.330688, 9.470553), Vector(-1076.645874, 643.142944, 9.489741), Vector(1359.972656, 638.956299, 9.457908)}
zonescovered = {Vector(129.852127, 1049.945435, 16.390791), Vector(611.365723, -136.868881, 16.401537), Vector(2091.532471, 2076.979004, 168.369202), Vector(1734.236816, 3258.095215, 169.401550), Vector(300.377869, 3919.603027, 168.401535), Vector(-580.605896, 3142.649170, 29.377768), Vector(801.997803, 2166.809814, 32.380962), Vector(799.104492, 1478.182861, 32.401539), Vector(-397.926910, 2331.219482, 168.401535), Vector(-755.242676, 2868.263184, 169.401550), Vector(-664.934082, 845.339661, 16.357798)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(706.687439, 956.006653, 200.553925),Angle(0.000, -90.000, 0.000))
SpawnItem('info_player_start', Vector(-1232.920898, 2530.571533, -37.612911),Angle(-0.000, 90.000, -0.000))
SpawnTurret(Vector(1525.433960, 2959.180908, 168.771622),Angle(0.266, 46.544, 0.483))
SpawnTurret(Vector(2356.864258, 2178.429932, 168.768539),Angle(0.305, -122.146, 0.587))
SpawnTurret(Vector(1795.026978, 2117.056396, 168.776703),Angle(0.275, -70.432, 0.231))
SpawnTurret(Vector(1616.385620, 1459.748413, 168.762619),Angle(0.252, 27.948, 0.192))
SpawnTurret(Vector(1641.010620, 1129.482666, 308.750977),Angle(0.346, 68.725, 0.776))
SpawnCeilingTurretStrong(Vector(630.227295, 4023.809814, 391.968750),Angle(0.000, 310.027, 0.000))
SpawnCeilingTurretStrong(Vector(1215.912842, 3754.137451, 391.968750),Angle(0.000, 137.723, 0.000))
SpawnItem('button_turrets',Vector(583.987366, 3729.194580, 212.417038),Angle(1.894, 0.133, 0.277))
SpawnItem('item_healthcharger', Vector(-856.031250, 2365.097900, 62.275494),Angle(0.000, -180.000, 0.000))
SpawnItem('item_healthcharger', Vector(1638.031250, 3634.952637, 220.275497),Angle(0.000, 0.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------
