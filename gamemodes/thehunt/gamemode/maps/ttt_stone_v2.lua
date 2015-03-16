---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( '/../../gamemodes/thehunt/gamemode/maps/basewaves.lua' )
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_c17/furnituretable001a.mdl'}
ITEMPLACES = {Vector(-109.078072, 2504.401123, 179.841248), Vector(154.565262, 1630.511475, 180.028503), Vector(-403.521210, 1506.922119, 179.860535), Vector(-438.187958, 613.232971, 307.838562), Vector(-607.325562, 242.663681, 245.103134), Vector(-437.991943, -712.409790, 52.944553)}
combinespawnzones = {Vector(1980.711670, 1954.018555, 129.444717), Vector(1987.310913, 1733.789673, 129.476379)}
zonescovered = {Vector(1304.797974, 1820.015869, 128.401535), Vector(-180.678116, -590.699158, 0.401537), Vector(-396.199371, 1239.543457, 384.401550), Vector(127.648079, 2411.204102, 128.357101), Vector(56.664288, -20.847315, -9.572457), Vector(-893.095947, 1625.777344, 128.401535), Vector(-749.717468, 2567.017334, 320.401550), Vector(-363.382690, 133.517197, 192.401535)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-936.228516, 2481.632813, 503.252014),Angle(-0.000, -0.000, -0.000))
SpawnItem('info_player_start', Vector(-298.167053, 2227.987305, 155.101974),Angle(-0.000, 0.000, 0.000))
SpawnItem('info_player_start', Vector(-930.815186, 1304.126099, 151.985764),Angle(-0.000, 90.000, 0.000))
SpawnItem('weapon_shotgun',Vector(-342.928955, 1048.127197, 406.894226),Angle(1.626, 3.097, -93.028))
SpawnItem('item_healthcharger', Vector(188.629547, 643.968750, 306.275513),Angle(0.000, -90.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------

