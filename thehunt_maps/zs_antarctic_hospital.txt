---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/controlroom_desk001a.mdl', 'models/props_wasteland/kitchen_counter001d.mdl', 'models/props_wasteland/kitchen_shelf001a.mdl', 'models/props_c17/bench01a.mdl', 'models/props_wasteland/laundry_cart001.mdl', 'models/props_wasteland/laundry_cart002.mdl'}
ITEMPLACES = {Vector(-310.411743, 548.826050, 70.688103)}
combinespawnzones = {Vector(317.388824, 575.915283, 33.499802)}
zonescovered = {Vector(828.899414, -789.851868, 32.401539), Vector(-515.163635, -313.838593, 32.401539), Vector(7.335999, -572.919800, 176.401535), Vector(12.289578, -1214.128540, 176.401535)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(472.079376, -724.192200, 59.938560),Angle(0.000, 45.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------
