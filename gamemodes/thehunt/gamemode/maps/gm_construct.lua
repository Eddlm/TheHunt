---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_junk/trashdumpster01a.mdl'}
ITEMPLACES = {Vector(1161.270508, -926.288147, -138.882324)}
combinespawnzones = {Vector(1465.327148, -2273.009033, -142.512619), Vector(1602.902222, -3501.244873, 46.283997)}
zonescovered = {Vector(-55.510147, -1568.147583, -143.598465), Vector(-1585.921265, -2766.752197, 256.401550), Vector(-2541.316895, -1354.667236, 240.401535), Vector(-1742.906860, 752.040466, -147.598495)}
HELIPATHS = {Vector(-325.043365, -423.343994, 371.999878),Vector(-1001.143738, 1457.182617, 378.063660),Vector(-3887.531982, 2021.692139, 488.340027),Vector(-3962.098145, -174.654358, 672.136963),Vector(-3339.290527, -1557.702759, 760.031250),Vector(-1931.956909, -1568.955322, 760.031250),Vector(-4695.130371, -3190.752441, 770.000000),Vector(1218.770386, 2416.383301, 488.031250),Vector(1503.493896, 5379.110352, 488.031250),Vector(537.943909, 4221.788086, 488.031250),Vector(-2881.849365, 6098.828125, 426.062286),Vector(-2737.549316, 5190.191895, 163.847763),Vector(-5042.747559, 3780.553955, 479.065216),Vector(-3135.297852, 3749.561523, 261.419556),}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(1186.496460, 298.777924, -119.283257),Angle(-0.000, -90.000, -0.000))
SpawnItem('info_player_start', Vector(1083.887817, -169.954895, -114.260788),Angle(-0.000, -45.000, 0.000))
SpawnProp(Vector(1194.595215, 763.952820, -118.379196),Angle(-0.058, -0.042, 0.001),'models/props_junk/trashdumpster01a.mdl')
SpawnProp(Vector(996.602722, -61.165249, -118.356621),Angle(0.140, -179.939, 0.015),'models/props_junk/trashdumpster01a.mdl')
SpawnAmmoCrate(Vector(-1082.877563, -1002.350891, -127.500473),Angle(-0.000, 90.052, 0.000),3)
SpawnItem('npc_sniper', Vector(724.031250, -1594.514160, 1158.046265),Angle(0.000, 180.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------
