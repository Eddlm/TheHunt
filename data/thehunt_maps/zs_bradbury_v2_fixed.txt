---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props/cs_office/shelves_metal1.mdl', 'models/props_c17/bench01a.mdl'}
ITEMPLACES = {Vector(-473.286957, 121.292137, 476.243744), Vector(-825.857483, 14.362099, 497.151764), Vector(1246.468140, 1439.288818, 100.132370)}
combinespawnzones = {Vector(243.421768, -196.423462, -206.527802), Vector(-443.957855, 1538.878784, -206.537689)}
zonescovered = {Vector(-59.473183, 1005.714172, 640.401550), Vector(576.634460, 962.845398, 640.401550), Vector(-59.689266, 956.115112, 448.401550), Vector(610.449158, 968.783386, 448.401550), Vector(575.300842, 948.881958, 256.401550), Vector(-27.006514, 945.658447, 256.401550), Vector(44.722244, 886.280762, 64.401535), Vector(457.138275, 894.264343, 64.401535), Vector(285.661316, 1942.455688, 74.269753), Vector(286.821960, 1991.094482, 640.355652), Vector(299.543854, 2001.143555, 448.360687), Vector(290.511871, 1968.729248, 256.398254), Vector(280.513214, 34.827965, 256.312347), Vector(278.732330, 49.018867, 448.401550), Vector(275.763641, 60.824726, 640.365356), Vector(-463.335785, 426.597992, 448.401550), Vector(-392.637543, -255.930573, 448.401550), Vector(-45.940372, 1530.173218, -207.598450), Vector(873.110962, 1746.981689, -479.598450)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(841.896545, 1954.234619, -456.491608),Angle(0.000, -90.002, -0.000))
SpawnItem('info_player_start', Vector(1305.879517, 1096.004395, 88.606041),Angle(-0.000, -180.000, -0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------
