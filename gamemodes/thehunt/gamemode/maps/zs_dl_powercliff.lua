---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
--CLDARKNESS = 0
MAP_PROPS = {'models/props_wasteland/cafeteria_table001a.mdl', 'models/props_wasteland/kitchen_shelf001a.mdl', 'models/props_wasteland/kitchen_shelf002a.mdl', 'models/props_c17/furnituretable002a.mdl'}
ITEMPLACES = {Vector(-2277.173828, 210.960556, 48.147545)}
combinespawnzones = {Vector(-2378.083008, 2733.885498, 2.332038), Vector(-3233.574219, 2869.694824, 5.008401)}
zonescovered = {Vector(-2669.121094, 1180.627319, 0.399357), Vector(-2956.615234, 128.647827, 0.401537), Vector(-2536.572510, -1002.268005, 0.401537), Vector(-3247.463623, -1301.961304, 0.401537), Vector(-3348.329346, -584.585999, 0.391243), Vector(-4263.151367, -1363.888672, 0.400434), Vector(-2535.335205, -1342.752686, 0.401537), Vector(-3234.218750, -3.229147, 0.401537), Vector(-3500.603760, 131.675995, 0.401549)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-1678.039673, -154.546188, 299.276550),Angle(0.000, 90.000, -0.000))
SpawnItem('info_player_start', Vector(-1955.735962, -222.819016, 24.219822),Angle(-0.000, -0.000, -0.000))
SpawnItem('info_player_start', Vector(-3775.579590, -155.444748, 291.825500),Angle(0.000, 90.000, 0.000))
SpawnItem('npc_stalker',Vector(-3545.837646, -552.193298, 0.093750),Angle(0.000, 146.887, 0.000))
SpawnItem('npc_rollermine',Vector(-2412.250488, -1501.514526, 141.055862),Angle(0.229, -161.803, -0.404))
SpawnTurret(Vector(-2865.176270, -590.681763, 0.762306),Angle(0.317, -58.269, 0.176))
SpawnTurret(Vector(-1660.771484, 695.435059, 0.751662),Angle(0.359, -166.211, 0.801))
SpawnDynamicAmmoCrate(Vector(-2808.373779, -1437.221680, 0.499803),Angle(0.000, 176.364, 0.000))
SpawnDynamicAmmoCrate(Vector(-2813.750244, -1438.247437, 24.991728),Angle(0.001, 175.561, 0.034))
SpawnDynamicAmmoCrate(Vector(-2809.580078, -1431.619507, 49.463047),Angle(-0.126, 173.136, 0.118))
SpawnDynamicAmmoCrate(Vector(-4118.713867, -695.242676, -8.583432),Angle(0.133, 145.307, 177.303))
SpawnDynamicAmmoCrate(Vector(-4004.925537, -302.845886, -33.664600),Angle(-4.566, -80.029, 3.127))
SpawnDynamicAmmoCrate(Vector(-4108.673340, -379.827271, -9.619657),Angle(2.842, 142.552, 178.280))
SpawnItem('npc_sniper', Vector(-2553.160889, 930.777527, 512.952759),Angle(0.000, 90.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------

