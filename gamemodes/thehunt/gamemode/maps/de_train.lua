---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/laundry_cart002.mdl', 'models/props_trainstation/benchoutdoor01a.mdl','models/props_wasteland/kitchen_shelf002a.mdl'}
ITEMPLACES = {Vector(-1623.945435, 1620.066284, -189.233459),Vector(-888.505859, 756.167236, 78.152405), Vector(-890.759949, 884.608337, 78.153259), Vector(-745.396057, 407.983063, 50.804699)}
combinespawnzones = {Vector(1445.516602, 1582.675293, -222.590576)}
zonescovered = {Vector(-1732.100952, 1402.302124, -227.953171), Vector(170.486710, 61.308701, -215.622513), Vector(-154.821671, -1404.090820, -351.598450), Vector(1918.471191, 217.934555, -215.598465)}
zonescovered = {Vector(-1732.100952, 1402.302124, -227.953171), Vector(170.486710, 61.308701, -215.622513), Vector(-154.821671, -1404.090820, -351.598450), Vector(1918.471191, 217.934555, -215.598465)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(1943.598633, -1450.663086, -263.619812),Angle(0.071, 103.297, 0.020))
SpawnItem('info_player_start', Vector(977.952454, 1764.395264, -227.523148),Angle(-0.091, -81.782, 0.021))
SpawnProp(Vector(399.996307, -661.798645, -200.450165),Angle(-0.023, 89.990, -0.031),'models/props_wasteland/laundry_cart002.mdl')
SpawnProp(Vector(-1033.528320, -1448.767578, -151.617233),Angle(-0.068, 2.833, -0.002),'models/props_wasteland/kitchen_shelf002a.mdl')
SpawnProp(Vector(144.207932, 1399.630005, -194.431931),Angle(-0.030, 0.043, -0.047),'models/props_wasteland/laundry_cart002.mdl')

end
---------------------- END OF CONFIGURATION FILE ----------------------
