---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/kitchen_shelf001a.mdl'}
ITEMPLACES = {Vector(-2205.325439, 2469.574951, 1086.038330), Vector(-2433.593262, 1426.716309, 1069.078735), Vector(-1669.202148, 1454.069580, 1147.344727), Vector(-2095.444092, 2089.666260, 1073.128052), Vector(-2913.476563, 1778.500000, 942.127563), Vector(-2983.637939, 3148.878662, 935.127869), Vector(-2770.017090, 3146.913574, 933.844360), Vector(-1694.138306, 3243.882568, 1061.130493)}
combinespawnzones = {Vector(-1404.434814, 1491.615845, 906.649841)}
zonescovered = {Vector(-1044.134644, 2270.783447, 888.373657), Vector(-2105.689697, 2704.589111, 824.401550), Vector(-2125.030029, 1912.919922, 1032.401489), Vector(-1455.664063, 2366.762451, 1016.318542), Vector(-2672.483887, 2198.074707, 1016.401550), Vector(-3032.587646, 2335.666504, 888.344238)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-1726.571533, 3254.165039, 1085.185059),Angle(0.000, -90.000, -0.000))
SpawnItem('info_player_start', Vector(-1604.316895, 1656.149170, 1166.771240),Angle(-0.000, 180.000, -0.000))
SpawnItem('info_player_start', Vector(-3162.243896, 1600.830811, 811.279785),Angle(0.000, -180.000, -0.000))
SpawnItem('info_player_start', Vector(-3536.209961, 1866.488892, 794.636475),Angle(0.000, -0.000, 0.000))
SpawnProp(Vector(-2073.974121, 1716.540771, 1059.921143),Angle(-0.218, 78.897, -0.000),'models/props_wasteland/controlroom_desk001a.mdl')
SpawnTurret(Vector(-3192.028320, 3277.167969, 888.679504),Angle(0.245, -42.987, 0.435))
SpawnTurret(Vector(-1900.188965, 2407.741455, 1032.755005),Angle(0.247, -135.117, 0.227))
SpawnCeilingTurretStrong(Vector(-1145.547974, 1879.399658, 1015.968750),Angle(0.000, 203.758, 0.000))
SpawnCeilingTurretStrong(Vector(-1538.565186, 1880.682007, 1015.968750),Angle(0.000, 321.416, 0.000))
SpawnItem('button_turrets',Vector(-1454.147583, 1564.805542, 934.049255),Angle(-0.000, -0.000, 0.000))
SpawnItem('item_healthcharger', Vector(-1922.235229, 2213.968750, 1088.275513),Angle(0.000, -90.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------

