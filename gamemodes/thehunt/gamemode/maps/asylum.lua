---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( '/../../gamemodes/thehunt/gamemode/maps/basewaves.lua' )
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/cafeteria_table001a.mdl', 'models/props/cs_militia/table_kitchen.mdl', 'models/props_wasteland/kitchen_shelf001a.mdl', 'models/props/cs_office/shelves_metal.mdl', 'models/props_trainstation/bench_indoor001a.mdl'}
ITEMPLACES = {Vector(217.649460, -1677.070923, 89.326477)}
combinespawnzones = {Vector(-973.818665, 276.088226, 65.398499), Vector(-969.011475, -1688.793701, 65.464142)}
zonescovered = {Vector(900.985474, -1703.404785, 64.382431), Vector(-709.762512, -1015.269775, 64.397614), Vector(166.937012, -2.339377, 64.401535), Vector(202.671326, -656.882019, 192.401535), Vector(722.267883, -1037.449341, 192.396179), Vector(-133.288071, -1030.145752, 192.401535), Vector(113.060074, -731.453979, -151.634094), Vector(51.586914, -186.878784, -151.598465)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(1028.358398, -1821.041382, 85.305397),Angle(-0.000, -0.000, 0.000))
SpawnItem('info_player_start', Vector(-72.373825, -450.020020, 212.732590),Angle(0.000, 90.000, 0.000))
SpawnItem('info_player_start', Vector(931.125610, 18.564114, 222.993759),Angle(0.000, -90.000, 0.001))
SpawnItem('item_healthcharger', Vector(575.031250, 471.120331, 240.275497),Angle(0.000, 0.000, 0.000))
SpawnItem('npc_sniper', Vector(-499.846497, -627.489685, 412.031250),Angle(3.398, 177.024, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------

