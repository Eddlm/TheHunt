---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/cafeteria_table001a.mdl', 'models/props_junk/trashdumpster01a.mdl', 'models/props_combine/health_charger001.mdl'}
ITEMPLACES = {Vector(-371.462646, -129.331665, 58.880798)}
combinespawnzones = {Vector(-2494.333008, 1111.719238, 17.448656), Vector(-2507.098145, 1455.238770, 17.459398), Vector(-445.334412, 3541.483398, 17.500414), Vector(-36.244473, 3536.202637, 17.465651)}
zonescovered = {Vector(-421.797119, 1516.283081, 16.401537), Vector(-1121.884888, 2301.411133, 8.401537), Vector(-1409.211914, 1266.742310, 8.401537), Vector(-270.863617, 299.511841, 8.401537), Vector(376.692780, 997.493530, 16.379738), Vector(761.283813, 513.385010, 8.401537), Vector(751.214783, 1487.081299, 8.362456), Vector(703.994629, 2333.431641, 8.368332), Vector(-208.293961, 2274.082520, 8.357063)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(1366.644897, 1541.294922, 39.009129),Angle(-0.000, -89.999, 0.000))
SpawnItem('info_player_start', Vector(314.229034, 1891.268066, 44.353607),Angle(-0.000, -0.000, -0.000))
SpawnItem('info_player_start', Vector(-40.848167, 2751.187500, 40.529617),Angle(-0.000, -90.000, -0.000))
SpawnItem('info_player_start', Vector(-1499.028931, 2536.941650, 37.217110),Angle(-0.000, -90.000, -0.000))
SpawnItem('item_healthcharger', Vector(-920.540344, 1663.968750, 68.275490),Angle(0.000, -90.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------

