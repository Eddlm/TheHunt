---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( "basewaves.lua" )
CombineFirstWave = 10
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 20
CombineFifthWave = 20
CombineInfiniteWave = 30
MAP_PROPS = {}
ITEMPLACES = {Vector(-854.889893, 2448.124268, -25.861612), Vector(-2060.919189, 2852.168213, 93.438995), Vector(-1575.842041, 2765.867920, 63.396687), Vector(-1186.610107, 2074.747070, 53.131519), Vector(-1098.489868, 1484.960205, -51.874439), Vector(181.115601, -116.503281, 66.149857), Vector(-1649.027466, -200.255096, 190.126526), Vector(-1832.300171, 547.854248, 72.124466), Vector(-1533.089233, 668.227844, 57.335384), Vector(-1323.119263, 1233.432251, 92.104378),Vector(-489.099335, -164.609100, 67.847298), Vector(488.042816, 1988.969360, 157.197327), Vector(370.535309, 2737.084961, 138.907852)}
combinespawnzones = {Vector(-2067.847900, -804.533020, 132.971039), Vector(261.949982, -775.886475, 5.633600), Vector(628.631287, -338.551514, 7.678342), Vector(1433.838867, 2933.048096, 131.895035), Vector(-2065.995361, 2214.928955, 3.827857), Vector(1448.728394, 231.267136, -186.743713)}
zonescovered = {Vector(-1618.591675, 1112.769897, 32.397675), Vector(-1547.833496, -513.919128, 130.386688), Vector(435.519409, -61.879372, 10.994057), Vector(1078.428223, 895.115723, 2.881274), Vector(1134.773926, 2645.196533, 96.401543)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-2073.240723, 2942.409180, 56.960522),Angle(-0.000, -90.003, -0.000))
SpawnItem('info_player_start', Vector(-1431.749390, 2694.053711, 24.693136),Angle(-0.000, -90.000, 0.001))
SpawnItem('info_player_start', Vector(1134.529541, 2423.457764, 117.625816),Angle(0.000, -90.000, 0.000))
SpawnItem('info_player_start', Vector(540.094910, 353.288330, 36.082737),Angle(-0.000, 90.000, -0.000))
SpawnItem('info_player_start', Vector(-1388.057251, -4.044775, 30.254705),Angle(0.902, 90.060, 0.582))
end
---------------------- END OF CONFIGURATION FILE ----------------------
