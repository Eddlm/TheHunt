---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/cafeteria_table001a.mdl', 'models/props_wasteland/cafeteria_bench001a.mdl'}
ITEMPLACES = {Vector(-3503.267334, -318.975677, 80.036530), Vector(-3354.557373, -647.217773, 79.954239), Vector(-380.538116, -373.039276, 80.976166), Vector(-2196.166992, -1220.461426, 336.025330)}
combinespawnzones = {Vector(-556.704956, -1170.542603, 51.500530), Vector(-543.103210, -864.409302, 51.492802)}
zonescovered = {Vector(-1028.204102, 135.041977, 50.401535), Vector(-2594.536621, -394.754089, 50.401535), Vector(-3417.467773, -82.050377, 50.401535), Vector(-3059.173828, -640.864441, 50.401539), Vector(-3180.565674, -848.019470, 50.401535), Vector(-2443.167725, -1273.103394, 306.401550), Vector(-3604.151855, -750.755981, 50.401535), Vector(-4018.721436, -875.116394, 306.401550), Vector(-4351.326660, -232.601669, 320.367798), Vector(-2005.897827, 641.502747, 50.401539), Vector(-1679.180786, -307.903473, 50.377819), Vector(-2040.761108, -13.825448, 50.368744)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-3580.615234, -353.192810, 204.297913),Angle(-0.000, 135.000, 0.000))
SpawnItem('info_player_start', Vector(-3101.327637, -868.054016, 78.410637),Angle(-0.000, 180.000, -0.000))
SpawnItem('info_player_start', Vector(-1591.446899, 134.571243, 71.343224),Angle(0.000, 45.000, 0.000))
SpawnItem('info_player_start', Vector(-3626.002441, -1687.572632, 333.037933),Angle(0.000, 45.000, 0.000))
SpawnCeilingTurretStrong(Vector(-1029.081055, 262.371216, 305.968750),Angle(0.000, 198.428, 0.000))
SpawnCeilingTurretStrong(Vector(-1275.465088, -34.938538, 305.968750),Angle(0.000, 90.424, 0.000))
SpawnItem('button_turrets',Vector(-1163.964600, 323.005127, 81.161720),Angle(0.000, -90.000, 0.000))
SpawnItem('item_healthcharger', Vector(-3303.207764, -1565.968750, 360.275513),Angle(0.000, 90.000, 0.000))
SpawnItem('item_healthcharger', Vector(-1361.840332, 282.030548, 100.980682),Angle(0.000, 0.000, 0.000))
SpawnSuitCharger(Vector(-1359.968750, 76.403732, 104.099899),Angle(0.000, 0.000, 0.000))
SpawnItem('npc_sniper', Vector(2671.119873, 922.285950, 93.428932),Angle(0.000, -180.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------

