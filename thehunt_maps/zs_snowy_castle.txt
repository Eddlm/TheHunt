---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/cafeteria_bench001a.mdl', 'models/props_wasteland/prison_bedframe001b.mdl', 'models/props_c17/furnituredrawer001a.mdl', 'models/props_wasteland/cafeteria_table001a.mdl', 'models/props_interiors/furniture_desk01a.mdl', 'models/props_c17/shelfunit01a.mdl'}
ITEMPLACES = {}
combinespawnzones = {Vector(1827.714844, 1187.326294, -1022.498657)}
zonescovered = {Vector(1176.123291, 2807.665771, -255.598465), Vector(533.990051, 4061.864258, -255.598465), Vector(725.686279, 4060.658447, 0.353055), Vector(-283.214355, 3620.048096, 0.401537)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(2305.069580, 3642.686768, 29.722887),Angle(0.000, -135.000, -0.000))
SpawnItem('info_player_start', Vector(628.177307, 2036.296997, -222.733368),Angle(-0.000, 180.000, 0.001))
SpawnItem('info_player_start', Vector(276.136292, 1827.821899, -672.311707),Angle(-0.000, 180.000, -0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------
