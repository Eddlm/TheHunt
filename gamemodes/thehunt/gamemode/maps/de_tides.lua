include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_trainstation/bench_indoor001a.mdl'}
ITEMPLACES = {Vector(562.936768, 660.642883, -107.182846), Vector(801.921997, -169.763428, -109.261635), Vector(1021.526001, -1744.840210, 18.764889), Vector(566.569641, -1739.209839, 19.551371), Vector(-1087.296997, -1616.043823, -51.901340)}
combinespawnzones = {Vector(-1065.305054, 1174.945801, -94.516098), Vector(-1432.619751, -425.391357, -14.530712)}
zonescovered = {Vector(466.428894, -452.093414, 0.401537), Vector(-1163.727661, -1408.280518, -123.083542), Vector(-1088.095337, -406.392639, -4.286134), Vector(-835.297668, 1014.695618, -95.617409)}
zonescovered = {Vector(466.428894, -452.093414, 0.401537), Vector(-1163.727661, -1408.280518, -123.083542), Vector(-1088.095337, -406.392639, -4.286134), Vector(-835.297668, 1014.695618, -95.617409)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-1097.290649, -393.028534, -124.827087),Angle(0.000, -90.000, -0.000))
SpawnItem('info_player_start', Vector(-1590.719727, 665.128845, -15.798655),Angle(-0.000, -0.000, -0.000))
SpawnItem('info_player_start', Vector(676.833679, -435.823059, -100.543747),Angle(0.000, -90.000, -0.000))
SpawnProp(Vector(-1435.295532, 818.228149, -40.962257),Angle(8.769, -90.553, -3.535),'models/props_trainstation/bench_indoor001a.mdl')

end
---------------------- END OF CONFIGURATION FILE ----------------------
